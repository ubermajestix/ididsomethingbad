class CreateBacklogs < ActiveRecord::Migration
  def self.up
    create_table :backlogs do |t|
      t.integer :user_id
      t.text :feature
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :backlogs
  end
end
