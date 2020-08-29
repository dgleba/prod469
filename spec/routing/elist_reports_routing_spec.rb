require "rails_helper"

RSpec.describe ElistReportsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/elist_reports").to route_to("elist_reports#index")
    end

    it "routes to #new" do
      expect(:get => "/elist_reports/new").to route_to("elist_reports#new")
    end

    it "routes to #show" do
      expect(:get => "/elist_reports/1").to route_to("elist_reports#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/elist_reports/1/edit").to route_to("elist_reports#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/elist_reports").to route_to("elist_reports#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/elist_reports/1").to route_to("elist_reports#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/elist_reports/1").to route_to("elist_reports#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/elist_reports/1").to route_to("elist_reports#destroy", :id => "1")
    end

  end
end
