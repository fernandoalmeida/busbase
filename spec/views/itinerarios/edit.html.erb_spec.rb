require 'spec_helper'

describe "itinerarios/edit.html.erb" do
  before(:each) do
    @itinerario = assign(:itinerario, stub_model(Itinerario,
      :linha => nil,
      :endereco => nil,
      :position => 1
    ))
  end

  it "renders the edit itinerario form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => itinerarios_path(@itinerario), :method => "post" do
      assert_select "input#itinerario_linha", :name => "itinerario[linha]"
      assert_select "input#itinerario_endereco", :name => "itinerario[endereco]"
      assert_select "input#itinerario_position", :name => "itinerario[position]"
    end
  end
end
