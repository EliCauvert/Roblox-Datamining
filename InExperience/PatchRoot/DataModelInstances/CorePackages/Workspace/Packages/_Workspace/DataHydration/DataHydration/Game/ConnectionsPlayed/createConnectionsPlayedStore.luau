local dataHydration = script:FindFirstAncestor("DataHydration")
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.ConnectionsPlayedStoreTypes)

return function()
	-- upvalues: createDataCacheModule (ref)
	local var1 = createDataCacheModule()
	
	return {
		getConnectionsPlayed = var1.getItem,
		updateItems = var1.updateItems,
		clear = var1.clear
	}
end