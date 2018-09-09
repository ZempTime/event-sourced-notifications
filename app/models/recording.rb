class Recording < ApplicationRecord
  belongs_to :context, touch: true
  belongs_to :creator, class_name: "User"
end
