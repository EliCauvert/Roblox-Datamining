local DataHydration = script:FindFirstAncestor("DataHydration")
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.GameSubscriptionStoreTypes)

return function() --[[ Line: 12 | Named "createGameSubscriptionStore" ]]
	-- upvalues: CreateDataCacheModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	
	return {
		getGameSubscriptionInfo = DataCacheModule.getItem,
		updateGameSubscriptionInfo = DataCacheModule.updateItem,
		updateGameSubscriptionInfos = DataCacheModule.updateItems,
		clear = DataCacheModule.clear,
		dispose = DataCacheModule.dispose
	}
end