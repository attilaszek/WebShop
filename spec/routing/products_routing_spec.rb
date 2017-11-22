require "rails_helper"

RSpec.describe ProductsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/products").to route_to("products#index")
    end

    it "routes to #show" do
      expect(:get => "/products/1").to route_to("products#show", :id => '1')
    end
    
    it "routes to #new" do
      expect(:get => "/products/new").not_to route_to("products#new")
    end

    it "routes to #edit" do
      expect(:get => "/products/1/edit").not_to be_routable
    end

    it "routes to #create" do
      expect(:post => "/products").not_to be_routable
    end

    it "routes to #update via PUT" do
      expect(:put => "/products/1").not_to be_routable
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/products/1").not_to be_routable
    end

    it "routes to #destroy" do
      expect(:delete => "/products/1").not_to be_routable
    end

  end
end