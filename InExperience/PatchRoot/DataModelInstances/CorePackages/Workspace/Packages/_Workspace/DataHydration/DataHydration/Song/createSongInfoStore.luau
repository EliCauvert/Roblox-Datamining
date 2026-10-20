local DataHydration = script:FindFirstAncestor("DataHydration")
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)

return function()
	-- upvalues: CreateDataCacheModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	
	return {
		getSongInfo = DataCacheModule.getItem,
		updateSongs = DataCacheModule.updateItems
	}
end