local dataHydration = script:FindFirstAncestor("DataHydration")
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)

return function()
	-- upvalues: createDataCacheModule (ref)
	local var2 = createDataCacheModule()
	
	return {
		getSongInfo = var2.getItem,
		updateSongs = var2.updateItems
	}
end