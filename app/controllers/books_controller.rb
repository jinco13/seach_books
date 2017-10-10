class BooksController < ApplicationController
  def search
    @searchstr = params[:title]
    @list = SearchService.search(@searchstr)
  end

  def index
  end
end
