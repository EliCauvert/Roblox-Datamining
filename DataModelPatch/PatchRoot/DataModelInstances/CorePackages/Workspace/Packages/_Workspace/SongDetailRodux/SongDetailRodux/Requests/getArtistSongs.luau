local Url = require(script:FindFirstAncestor("SongDetailRodux").Parent.Http).Url

return function(Callback, p1, p2: number)
	-- upvalues: Url (copy)
	if p1 == "" then
		error("GetArtistSongs: songId cannot be an empty string")
	end
	return Callback(string.format("%smusic-discovery/v1/songs-by-criteria?by_artist.reference_audio_asset_id=%s&limit=%s", Url.APIS_URL, tostring(p1), (tostring(if p2 and p2 >= 0 and p2 <= 100 then p2 else 20))), "GET")
end