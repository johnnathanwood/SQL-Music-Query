-- Query all of the entries in the Genre table
Select *
	from Genre

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
Insert into Artist 
	values (null, "Queen", 1978)
    
-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
Insert into Album
	Select null, "Flash Gordon", 1980, 2000, "John Wood", Artist.ArtistId, Genre.GenreId
FROM Artist, Genre
WHERE Artist.ArtistName = "Queen"
AND Genre.Label = "Rock"

-- Using the INSERT statement, add some songs that are on that album to the Song table.
Insert into Song
Select null, "I love John Wood", 265, 1989, Genre.GenreId, Artist.ArtistId, Album.AlbumId WHERE true
FROM Artist, Genre, Album
WHERE Artist.ArtistName = "Queen"
AND Genre.Label = "Rock"
AND Album.Title = "Flash Gordon"

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
SELECT a.title as AlbumTitle, s.title as SongTitle, ar.ArtistName
FROM Song s
LEFT JOIN Album a ON s.AlbumId = a.AlbumId
LEFT JOIN Artist ar ON a.ArtistId = ar.ArtistId
WHERE ar.ArtistName = "Queen"


-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT count() as SongCount, a.Title
FROM Album a
JOIN Song s ON s.AlbumId = a.AlbumId
GROUP BY a.AlbumId
ORDER BY a.Title ASC;
-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT count() as SongCount, a.ArtistName
FROM Artist a
JOIN Song s ON s.ArtistId = a.ArtistId
GROUP BY a.ArtistId
ORDER BY a.ArtistName ASC;

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT count() as SongCount, a.Label
FROM Genre a
JOIN Song s ON s.GenreId = a.GenreId
GROUP BY a.GenreId
ORDER BY a.Label ASC;

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.
SELECT Title, max(AlbumLength) FROM Album

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.
SELECT Title, max(SongLength) FROM Song

-- Modify the previous query to also display the title of the album.
SELECT Song.Title, Album.Title, max(Song.SongLength)
FROM Song
JOIN Album ON Album.AlbumId = Song.AlbumId