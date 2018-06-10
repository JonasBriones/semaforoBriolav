class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :rut
      t.string :nombre

      t.timestamps
    end
  end
end
