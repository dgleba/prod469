require 'rails_helper'

RSpec.describe "elist_reports/new", type: :view do
  before(:each) do
    assign(:elist_report, ElistReport.new(
      :when_to_send => "MyString",
      :elist => nil,
      :report => nil,
      :active_status => 1,
      :sort_order => 1
    ))
  end

  it "renders new elist_report form" do
    render

    assert_select "form[action=?][method=?]", elist_reports_path, "post" do

      assert_select "input#elist_report_when_to_send[name=?]", "elist_report[when_to_send]"

      assert_select "input#elist_report_elist_id[name=?]", "elist_report[elist_id]"

      assert_select "input#elist_report_report_id[name=?]", "elist_report[report_id]"

      assert_select "input#elist_report_active_status[name=?]", "elist_report[active_status]"

      assert_select "input#elist_report_sort_order[name=?]", "elist_report[sort_order]"
    end
  end
end
