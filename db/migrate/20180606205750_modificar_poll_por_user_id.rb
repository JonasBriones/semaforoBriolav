class ModificarPollPorUserId < ActiveRecord::Migration[5.2]
  def change
      remove_column :polls, :nombre
      remove_column :polls, :rut
      remove_column :polls, :genero
      remove_column :polls, :fnacimiento
      add_column :polls, :user_id, :integer
      add_column :users, :genero, :string
      add_column :users, :fnacimiento, :date
  end
end
