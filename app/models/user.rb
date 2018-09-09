class User < ApplicationRecord
  has_many :comments, as: :author
end
