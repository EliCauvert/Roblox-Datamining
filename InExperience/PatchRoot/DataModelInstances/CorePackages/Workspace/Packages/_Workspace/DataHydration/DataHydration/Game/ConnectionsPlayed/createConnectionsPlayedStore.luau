local dataHydration = script:FindFirstAncestor("DataHydration")
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.ConnectionsPlayedStoreTypes)

return function()
	-- upvalues: createDataCacheModule (ref)
	local var2 = createDataCacheModule()
	
	return {
		getConnectionsPlayed = var2.getItem,
		updateItems = var2.updateItems,
		clear = var2.clear
	}
end