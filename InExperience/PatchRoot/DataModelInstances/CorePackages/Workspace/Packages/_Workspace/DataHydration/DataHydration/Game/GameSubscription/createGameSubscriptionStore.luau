local dataHydration = script:FindFirstAncestor("DataHydration")
local createDataCacheModule = require(dataHydration.createDataCache)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.GameSubscriptionStoreTypes)

return function()
	-- upvalues: createDataCacheModule (ref)
	local var1 = createDataCacheModule()
	
	return {
		getGameSubscriptionInfo = var1.getItem,
		updateGameSubscriptionInfo = var1.updateItem,
		updateGameSubscriptionInfos = var1.updateItems,
		clear = var1.clear,
		dispose = var1.dispose
	}
end