class CreateSuburbs < ActiveRecord::Migration[6.0]
  def change
    create_table :suburbs do |t|
      t.string :name
      t.belongs_to :country, null: false, foreign_key: true
      t.belongs_to :region, null: false, foreign_key: true

      t.timestamps
    end
  end
end
