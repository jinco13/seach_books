class BooksController < ApplicationController
  
  def search
    if params[:title]
      session[:search_title] = params[:title]
    end
    @searchstr = params[:title]
    @list = SearchService.search(session[:search_title])
  end

  def index
  end
end
