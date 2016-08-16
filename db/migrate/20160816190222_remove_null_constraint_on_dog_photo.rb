class RemoveNullConstraintOnDogPhoto < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :dog_picture, true
  end
end
