class CreateElistReports < ActiveRecord::Migration[5.0]
  def change
    create_table :elist_reports do |t|
      t.string :when_to_send
      t.references :elist, foreign_key: true
      t.references :report, foreign_key: true
      t.integer :active_status
      t.integer :sort_order

      t.timestamps
    end
  end
end
