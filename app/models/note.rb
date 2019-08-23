class Note < ActiveRecord::Base
  belongs_to :song
  has_many :content
end
