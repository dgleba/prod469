require 'rails_helper'

RSpec.describe "elist_reports/index", type: :view do
  before(:each) do
    assign(:elist_reports, [
      ElistReport.create!(
        :when_to_send => "When To Send",
        :elist => nil,
        :report => nil,
        :active_status => 2,
        :sort_order => 3
      ),
      ElistReport.create!(
        :when_to_send => "When To Send",
        :elist => nil,
        :report => nil,
        :active_status => 2,
        :sort_order => 3
      )
    ])
  end

  it "renders a list of elist_reports" do
    render
    assert_select "tr>td", :text => "When To Send".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
