class Document < ApplicationRecord
  # user 1 : document N
  belongs_to :user
end
