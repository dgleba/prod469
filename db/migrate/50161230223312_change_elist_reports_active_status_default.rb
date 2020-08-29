class ChangeElistReportsActiveStatusDefault < ActiveRecord::Migration[5.0]
  def change

    change_column :elist_reports, :active_status, :integer, :default => 1
  
  end
end
