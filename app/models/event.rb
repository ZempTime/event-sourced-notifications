class Event < ApplicationRecord
  belongs_to :recordable, polymorphic: true
  belongs_to :recordable_previous, polymorphic: true
  belongs_to :context
  belongs_to :creator, class_name: "User"
end
