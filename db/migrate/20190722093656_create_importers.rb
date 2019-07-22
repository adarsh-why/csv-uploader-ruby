class CreateImporters < ActiveRecord::Migration[5.1]
  def change
    create_table :importers do |t|
      t.string :name
      t.string :description
      t.string :price
      t.string :availability_date
      t.string :slug
      t.string :stock_total
      t.string :category

      t.timestamps
    end
  end
end
