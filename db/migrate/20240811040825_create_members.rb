class CreateMembers < ActiveRecord::Migration[7.2]
  def change
    create_table :members do |t|
      t.references :user, null: false, foreign_key: true
      t.references :tenant, null: false, foreign_key: true
      t.json :roles, default: {}, null: false

      t.timestamps
    end
  end
end
