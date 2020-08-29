require 'rails_helper'

RSpec.describe "elists/show", type: :view do
  before(:each) do
    @elist = assign(:elist, Elist.create!(
      :email => "Email",
      :active_status => 2,
      :sort_order => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
