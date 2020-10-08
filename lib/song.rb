require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new  
    song.save 
    song 
  end

  def self.new_by_name(title)
    song = self.new 
    song.name = title    
    song
  end

  def self.create_by_name(title)
    song = self.new
    song.name = title 
    song.save 
    song 
  end
  
  def self.find_by_name(title)
    self.all.find {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    self.create_by_name(title) 
    self.find_by_name(title)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name }
  end

  def self.new_from_filename(filename_data)
    song = self.new 
    data = filename_data.split(" - ")
    title = data[1].split(".")
    song.name = title[0]  
    song.artist_name = data[0]
    song
  end 

  def self.create_from_filename(filename_data)
    song = self.new_from_filename(filename_data)
    song.save
  end

  def self.destroy_all
    self.all.clear
  end
end
