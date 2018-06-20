class CreateOptions < ActiveRecord::Migration[4.2]
  def change
    create_table :options do |t|
      t.string :description
      t.string :key
      t.string :value_type # boolean, single-select, multiple-select, text
      t.text :possible_values
      t.text :default_value
      t.timestamps
    end
  end
end
