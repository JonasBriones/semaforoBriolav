class RenameApellidoToFnacimiento < ActiveRecord::Migration[5.2]
  def change
    remove_column :polls, :apellido, :string
    remove_column :polls, :genero, :boolean
    add_column :polls, :fnacimiento, :datetime
    add_column :polls, :genero, :string
  end
end
