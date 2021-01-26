class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.text :memo
      t.integer :clothes_id, null:false
      t.integer :season_id,  null:false
      t.integer :gender_id,  null:false
      t.references :user, foreign_key:true
      t.timestamps
    end
  end
end
