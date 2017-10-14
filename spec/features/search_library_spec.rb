require 'rails_helper'
require 'hashie'

feature "library search" do
  context "user searching for library" do
    before do
      allow(CalilApi::Library).to receive(:search).and_return([
        Hashie::Mash.new({systemid: 'Library1', short: 'たちばな', address: '埼玉県', url_pc: 'http://lib.com', libid: 1}),
        Hashie::Mash.new({systemid: 'Library2', short: '上尾分館', address: '埼玉県', url_pc: 'http://lib.com', libid: 2})
        ])
    end

    scenario "find library near by" do
      visit '/library'
      fill_in 'city', with: "上尾"
      select '埼玉県', from: 'pref'
      click_on '検索'
      expect(page).to have_content('たちばな')
      expect(page).to have_content('上尾分館')
    end

    scenario "user search for library near by" do
      visit '/library'
      fill_in 'city', with: "上尾"
      select '埼玉県', from: 'pref'
      click_on '検索'
      check 'lib_1'
    end
  end

end
