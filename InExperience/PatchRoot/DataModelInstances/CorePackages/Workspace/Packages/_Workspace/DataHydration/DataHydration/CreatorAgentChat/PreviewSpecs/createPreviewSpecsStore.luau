local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchPreviewSpecsModule = require(script.Parent.fetchPreviewSpecs)
local _ = require(script.Parent.PreviewSpecsTypes)

return function(p1)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), fetchPreviewSpecsModule (ref)
	p1 = p1 or {}
	local t = { network = p1.network, baseUrl = p1.baseUrl }
	local var1 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		fetchFn = function(_, _)
			-- upvalues: fetchPreviewSpecsModule (copy), t (ref)
			return fetchPreviewSpecsModule(t)
		end
	})
	
	return {
		refreshPreviewSpecs = function()
			-- upvalues: var1 (ref)
			var1.clear()
			
			return var1.fetchItem("preview-specs")
		end,
		clear = var1.clear,
		dispose = var1.dispose
	}
end