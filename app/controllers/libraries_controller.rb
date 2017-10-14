class LibrariesController < ApplicationController
  def search
    session[:mylib] = nil
    @pref_options = ['埼玉県','東京都','神奈川県']
    @city = params[:city]
    @pref = params[:pref]
    @libraries = []
    if @city and @pref
      @libraries = CalilApi::Library.search(:pref => @pref, :city => @city)
    end
  end

  def select_library
    libs = params['lib']
    if libs
      session[:mylib] = libs.uniq.join(";")
      flash.now[:info] = '図書館を登録しました'
    end
    redirect_to '/'
  end
end
