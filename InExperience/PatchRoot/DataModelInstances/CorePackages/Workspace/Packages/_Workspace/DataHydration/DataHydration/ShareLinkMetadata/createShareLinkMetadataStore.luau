local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchShareLinkMetadataModule = require(script.Parent.fetchShareLinkMetadata)
local _ = require(script.Parent.ShareLinkMetadataStoreTypes)

return function(p1) --[[ Line: 22 | Named "createShareLinkMetadataStore" ]]
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), FetchShareLinkMetadataModule (copy)
	local P0 = p1 or {}
	local T = {}
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(P0.ttlSeconds, P0.failedTtlSeconds),
		logError = P0.logError,
		fetchFn = function(p2, _) --[[ Line: 32 ]]
			-- upvalues: T (ref), FetchShareLinkMetadataModule (upval), P0 (copy)
			local Entry = T[p2]
			
			if Entry == nil then
				error(`Missing link type for {p2}`)
			end
			return FetchShareLinkMetadataModule(p2, Entry, { network = P0.network, baseUrl = P0.baseUrl })
		end
	})
	
	local function _(Key, p3) --[[ Line: 47 | Named "setLinkType" ]]
		-- upvalues: T (ref)
		T[Key] = p3
		
		return Key
	end
	
	return {
		getShareLinkMetadata = DataResolverModule.getCachedItem,
		fetchShareLinkMetadata = function(Key, p3) --[[ Line: 64 ]]
			-- upvalues: DataResolverModule (copy), T (ref)
			T[Key] = p3
			
			return DataResolverModule.fetchItem(Key)
		end,
		getAndFetchShareLinkMetadata = function(Key, p3) --[[ Line: 67 ]]
			-- upvalues: DataResolverModule (copy), T (ref)
			T[Key] = p3
			
			return DataResolverModule.getAndFetchItem(Key)
		end,
		clear = function() --[[ Line: 52 ]]
			-- upvalues: T (ref), DataResolverModule (copy)
			T = {}
			DataResolverModule.clear()
		end,
		dispose = function() --[[ Line: 57 ]]
			-- upvalues: T (ref), DataResolverModule (copy)
			T = {}
			DataResolverModule.dispose()
		end
	}
end