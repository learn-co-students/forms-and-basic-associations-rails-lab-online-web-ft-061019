class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def genre_name=(name)
      self.genre = Genre.find_or_create_by(name: name)
  end

  def artist_name=(name)
      self.artist = Artist.find_or_create_by(name: name)
  end

  def note_contents=(content)
      self.note = Note.find_or_create_by(content: content)
  end

end
