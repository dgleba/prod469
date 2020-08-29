require 'rails_helper'

RSpec.describe "reports/index", type: :view do
  before(:each) do
    assign(:reports, [
      Report.create!(
        :name => "Name",
        :active_status => 2,
        :sort_order => 3
      ),
      Report.create!(
        :name => "Name",
        :active_status => 2,
        :sort_order => 3
      )
    ])
  end

  it "renders a list of reports" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
