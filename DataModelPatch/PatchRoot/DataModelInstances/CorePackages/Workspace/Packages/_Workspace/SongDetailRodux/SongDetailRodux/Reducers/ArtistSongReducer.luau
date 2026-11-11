local SongDetailRodux = script:FindFirstAncestor("SongDetailRodux")
local AddArtistSongsModule = require(SongDetailRodux.Actions.AddArtistSongs)
local CryoModule = require(SongDetailRodux.Parent.Cryo)

return {
	key = "ArtistSongsKey",
	reducer = function(p1, p2)
		-- upvalues: AddArtistSongsModule (copy), CryoModule (copy)
		local P0 = p1 or {}
		assert(P0, "")
		
		if p2 and p2.type == AddArtistSongsModule.name then
			P0 = CryoModule.Dictionary.join(P0, p2.artistSongs)
		end
		return P0
	end
}