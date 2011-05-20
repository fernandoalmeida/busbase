require 'spec_helper'

describe "horarios_idas/show.html.erb" do
  before(:each) do
    @horarios_ida = assign(:horarios_ida, stub_model(HorariosIda,
      :linha => nil,
      :dia_da_semana => "Dia Da Semana"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Dia Da Semana/)
  end
end
