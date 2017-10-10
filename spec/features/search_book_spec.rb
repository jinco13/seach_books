require 'rails_helper'

feature "search books" do
  xscenario "user search books on '安藤忠雄' " do
    visit '/'
    fill_in "title", with: "安藤忠雄"
    click_on "検索"
    expect(page).to have_content("安藤忠雄")
  end
end
