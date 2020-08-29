require 'rails_helper'

RSpec.describe "ElistReports", type: :request do
  describe "GET /elist_reports" do
    it "works! (now write some real specs)" do
      get elist_reports_path
      expect(response).to have_http_status(200)
    end
  end
end
