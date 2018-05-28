class RenameEstadoToStateId < ActiveRecord::Migration[5.2]
  def change
    rename_column :polls, :estado_id, :state_id
  end
end
