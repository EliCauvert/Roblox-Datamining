local dataHydration = script:FindFirstAncestor("DataHydration")
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.GameSubscriptionStoreTypes)

return function()
	-- upvalues: createDataCacheModule (ref)
	local var2 = createDataCacheModule()
	
	return {
		getGameSubscriptionInfo = var2.getItem,
		updateGameSubscriptionInfo = var2.updateItem,
		updateGameSubscriptionInfos = var2.updateItems,
		clear = var2.clear,
		dispose = var2.dispose
	}
end