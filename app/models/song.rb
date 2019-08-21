class Song < ActiveRecord::Base
  belongs_to :genre
  belongs_to :artist
  has_many :notes

  accepts_nested_attributes_for :notes

  def artist_name=(name)
    self.artist_id = Artist.find_or_create_by(name: name).id
  end

  def artist_name
    self.artist.name unless self.artist == nil
  end

  def note_contents=(note)
    note.map do |n| 
      new_note = Note.create(content: n)
      self.notes << new_note
    end
  end
  
  def note_contents
    self.notes.map {|n| n.content}.reject {|n| n == ""}
  end

  def genre_name=(name)
    self.genre_id = Genre.find_by(name: name).id
  end

  def genre_name
    self.genre.name unless self.genre == nil
  end

end
