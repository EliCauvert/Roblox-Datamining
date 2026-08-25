local createGameTileHiddenStoreModule = require(script:FindFirstAncestor("GameTile").HiddenGameTile.createGameTileHiddenStore)
local t = {}

return function(p0)
	-- upvalues: t (ref), createGameTileHiddenStoreModule (ref)
	local var2 = t[p0]
	
	if var2 == nil then
		t[p0] = createGameTileHiddenStoreModule()
		var2 = t[p0]
	end
	return var2
end