RSpec.describe FibonacciController do
  describe "GET show" do

    let(:valid_request) do
      lambda do
        get :show, params: {position: 3}
      end
    end

    it "returns 200 and nth Fibonacci number" do
      valid_request.call
      expect(response).to have_http_status(:ok)
      expect(response.body).to eql({"value": 2}.to_json)
    end
  end
end