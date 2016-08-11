class AddNullConstraintsToModels < ActiveRecord::Migration[5.0]
  def change
    change_column_null :users, :name, false
    change_column_null :users, :location, false
    change_column_null :users, :availability, false
    change_column_null :users, :provider, false
    change_column_null :users, :uid, false
    change_column_null :users, :oauth_token, false
    change_column_null :users, :oauth_expires_at, false
  end
end
