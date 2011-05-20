require 'spec_helper'

describe "HorariosIdas" do
  describe "GET /horarios_idas" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get horarios_idas_path
      response.status.should be(200)
    end
  end
end
