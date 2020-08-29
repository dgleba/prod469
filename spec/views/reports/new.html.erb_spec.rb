require 'rails_helper'

RSpec.describe "reports/new", type: :view do
  before(:each) do
    assign(:report, Report.new(
      :name => "MyString",
      :active_status => 1,
      :sort_order => 1
    ))
  end

  it "renders new report form" do
    render

    assert_select "form[action=?][method=?]", reports_path, "post" do

      assert_select "input#report_name[name=?]", "report[name]"

      assert_select "input#report_active_status[name=?]", "report[active_status]"

      assert_select "input#report_sort_order[name=?]", "report[sort_order]"
    end
  end
end
