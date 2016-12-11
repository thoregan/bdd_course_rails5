require "rails_helper"

feature "Creating Articles" do
  scenario "A user creates a new article" do
    #exercise

    visit root_path

    click_link "New Article"

    fill_in "Title", with: "Creating a blog"
    fill_in "Body", with: "Lorem ipsum ..."

    click_button "Create Article"

    # result
    expect(page).to have_content("Article has ben created")
    expect(page.current_path).to eq(articles_path)
  end
end