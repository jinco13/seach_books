class BooksController < ApplicationController
  include RespondToMobileRequests
  before_action :check_library

  def search
    if params[:title]
      session[:search_title] = params[:title]
    end
    @searchstr = params[:title]
    @list = SearchService.search(session[:search_title], session[:mylib])
    respond_to do |format|
      format.html.mobile
      format.html
    end
  end

  def index
    @list = []
    render :search
    respond_to do |format|
      format.html.mobile
      format.html
    end
  end

  private
  def check_library
    redirect_to '/library', flash: {info: '図書館を選択してください'} if session[:mylib] == nil
  end
end
