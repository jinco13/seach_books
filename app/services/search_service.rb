module SearchService
  class Book
    attr_reader :url, :title, :author, :publisher, :isbn, :small_img, :large_img, \
          :price, :rb_url, :review_count, :review_avg

    def initialize(rws_book, url)
      @url           = url
      @title         = rws_book.title
      @author        = rws_book.author
      @publisher     = rws_book.publisher_name
      @isbn          = rws_book.isbn
      @small_img     = rws_book.small_image_url
      @large_img     = rws_book.large_image_url
      @price         = rws_book.item_price
      @rb_url        = rws_book.item_url
      @review_count  = rws_book.review_count
      @review_avg    = rws_book.review_average
    end

    def asin
      digits = isbn.slice(3,9).split("")
      sum = 0

      (0..9).each do |i|
        sum += digits[i].to_i * (10 - i)
      end

      chk_tmp = 11 - (sum % 11)
      chk_digit = ""

      if chk_tmp == 10
        chk_digit = 'x'
      elsif chk_tmp == 11
        chk_digit = 0
      else
        chk_digit = chk_tmp
      end

      digits.push(chk_digit)
      return digits.join("")
    end

  end

  module_function

  def search(params, libs)
    list = []

    books = RakutenWebService::Books::Book.search(title: params)
    tosho = CalilApi::Book.search(books.collect{|b|b.isbn}, libs.split(';'))

    books.each do |b|
      url = tosho.find(Proc.new{""}){|t|t.isbn==b.isbn}.url
      list.push(SearchService::Book.new(b, url))
    end
    return list
  end

end
