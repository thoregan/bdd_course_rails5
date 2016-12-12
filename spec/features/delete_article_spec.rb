require 'rails_helper'

feature "Deleting an Article" do
  before do
    @article = Article.create(title: "Title One", body: "Body of article one")
  end

  scenario "A user delete an article" do
    visit root_path

    click_link @article.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end
end