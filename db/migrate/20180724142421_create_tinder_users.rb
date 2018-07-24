class CreateTinderUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :tinder_users do |t|
      t.string  :tinder_id, null: false, comment: 'original tinder user id'
      t.string  :name, null: false, comment: 'Name'
      t.text    :bio,  null: false, comment: 'tinder bio'
      t.string  :instagram_user_name, null: true, comment: 'instagram user name'
      t.date    :birth_date, null: true, comment: 'birth day'
      t.integer :distance_mi, null: true, comment: 'distance'
      t.timestamps
    end
    add_index :tinder_users, :tinder_id
    add_index :tinder_users, :name
    add_index :tinder_users, :distance_mi
  end
end
