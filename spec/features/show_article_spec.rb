require "rails_helper"

feature "show article" do
  before do
    john = User.create(email: "john@example.com", password: "password")
    login_as(john)

    @article = Article.create(title: "A article title", body: "A cool article body", user: john)
  end

  scenario "A user shows an article" do
    visit root_path

    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)

    expect(current_path).to eq(article_path(@article))
  end
end