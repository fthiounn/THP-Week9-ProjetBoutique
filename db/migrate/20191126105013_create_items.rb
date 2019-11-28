class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.belongs_to :city_id
      t.datetime :date
      t.timestamps
    end
  end
end
