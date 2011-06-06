require 'spec_helper'

describe "enderecos/show.html.erb" do
  before(:each) do
    @endereco = assign(:endereco, stub_model(Endereco,
      :endereco => "Endereco",
      :bairro => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Endereco/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
