class User < ApplicationRecord
  t.string :name, null: false
  t.string :location, null: false
  t.string :availability, null: false
  t.string :provider, null: false
  t.string :uid, null: false
  t.string :oauth_token, null: false
  t.datetime :oauth_expires_at, null: false 
end
