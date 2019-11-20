require_relative('../db/sql_runner.rb')
require_relative('./artist.rb')

class Album

  attr_reader :artist_id
  attr_accessor :title, :genre

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @title = details['title']
    @genre = details['genre']
    @artist_id = details['artist_id'].to_i
  end

  def save_album
    result_array = Runner.run('INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id', [@title, @genre, @artist_id])
    @id = result_array[0]['id'].to_i
  end

  def self.delete_all_albums
    # puts "Are you sure you want to delete all the albums? (y/n):"
    # input = gets.chomp.downcase
    # if input == 'y'
      Runner.run('DELETE FROM albums')
    # else
      # puts "Process cancelled"
    # end

  end

  def self.find_all_albums
    albums_array = Runner.run('SELECT * FROM albums')
    return 'There are no albums in this table' if albums_array.count == 0
    return albums_array.map{|album| Album.new(album)}
  end

  def update_album
    Runner.run('UPDATE albums SET (title, genre) = ($1, $2) WHERE id = $3', [@title, @genre, @id])
  end

  def delete_album
    Runner.run('DELETE FROM albums WHERE id = $1', [@id])
  end

  def self.find_album_by_title(title)
    album_array = Runner.run('SELECT * FROM albums WHERE title = $1', [title])
    return 'Could not find any album by that name' if album_array.count == 0
    return Album.new(album_array[0])
  end

  def self.find_album_by_id(id)
    album_array = Runner.run('SELECT * FROM albums WHERE id = $1', [id])
    return 'Could not find any album by that id' if album_array.count == 0
    return Album.new(album_array[0])
  end

  def find_artist_by_album
    artist_array = Runner.run('SELECT * FROM artists WHERE id = $1', [@artist_id])
    return Artist.new(artist_array[0])
  end

  def find_other_albums_by_same_artist
    artist_array = Runner.run('SELECT * FROM artists WHERE id = $1', [@artist_id])
    albums_array = Runner.run('SELECT * FROM albums WHERE artist_id = $1', [artist_array[0]['id'].to_i])
    return albums_array.map {|album| Album.new(album)}
  end

  def find_other_albums_in_same_genre
    albums_array = Runner.run('SELECT * FROM albums WHERE genre = $1', [@genre])
    return albums_array.map {|album| Album.new(album)}
  end

end
