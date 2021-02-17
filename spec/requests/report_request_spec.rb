require 'rails_helper'

RSpec.describe "Reports", type: :request do
    it "returns http success" do
        get "/report"
        expect(response.status).to eq(200)
    end

end
