class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.references :tinder_user, null: false, comment: 'tinder user id'
      t.text :url, null: false, comment: 'image url'
      t.timestamps
    end
  end
end
