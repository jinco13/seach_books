require 'rails_helper'
require 'hashie'

describe "Search Service" do
  it "should be able to instanciate" do
    expect(SearchService).not_to eq(nil)
  end

  context "searching for book" do
    let(:calil){ CalilApi::Book.new }
    # return Hashie::Mash object to allow dot access to variable
    let(:books){ [
      Hashie::Mash.new( { :title=>"ハーバード集中力革命",
        :isbn=>"9784763135209",
        :img=>"http://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/5209/9784763135209.jpg?_ex=64x64",
      }),
      Hashie::Mash.new( { :title=>"話す技術・聞く技術",
        :isbn=>"9784532318420",
        :img=>"http://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/8420/9784532318420.jpg?_ex=64x64",
      })
    ]}
    let(:calil_result) {[
      Hashie::Mash.new({:isbn=>"9784532318420",
       :url=>"http://libweb.city.setagaya.tokyo.jp/clis/detail?NUM=005171917&CTG=1&RTN=01&TM=055221050"}),
      Hashie::Mash.new({:isbn=>"9784763135209",
       :url=>"http://libweb.city.setagaya.tokyo.jp/clis/detail?NUM=005746444&CTG=1&RTN=01&TM=055220810"})
    ]}

    before do
      allow(RakutenWebService::Books::Book).to receive(:search).and_return(books)
      allow(CalilApi::Book).to receive(:search).and_return(calil_result)
    end

    it "should be able to search books from search service" do
      result = SearchService.search("ハーバード")
      expect(result.count).to eq(2)
    end

    it "should convert isbn13 to isbn10 for amazon url" do
      result = SearchService.search("ハーバード")
      expect(result[0].asin).to eq("4763135201")
    end

    it "should convert isbn13 to isbn10 for amazon url" do
      result = SearchService.search("ハーバード")
      expect(result[1].asin).to eq("4532318424")
    end
  end
end
