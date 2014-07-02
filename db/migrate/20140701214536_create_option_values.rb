class CreateOptionValues < ActiveRecord::Migration
  def change
    create_table :option_values do |t|
      t.text :value
      t.belongs_to :shared_session
      t.belongs_to :option
      t.timestamps
    end
  end
end
