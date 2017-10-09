class BooksController < ApplicationController
  def search
    @searchstr = params[:title]
    books = RakutenWebService::Books::Book.search(title: @searchstr)
    calil = CalilApi::Book.new
    tosho = calil.search(books.collect{|b|b.isbn}, ['Tokyo_Setagaya'])
    @list = []
    tosho.each do |b|
      @list.push({
        :title => books.find{|r|r.isbn==b.isbn}.title,
        :isbn => b.isbn,
        #:reservable => b.reservable?,
        :url => b.libraries[0].url
      })
    end
    puts @list
    @list
  end

  def index
  end
end
