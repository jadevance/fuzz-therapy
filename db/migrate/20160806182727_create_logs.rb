class CreateLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :logs do |t|
      t.string :request, null: false
      t.string :response, null: false
      t.timestamps
    end
  end
end
