local CreateGameTileHiddenStoreModule = require(script:FindFirstAncestor("GameTile").HiddenGameTile.createGameTileHiddenStore)
local t = {}

return function(Key) --[[ Line: 8 | Named "getGameTileHiddenStore" ]]
	-- upvalues: t (copy), CreateGameTileHiddenStoreModule (copy)
	local Entry = t[Key]
	
	if Entry == nil then
		t[Key] = CreateGameTileHiddenStoreModule()
		Entry = t[Key]
	end
	return Entry
end