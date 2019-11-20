require('pry')
require_relative('models/artist.rb')
require_relative('models/album.rb')

Album.delete_all_albums
Artist.delete_all_artists

artist1 = Artist.new({
  'name' => 'Marshmello'
})
artist1.save_artist()

artist2 = Artist.new({
  'name' => 'Laura Shigihara'
})
artist2.save_artist()

artist3 = Artist.new({
  'name' => 'Alan Walker'
})
artist3.save_artist()

artist4 = Artist.new({
  'name' => 'Lindsay Stirling'
})
artist4.save_artist()

artist5 = Artist.new({
  'name' => 'Cold Kingdom'
})
artist5.save_artist()

artist6 = Artist.new({
  'name' => 'Ellie Goulding'
})
artist6.save_artist()

album1 = Album.new({
  'title' => "Everything's Alright" ,
  'genre' => 'Instrumental' ,
  'artist_id' => artist2.id
})
album1.save_album()

album2 = Album.new({
  'title' => 'Faded' ,
  'genre' => 'Pop' ,
  'artist_id' => artist3.id
})
album2.save_album()

album3 = Album.new({
  'title' => 'Sing Me To Sleep' ,
  'genre' => 'Pop' ,
  'artist_id' => artist3.id
})
album3.save_album()

album4 = Album.new({
  'title' => 'Here With You' ,
  'genre' => 'EDM' ,
  'artist_id' => artist1.id
})
album4.save_album()

album5 = Album.new({
  'title' => 'To The Moon' ,
  'genre' => 'Instrumental' ,
  'artist_id' => artist2.id
})
album5.save_album()

album6 = Album.new({
  'title' => 'Alone' ,
  'genre' => 'Pop' ,
  'artist_id' => artist3.id
})
album6.save_album()

album7 = Album.new({
  'title' => 'Close To Me',
  'genre' => 'Pop' ,
  'artist_id' => artist6.id
})
album7.save_album()

album8 = Album.new({
  'title' => 'A New Disaster',
  'genre' => 'EDM' ,
  'artist_id' => artist5.id
})
album8.save_album()

album9 = Album.new({
  'title' => 'Song Of The Caged Bird',
  'genre' => 'Instrumental' ,
  'artist_id' => artist4.id
})
album9.save_album()

album10 = Album.new({
  'title' => 'Shatter Me',
  'genre' => 'Instrumental' ,
  'artist_id' => artist4.id
})
album10.save_album()

album11 = Album.new({
  'title' => 'Crystallise',
  'genre' => 'Instrumental' ,
  'artist_id' =>  artist4.id
})
album11.save_album()

album12 = Album.new({
  'title' => 'Lights',
  'genre' => 'Pop' ,
  'artist_id' => artist6.id
})
album12.save_album()

binding.pry
nil
