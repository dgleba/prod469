require 'rails_helper'

RSpec.describe "elists/new", type: :view do
  before(:each) do
    assign(:elist, Elist.new(
      :email => "MyString",
      :active_status => 1,
      :sort_order => 1
    ))
  end

  it "renders new elist form" do
    render

    assert_select "form[action=?][method=?]", elists_path, "post" do

      assert_select "input#elist_email[name=?]", "elist[email]"

      assert_select "input#elist_active_status[name=?]", "elist[active_status]"

      assert_select "input#elist_sort_order[name=?]", "elist[sort_order]"
    end
  end
end
