class CreateDailyReports < ActiveRecord::Migration[6.0]
  def change
    create_table :daily_reports do |t|
      t.belongs_to :country, null: false, foreign_key: true
      t.belongs_to :region, foreign_key: true
      t.belongs_to :suburb, foreign_key: true
      t.datetime :date
      t.integer :confirmed
      t.integer :deaths
      t.integer :recovered

      t.timestamps
    end
  end
end
