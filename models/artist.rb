require_relative('../db/sql_runner.rb')
require_relative('./album.rb')

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize(details)
    @id = details['id'].to_i if details['id']
    @name = details['name']
  end

  def save_artist
    result_array = Runner.run('INSERT INTO artists (name) VALUES ($1) RETURNING id', [@name])
    @id = result_array[0]['id'].to_i
  end

  def self.delete_all_artists
    # puts "Are you sure you want to delete all the artists? (y/n):"
    # input = gets.chomp.downcase
    # if input == 'y'
      Runner.run('DELETE FROM artists')
    # else
      # puts "Process cancelled"
    # end
  end

  def self.find_all_artists
    artists_array = Runner.run('SELECT * FROM artists')
    return 'There are no artists in this table' if artists_array.count == 0
    return artists_array.map{|artist| Artist.new(artist)}
  end

  def update_artist
    Runner.run('UPDATE artists SET name = $1 WHERE id = $2', [@name, @id])
  end

  # def delete_artist
  #   Runner.run('DELETE FROM artists WHERE id = $1', [@id])
  # end

  def self.find_artist_by_name(name)
    artist_array = Runner.run('SELECT * FROM artists WHERE name = $1', [name])
    return 'Could not find any artists by that name' if artist_array.count == 0
    return Artist.new(artist_array[0])
  end

  def self.find_artist_by_id(id)
    artist_array = Runner.run('SELECT * FROM artists WHERE id = $1', [id])
    return 'Could not find any artists using that ID' if artist_array.count == 0
    return Artist.new(artist_array[0])
  end

  def find_albums_by_artist
    albums_array = Runner.run('SELECT * FROM albums WHERE artist_id = $1', [@id])
    return albums_array.map{|album| Album.new(album)}
  end

end
