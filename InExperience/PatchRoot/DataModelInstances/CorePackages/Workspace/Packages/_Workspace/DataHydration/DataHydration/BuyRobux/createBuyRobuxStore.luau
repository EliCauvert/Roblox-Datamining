local DataHydration = script:FindFirstAncestor("DataHydration")
local CreateDataCacheModule = require(DataHydration.createDataCache)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.BuyRobuxStoreTypes)

return function()
	-- upvalues: CreateDataCacheModule (copy)
	local DataCacheModule = CreateDataCacheModule()
	
	return {
		getInfo = DataCacheModule.getItem,
		updateInfos = DataCacheModule.replaceItems,
		clear = DataCacheModule.clear,
		dispose = DataCacheModule.dispose
	}
end