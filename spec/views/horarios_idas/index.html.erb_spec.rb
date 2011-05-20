require 'spec_helper'

describe "horarios_idas/index.html.erb" do
  before(:each) do
    assign(:horarios_idas, [
      stub_model(HorariosIda,
        :linha => nil,
        :dia_da_semana => "Dia Da Semana"
      ),
      stub_model(HorariosIda,
        :linha => nil,
        :dia_da_semana => "Dia Da Semana"
      )
    ])
  end

  it "renders a list of horarios_idas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Dia Da Semana".to_s, :count => 2
  end
end
