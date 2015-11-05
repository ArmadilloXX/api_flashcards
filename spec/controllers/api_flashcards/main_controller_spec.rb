require "rails_helper"

module ApiFlashcards
  RSpec.describe MainController, type: :controller do
    routes { ApiFlashcards::Engine.routes }
    let!(:user) do
      User.create(email: "test@test.com",
                  password: "123456",
                  password_confirmation: "123456")
    end

    def encode(email, password)
      ActionController::HttpAuthentication::Basic.encode_credentials(email,
                                                                     password)
    end

    shared_examples "unauthorized" do
      it "returns 401 status code" do
        expect(response.status).to eq(401)
      end
      it "returns 'Bad credentials' in response body" do
        expect(response.body).to eq("Bad credentials")
      end
    end

    describe "GET #welcome" do 
      context "no credentials" do
        before { get :welcome }
        it_behaves_like "unauthorized"
      end

      context " with incorrect credentials" do
        before do 
          get :welcome,
              request.headers["Authorization"] = encode("some@test.com",
                                                        "nopass")
        end
        it_behaves_like "unauthorized"
      end

      context "with correct credentials" do
        before do
          get :welcome,
              request.headers["Authorization"] = encode("test@test.com",
                                                        "123456")
        end
        it "returns 200 status code" do
          expect(response.status).to eq(200)
        end
      end
    end

  end
end
