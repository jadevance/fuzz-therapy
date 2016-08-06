class Log < ApplicationRecord
  t.string :request, null: false
  t.string :response, null: false
end
