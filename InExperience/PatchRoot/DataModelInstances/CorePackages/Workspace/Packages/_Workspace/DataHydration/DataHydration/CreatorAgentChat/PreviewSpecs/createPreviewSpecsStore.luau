local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchPreviewSpecsModule = require(script.Parent.fetchPreviewSpecs)
local _ = require(script.Parent.PreviewSpecsTypes)

return function(p1) --[[ Line: 24 | Named "createPreviewSpecsStore" ]]
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), FetchPreviewSpecsModule (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(),
		fetchFn = function(_, _) --[[ Line: 33 ]]
			-- upvalues: FetchPreviewSpecsModule (upval), config (copy)
			return FetchPreviewSpecsModule(config)
		end
	})
	
	return {
		refreshPreviewSpecs = function() --[[ Line: 39 ]]
			-- upvalues: DataResolverModule (copy)
			DataResolverModule.clear()
			
			return (DataResolverModule.fetchItem("preview-specs"))
		end,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end