require "spec_helper"

describe MenusController do
  describe "routing" do

    it "routes to #index" do
      get("/menus").should route_to("menus#index")
    end

    it "routes to #new" do
      get("/menus/new").should route_to("menus#new")
    end

    it "routes to #show" do
      get("/menus/1").should route_to("menus#show", :id => "1")
    end

    it "routes to #edit" do
      get("/menus/1/edit").should route_to("menus#edit", :id => "1")
    end

    it "routes to #create" do
      post("/menus").should route_to("menus#create")
    end

    it "routes to #update" do
      put("/menus/1").should route_to("menus#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/menus/1").should route_to("menus#destroy", :id => "1")
    end

  end
end
