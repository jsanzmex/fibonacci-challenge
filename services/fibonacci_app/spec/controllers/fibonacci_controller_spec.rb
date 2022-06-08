RSpec.describe FibonacciController do
  describe "GET show" do
    it "returns 200" do
      get :show, params: {position: 3}
      expect(response).to have_http_status(:ok)
    end
    # it "returns 500 if a non-digit is passed" do
    #   get :show, params: {position: 'a'}
    #   expect(response).to have_http_status(:error)
    # end
  end
end