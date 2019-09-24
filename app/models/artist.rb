
# `Artist.most_prolific`
# Returns an `instance` of the artist with the highest amount of paintings per year of experience.

# `Artist#create_painting`
# Given the arguments of `title`, `price` and `gallery`, creates a new painting belonging to that artist

class Artist

  attr_reader :name, :years_experience

  @@all = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all.push(self)
  end

  def self.all 
   @@all
  end 

  def paintings 
    # Returns an `array` all the paintings by an artist
   Painting.all.select { |paint_inst| paint_inst.artist == self }
  end 

  def galleries 
  # Returns an `array` of all the galleries that an artist has paintings in
   paintings.map { |paint_inst| paint_inst.gallery }.uniq
  end 

  def cities 
    # Return an `array` of all cities that an artist has paintings in
   galleries.map { |gallery_inst| gallery_inst.city }
  end 

  def self.total_experience
    # Returns an `integer` that is the total years of experience of all artists
   @@all.reduce(0) { |sum, artist_inst| sum + artist_inst.years_experience }
  end 

  def self.most_prolific
   # Returns an `instance` of the artist with the highest amount of paintings per year of experience.
   @@all.max_by { |artist_inst| artist_inst.paintings.length.to_f / artist_inst.years_experience }
  end 

  def create_painting(title, price, gallery)
    Painting.new(title, price, self, gallery)
  end 

end
