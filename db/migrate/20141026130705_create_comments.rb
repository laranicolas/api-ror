class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.references :blogPost, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
