require 'rails_helper'

RSpec.describe BooksController, type: :controller do

  describe "GET #search" do
    before do
      allow(SearchService).to receive(:search).and_return([])
    end

    it "returns http success" do
      get :search
      expect(response).to have_http_status(:success)
    end
  end

end
