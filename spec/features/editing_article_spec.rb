require 'rails_helper'

feature "Editing an article" do
  before do
    @article = Article.create(title: "Title One", body: "Body of article one")
  end

  scenario "A user updates an article" do
    visit root_path

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: "Updated Title"
    fill_in "Body", with: "Updated Body of Article"
    click_button "Update Article"

    expect(page).to have_content("Article has been updated")
    expect(page.current_path).to eq(article_path(@article))
    expect(page).to have_content("Updated Title")
    expect(page).to have_content("Updated Body of Article")
  end

  scenario "A user fails to update an article" do
    visit root_path

    click_link @article.title
    click_link "Edit Article"

    fill_in "Title", with: ""
    fill_in "Body", with: "Updated Body of Article"
    click_button "Update Article"

    expect(page).to have_content("Article has not been updated")
    expect(page.current_path).to eq(article_path(@article))
  end
end