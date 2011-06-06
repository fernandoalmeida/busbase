require "spec_helper"

describe ItinerariosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/itinerarios" }.should route_to(:controller => "itinerarios", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/itinerarios/new" }.should route_to(:controller => "itinerarios", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/itinerarios/1" }.should route_to(:controller => "itinerarios", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/itinerarios/1/edit" }.should route_to(:controller => "itinerarios", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/itinerarios" }.should route_to(:controller => "itinerarios", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/itinerarios/1" }.should route_to(:controller => "itinerarios", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/itinerarios/1" }.should route_to(:controller => "itinerarios", :action => "destroy", :id => "1")
    end

  end
end
