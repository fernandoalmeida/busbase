require 'spec_helper'

describe "enderecos/index.html.erb" do
  before(:each) do
    assign(:enderecos, [
      stub_model(Endereco,
        :endereco => "Endereco",
        :bairro => nil
      ),
      stub_model(Endereco,
        :endereco => "Endereco",
        :bairro => nil
      )
    ])
  end

  it "renders a list of enderecos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Endereco".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
