class RenameEstadoToEstadoId < ActiveRecord::Migration[5.2]
  def change
    rename_column :polls, :estado, :estado_id
  end
end
