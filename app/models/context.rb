# This class would probably correspond with "Bucket" in "On Writing Softare Well", 
#   meaning "relevant to various groupings of implicit event consumers,"
#   but I'm not sold on that word. I get it but it feels too extroardinary a term.
class Context < ApplicationRecord
  def record(recordable, options = {})
    recording = Recording.create context: self, creator: options[:creator]
  end
end
