class Elist < ApplicationRecord

  has_many :elist_report
  has_many :report,   through: :elist_report



  # In `model`.rb
  #  http://stackoverflow.com/questions/11658281/rails-admin-display-name-instead-of-id
  #  see also.. \\10.4.1.227\rt\srv\share\lpa346\ ...   config\initializers\rails_admin.rb
  def radisplay_rpt_elist
    "#{email}"
  end

  validates_inclusion_of :active_status, :in => 0..9

end
