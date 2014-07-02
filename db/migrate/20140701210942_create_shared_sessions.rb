class CreateSharedSessions < ActiveRecord::Migration
  def change
    create_table :shared_sessions do |t|
      t.string :title
      t.string :alpha_code
      t.timestamps
    end
  end
end
