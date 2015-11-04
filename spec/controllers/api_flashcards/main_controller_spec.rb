require "rails_helper"

module ApiFlashcards
  RSpec.describe MainController, type: :controller do
    routes { ApiFlashcards::Engine.routes }

    shared_examples 'unauthorized' do
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
        before { get :welcome, request.headers["Authorization"] = "incorrect" }
        it_behaves_like "unauthorized"
      end

      context "with correct credentials" do
        before { get :welcome, request.headers["Authorization"] = "Basic YTpi" }
        it "returns 200 status code" do
          expect(response.status).to eq(200)
        end
      end
    end

  end
end
