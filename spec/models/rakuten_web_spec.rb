require 'rails_helper'

describe RakutenWeb do
  before do
    RakutenWebService.configure do |c|
    #  c.affiliate_id = ENV['RAKUTEN_AFFI']
    #  c.application_id = ENV['RAKUTEN_DEVID']
    end
  end

  it "is valid client" do
    #books = RakutenWebService::Books::Book.search(title: '安藤忠雄')
    #isbns = books.collect{|b|b.isbn}
    #puts isbns
    #b = CalilApi::Book.new
    #tosho = b.search(isbns, ['Tokyo_Setagaya'])
    #tosho.each do |b|
    #  puts books.find{|r|r.isbn==b.isbn}.title
    #  puts b.isbn
    #  puts b.reservable?
    #  puts b.libraries[0].url
    #  puts "======================================================="
    #end
    #expect(books.count).to eq(5)
  end
end
