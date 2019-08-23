class Song < ActiveRecord::Base
  has_many :notes
  belongs_to :artist
  belongs_to :genre

  def genre_name=(name)
      self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre ? self.genre.name : nil
  end 

  def artist_name=(name)
      self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist ? self.artist.name : nil
  
  end

  def note_contents=(content)
    content.each do |note|
      if note != ""
    self.notes << Note.new(content: note)
      end
    end
  end
  
  def note_contents
    self.notes.map do |note|
      note.content
    end 
  end

end
