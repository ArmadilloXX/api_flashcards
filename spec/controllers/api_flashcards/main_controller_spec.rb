require "rails_helper"

module ApiFlashcards
  RSpec.describe MainController, type: :controller do
  #   routes { ApiFlashcards::Engine.routes }
  #   let!(:user) do
  #     User.create(email: "test@test.com",
  #                 password: "12345",
  #                 password_confirmation: "12345")
  #   end
  #   let(:not_authorized) { {message: "Not authorized"}.to_json }

  #   def encode(email, password)
  #     ActionController::HttpAuthentication::Basic.encode_credentials(email,
  #                                                                    password)
  #   end

  #   shared_examples "unauthorized" do
  #     it "returns 401 status code" do
  #       expect(response.status).to eq(401)
  #     end
  #     it "returns 'Not authorized' in response body" do
  #       expect(response.body).to eq(not_authorized)
  #     end
  #   end

  #   describe "GET #welcome" do
  #     context "no credentials" do
  #       before { get :welcome }
  #       it_behaves_like "unauthorized"
  #     end

  #     context " with incorrect credentials" do
  #       before do
  #         get :welcome,
  #             request.headers["Authorization"] = encode("some@test.com",
  #                                                       "nopass")
  #       end
  #       it_behaves_like "unauthorized"
  #     end

  #     context "with correct credentials" do
  #       before do
  #         get :welcome,
  #             request.headers["Authorization"] = encode("test@test.com",
  #                                                       "12345")
  #       end
  #       it "returns 200 status code" do
  #         expect(response.status).to eq(200)
  #       end
  #     end
  #   end
  end
end
