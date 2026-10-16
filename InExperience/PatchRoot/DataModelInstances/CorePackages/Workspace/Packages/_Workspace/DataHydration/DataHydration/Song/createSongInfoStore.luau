local DataHydration = script:FindFirstAncestor("DataHydration")
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)

return function() --[[ Line: 14 | Named "createSongInfoStore" ]]
	-- upvalues: CreateDataCacheModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	
	return {
		getSongInfo = DataCacheModule.getItem,
		updateSongs = DataCacheModule.updateItems
	}
end