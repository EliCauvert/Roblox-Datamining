local dataHydration = script:FindFirstAncestor("DataHydration")
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)

return function()
	-- upvalues: createDataCacheModule (ref)
	local var1 = createDataCacheModule()
	
	return {
		getSongInfo = var1.getItem,
		updateSongs = var1.updateItems
	}
end