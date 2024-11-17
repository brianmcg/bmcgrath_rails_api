class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts, if_not_exists: true do |t|
      t.string :name
      t.string :address
      t.string :message

      t.timestamps
    end
  end
end
