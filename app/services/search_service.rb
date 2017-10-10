module SearchService
  module_function

  def search(params)
    books = RakutenWebService::Books::Book.search(title: params)
    isbns = books.collect{|b|b.isbn}
    calil = CalilApi::Book.new
    tosho = calil.search(isbns, ['Tokyo_Setagaya'])
    list = []
    tosho.each do |b|
      list.push({
        :title => books.find{|r|r.isbn==b.isbn}.title,
        :isbn => b.isbn,
        :img => books.find{|r|r.isbn==b.isbn}.small_image_url,
        #:reservable => b.reservable?,
        :url => b.libraries[0].url
      })
    end
    return list
  end

end
