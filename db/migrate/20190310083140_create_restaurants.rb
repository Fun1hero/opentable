class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.time :opens_at
      t.time :closes_at

      t.timestamps
    end
  end
end
