class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :body, :limit => 140,  :null => false
      t.boolean :anon, :default => false
      t.integer :user_id
      t.boolean :nsfw, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :posts
  end
end
