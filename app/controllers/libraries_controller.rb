class LibrariesController < ApplicationController
  include RespondToMobileRequests

  def search
    @pref_options = ['埼玉県','東京都','神奈川県']
    @city = params[:city]
    @pref = params[:pref]
    @libraries = []
    if @city and @pref
      @libraries = CalilApi::Library.search(:pref => @pref, :city => @city)
    end
    respond_to do |format|
      format.html.mobile
      format.html
    end
  end

  def select_library
    mylib, name = params['mylib'].split(";")
    if mylib
      session[:mylib] = [mylib]
      session[:mylib_name] = name
    end
    redirect_to '/', flash: {info: "#{name}を検索先として登録しました。"}
  end
end
