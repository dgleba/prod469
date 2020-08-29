require 'rails_helper'

RSpec.describe "elists/index", type: :view do
  before(:each) do
    assign(:elists, [
      Elist.create!(
        :email => "Email",
        :active_status => 2,
        :sort_order => 3
      ),
      Elist.create!(
        :email => "Email",
        :active_status => 2,
        :sort_order => 3
      )
    ])
  end

  it "renders a list of elists" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
