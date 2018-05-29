class CreateFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :feedbacks do |t|
      t.integer :poll_id
      t.string  :enviado_por
      t.text  :respuesta
      t.timestamps
    end
  end
end
