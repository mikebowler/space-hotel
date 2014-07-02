class CreateSharedSessions < ActiveRecord::Migration
  def change
    create_table :shared_sessions do |t|
      t.string :title
      t.timestamps
    end
  end
end
