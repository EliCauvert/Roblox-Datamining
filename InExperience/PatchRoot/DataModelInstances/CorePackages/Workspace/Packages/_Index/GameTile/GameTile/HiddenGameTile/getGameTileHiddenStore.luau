local createGameTileHiddenStoreModule = require(script:FindFirstAncestor("GameTile").HiddenGameTile.createGameTileHiddenStore)
local t = {}

return function(p1)
	-- upvalues: t (ref), createGameTileHiddenStoreModule (ref)
	local var1 = t[p1]
	
	if var1 == nil then
		t[p1] = createGameTileHiddenStoreModule()
		var1 = t[p1]
	end
	return var1
end