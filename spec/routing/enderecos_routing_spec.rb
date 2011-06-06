require "spec_helper"

describe EnderecosController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/enderecos" }.should route_to(:controller => "enderecos", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/enderecos/new" }.should route_to(:controller => "enderecos", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/enderecos/1" }.should route_to(:controller => "enderecos", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/enderecos/1/edit" }.should route_to(:controller => "enderecos", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/enderecos" }.should route_to(:controller => "enderecos", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/enderecos/1" }.should route_to(:controller => "enderecos", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/enderecos/1" }.should route_to(:controller => "enderecos", :action => "destroy", :id => "1")
    end

  end
end
