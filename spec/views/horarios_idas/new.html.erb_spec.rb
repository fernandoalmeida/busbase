require 'spec_helper'

describe "horarios_idas/new.html.erb" do
  before(:each) do
    assign(:horarios_ida, stub_model(HorariosIda,
      :linha => nil,
      :dia_da_semana => "MyString"
    ).as_new_record)
  end

  it "renders new horarios_ida form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => horarios_idas_path, :method => "post" do
      assert_select "input#horarios_ida_linha", :name => "horarios_ida[linha]"
      assert_select "input#horarios_ida_dia_da_semana", :name => "horarios_ida[dia_da_semana]"
    end
  end
end
