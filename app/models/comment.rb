class Comment < ApplicationRecord
  belongs_to :author, polymorphic: true
end
