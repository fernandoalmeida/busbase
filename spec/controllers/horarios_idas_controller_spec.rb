require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by the Rails when you ran the scaffold generator.

describe HorariosIdasController do

  def mock_horarios_ida(stubs={})
    @mock_horarios_ida ||= mock_model(HorariosIda, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all horarios_idas as @horarios_idas" do
      HorariosIda.stub(:all) { [mock_horarios_ida] }
      get :index
      assigns(:horarios_idas).should eq([mock_horarios_ida])
    end
  end

  describe "GET show" do
    it "assigns the requested horarios_ida as @horarios_ida" do
      HorariosIda.stub(:find).with("37") { mock_horarios_ida }
      get :show, :id => "37"
      assigns(:horarios_ida).should be(mock_horarios_ida)
    end
  end

  describe "GET new" do
    it "assigns a new horarios_ida as @horarios_ida" do
      HorariosIda.stub(:new) { mock_horarios_ida }
      get :new
      assigns(:horarios_ida).should be(mock_horarios_ida)
    end
  end

  describe "GET edit" do
    it "assigns the requested horarios_ida as @horarios_ida" do
      HorariosIda.stub(:find).with("37") { mock_horarios_ida }
      get :edit, :id => "37"
      assigns(:horarios_ida).should be(mock_horarios_ida)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "assigns a newly created horarios_ida as @horarios_ida" do
        HorariosIda.stub(:new).with({'these' => 'params'}) { mock_horarios_ida(:save => true) }
        post :create, :horarios_ida => {'these' => 'params'}
        assigns(:horarios_ida).should be(mock_horarios_ida)
      end

      it "redirects to the created horarios_ida" do
        HorariosIda.stub(:new) { mock_horarios_ida(:save => true) }
        post :create, :horarios_ida => {}
        response.should redirect_to(horarios_ida_url(mock_horarios_ida))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved horarios_ida as @horarios_ida" do
        HorariosIda.stub(:new).with({'these' => 'params'}) { mock_horarios_ida(:save => false) }
        post :create, :horarios_ida => {'these' => 'params'}
        assigns(:horarios_ida).should be(mock_horarios_ida)
      end

      it "re-renders the 'new' template" do
        HorariosIda.stub(:new) { mock_horarios_ida(:save => false) }
        post :create, :horarios_ida => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested horarios_ida" do
        HorariosIda.stub(:find).with("37") { mock_horarios_ida }
        mock_horarios_ida.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :horarios_ida => {'these' => 'params'}
      end

      it "assigns the requested horarios_ida as @horarios_ida" do
        HorariosIda.stub(:find) { mock_horarios_ida(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:horarios_ida).should be(mock_horarios_ida)
      end

      it "redirects to the horarios_ida" do
        HorariosIda.stub(:find) { mock_horarios_ida(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(horarios_ida_url(mock_horarios_ida))
      end
    end

    describe "with invalid params" do
      it "assigns the horarios_ida as @horarios_ida" do
        HorariosIda.stub(:find) { mock_horarios_ida(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:horarios_ida).should be(mock_horarios_ida)
      end

      it "re-renders the 'edit' template" do
        HorariosIda.stub(:find) { mock_horarios_ida(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested horarios_ida" do
      HorariosIda.stub(:find).with("37") { mock_horarios_ida }
      mock_horarios_ida.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the horarios_idas list" do
      HorariosIda.stub(:find) { mock_horarios_ida }
      delete :destroy, :id => "1"
      response.should redirect_to(horarios_idas_url)
    end
  end

end
