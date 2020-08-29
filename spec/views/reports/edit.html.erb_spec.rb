require 'rails_helper'

RSpec.describe "reports/edit", type: :view do
  before(:each) do
    @report = assign(:report, Report.create!(
      :name => "MyString",
      :active_status => 1,
      :sort_order => 1
    ))
  end

  it "renders the edit report form" do
    render

    assert_select "form[action=?][method=?]", report_path(@report), "post" do

      assert_select "input#report_name[name=?]", "report[name]"

      assert_select "input#report_active_status[name=?]", "report[active_status]"

      assert_select "input#report_sort_order[name=?]", "report[sort_order]"
    end
  end
end
