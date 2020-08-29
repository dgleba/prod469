require "rails_helper"

RSpec.describe ElistsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/elists").to route_to("elists#index")
    end

    it "routes to #new" do
      expect(:get => "/elists/new").to route_to("elists#new")
    end

    it "routes to #show" do
      expect(:get => "/elists/1").to route_to("elists#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/elists/1/edit").to route_to("elists#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/elists").to route_to("elists#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/elists/1").to route_to("elists#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/elists/1").to route_to("elists#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/elists/1").to route_to("elists#destroy", :id => "1")
    end

  end
end
