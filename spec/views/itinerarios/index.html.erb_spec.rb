require 'spec_helper'

describe "itinerarios/index.html.erb" do
  before(:each) do
    assign(:itinerarios, [
      stub_model(Itinerario,
        :linha => nil,
        :endereco => nil,
        :position => 1
      ),
      stub_model(Itinerario,
        :linha => nil,
        :endereco => nil,
        :position => 1
      )
    ])
  end

  it "renders a list of itinerarios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
