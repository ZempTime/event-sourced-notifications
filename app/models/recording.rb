# I'm not sure what the explanation of a recording is. I do, however, suspect
# it's meant to tie together multiple 'events' which might have occurred due 
# to a single action.

class Recording < ApplicationRecord
  belongs_to :context, touch: true
  belongs_to :creator, class_name: "User"
end