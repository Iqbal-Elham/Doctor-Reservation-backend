class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :photo
      t.text :about
      t.integer :price_hour

      t.timestamps
    end
  end
end
