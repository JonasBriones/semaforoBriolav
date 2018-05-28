class ChangeFnacimientoAddImagenState < ActiveRecord::Migration[5.2]
  def change
    remove_column :polls, :fnacimiento, :datetime
    add_column :polls, :fnacimiento, :date
    add_column :states, :imagen, :string
  end
end
