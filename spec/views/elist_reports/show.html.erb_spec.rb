require 'rails_helper'

RSpec.describe "elist_reports/show", type: :view do
  before(:each) do
    @elist_report = assign(:elist_report, ElistReport.create!(
      :when_to_send => "When To Send",
      :elist => nil,
      :report => nil,
      :active_status => 2,
      :sort_order => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/When To Send/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
