cevap 1:
SELECT AlbumId, TrackId AS total_album
FROM tracks
GROUP BY tracks;


cevap 2:
SELECT tracks.name, albums.Title
FROM albums
JOIN tracks ON albums.AlbumId = tracks.AlbumId;

cevap 3:
SELECT tracks.Name, tracks.AlbumId, albums.Title, min(tracks.Milliseconds)
FROM tracks
JOIN albums ON tracks.AlbumId = albums.AlbumId
GROUP BY albums.Title
ORDER BY tracks.Milliseconds DESC;


cevap 4:
SELECT sum(tracks.Milliseconds), albums.Title, tracks.Name, albums.AlbumId
FROM tracks
JOIN albums ON albums.AlbumId = tracks.AlbumId
GROUP BY albums.Title
ORDER BY tracks.Milliseconds DESC;

cevap 5:
SELECT sum(tracks.Milliseconds), albums.Title, tracks.Name, albums.AlbumId
FROM tracks
JOIN albums ON albums.AlbumId = tracks.AlbumId
GROUP BY tracks.Milliseconds > 252000
ORDER BY tracks.Milliseconds;