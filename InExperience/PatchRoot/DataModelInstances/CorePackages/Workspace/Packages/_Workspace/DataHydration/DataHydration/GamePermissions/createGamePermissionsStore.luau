local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchGamePermissionsModule = require(script.Parent.fetchGamePermissions)
local _ = require(script.Parent.GamePermissionsStoreTypes)

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), FetchGamePermissionsModule (copy)
	local P0 = p1 or {}
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(),
		fetchFn = function(p2, _)
			-- upvalues: FetchGamePermissionsModule (upval), P0 (copy)
			return FetchGamePermissionsModule.fetchUniversePermissions(tonumber(p2), { network = P0.network, baseUrl = P0.baseUrl })
		end
	})
	
	return {
		fetchUniversePermissions = function(Number)
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.fetchItem((tostring(Number)))
		end,
		getAndFetchUniversePermissions = function(p2)
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getAndFetchItem((tostring(p2)))
		end,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end