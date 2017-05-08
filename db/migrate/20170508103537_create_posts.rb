class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string   "title"
      t.text     "body"
      t.datetime "created_at",                                null: false
      t.datetime "updated_at",                                null: false
      t.string   "published",  default: "unpublished",        null: false
    end
  end
end
