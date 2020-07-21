cevap 1:
SELECT AlbumId, TrackId AS total_album
FROM tracks
GROUP BY tracks;


cevap 2:
SELECT tracks.name, albums.Title
FROM albums
JOIN tracks ON albums.AlbumId = tracks.AlbumId;

cevap 3:
SELECT tracks.Name, tracks.AlbumId, albums.Title, tracks.Milliseconds
FROM tracks
JOIN albums ON tracks.AlbumId = albums.AlbumId
GROUP BY albums.Title
ORDER BY tracks.Milliseconds DESC;


cevap 4:
SELECT tracks.Milliseconds, albums.Title
FROM tracks
JOIN albums ON albums.AlbumId = tracks.AlbumId
ORDER BY tracks.Milliseconds DESC;