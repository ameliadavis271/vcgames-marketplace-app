class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :fullname
      t.string :description

      t.timestamps
    end
  end
end