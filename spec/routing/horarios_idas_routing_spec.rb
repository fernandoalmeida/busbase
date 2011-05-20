require "spec_helper"

describe HorariosIdasController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/horarios_idas" }.should route_to(:controller => "horarios_idas", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/horarios_idas/new" }.should route_to(:controller => "horarios_idas", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/horarios_idas/1" }.should route_to(:controller => "horarios_idas", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/horarios_idas/1/edit" }.should route_to(:controller => "horarios_idas", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/horarios_idas" }.should route_to(:controller => "horarios_idas", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/horarios_idas/1" }.should route_to(:controller => "horarios_idas", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/horarios_idas/1" }.should route_to(:controller => "horarios_idas", :action => "destroy", :id => "1")
    end

  end
end
