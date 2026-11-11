local DataHydration = script:FindFirstAncestor("DataHydration")
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.ConnectionsPlayedStoreTypes)

return function()
	-- upvalues: CreateDataCacheModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	
	return {
		getConnectionsPlayed = DataCacheModule.getItem,
		updateItems = DataCacheModule.updateItems,
		clear = DataCacheModule.clear
	}
end