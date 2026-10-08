local dataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(dataHydration.Parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local fetchShareLinkMetadataModule = require(script.Parent.fetchShareLinkMetadata)
local _ = require(script.Parent.ShareLinkMetadataStoreTypes)

return function(p1)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), fetchShareLinkMetadataModule (ref)
	p1 = p1 or {}
	local t = {}
	local var1 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(p1.ttlSeconds, p1.failedTtlSeconds),
		logError = p1.logError,
		fetchFn = function(p2, _)
			-- upvalues: t (write), fetchShareLinkMetadataModule (copy), p1 (ref)
			local var2 = t[p2]
			
			if var2 == nil then
				error(`Missing link type for {p2}`)
			end
			return fetchShareLinkMetadataModule(p2, var2, { network = p1.network, baseUrl = p1.baseUrl })
		end
	})
	
	local function _(value, p3)
		-- upvalues: t (write)
		t[value] = p3
		
		return value
	end
	
	return {
		getShareLinkMetadata = var1.getCachedItem,
		fetchShareLinkMetadata = function(p3, p4)
			-- upvalues: var1 (ref), t (write)
			local fetchItem = var1.fetchItem
			t[p3] = p4
			
			return fetchItem(p3)
		end,
		getAndFetchShareLinkMetadata = function(p3, p4)
			-- upvalues: var1 (ref), t (write)
			local getAndFetchItem = var1.getAndFetchItem
			t[p3] = p4
			
			return getAndFetchItem(p3)
		end,
		clear = function()
			-- upvalues: t (write), var1 (ref)
			t = {}
			var1.clear()
		end,
		dispose = function()
			-- upvalues: t (write), var1 (ref)
			t = {}
			var1.dispose()
		end
	}
end