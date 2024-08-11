class CreateTenancies < ActiveRecord::Migration[7.2]
  def change
    create_table :tenancies do |t|
      t.string :name

      t.timestamps
    end
  end
end
