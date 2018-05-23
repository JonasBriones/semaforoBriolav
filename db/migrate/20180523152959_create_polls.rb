class CreatePolls < ActiveRecord::Migration[5.2]
  def change
    create_table :polls do |t|
      t.string :nombre
      t.string :apellido
      t.string :rut
      t.boolean :genero
      t.integer :estado
      t.text :motivo

      t.timestamps
    end
  end
end
