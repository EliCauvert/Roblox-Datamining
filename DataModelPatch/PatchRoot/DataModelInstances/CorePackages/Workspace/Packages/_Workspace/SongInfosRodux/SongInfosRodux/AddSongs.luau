local Parent = script:FindFirstAncestor("SongInfosRodux").Parent
local _ = require(Parent.DiscoveryTypes)
local FFlagEnableTopSongsSort = require(Parent.SharedFlags).FFlagEnableTopSongsSort

return require(Parent.Rodux).makeActionCreator(script.Name, function(Songs)
	-- upvalues: FFlagEnableTopSongsSort (copy)
	assert(FFlagEnableTopSongsSort, "FFlagEnableTopSongsSort must be enabled to use AddSongs action")
	assert(type(Songs) == "table", string.format("AddSongs action expects songs to be a table, was %s", (type(Songs))))
	
	return { songs = Songs }
end)