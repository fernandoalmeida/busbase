require 'spec_helper'

describe "enderecos/new.html.erb" do
  before(:each) do
    assign(:endereco, stub_model(Endereco,
      :endereco => "MyString",
      :bairro => nil
    ).as_new_record)
  end

  it "renders new endereco form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => enderecos_path, :method => "post" do
      assert_select "input#endereco_endereco", :name => "endereco[endereco]"
      assert_select "input#endereco_bairro", :name => "endereco[bairro]"
    end
  end
end
