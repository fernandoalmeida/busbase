require 'spec_helper'

describe "itinerarios/show.html.erb" do
  before(:each) do
    @itinerario = assign(:itinerario, stub_model(Itinerario,
      :linha => nil,
      :endereco => nil,
      :position => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
