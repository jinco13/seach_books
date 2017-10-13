require 'rails_helper'

feature "library search" do
  scenario "user search for library near by" do
    visit '/library'
    fill_in 'city', with: "上尾"
    select '埼玉県', from: 'pref'
    click_on '検索'
    expect(page).to have_content('たちばな')
  end
end
