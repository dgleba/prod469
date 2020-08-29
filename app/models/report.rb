class Report < ApplicationRecord

  has_many :elist_report
  has_many :elist, through: :elist_report

  # In `model`.rb
  #  http://stackoverflow.com/questions/11658281/rails-admin-display-name-instead-of-id
  #  see also.. \\10.4.1.227\rt\srv\share\lpa346\ ...   config\initializers\rails_admin.rb
  def radisplay_report
    "#{name}"
  end


end
