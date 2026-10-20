local DataHydration = script:FindFirstAncestor("DataHydration")
local _ = require(DataHydration.Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local FetchAssetUserAuthModule = require(script.Parent.fetchAssetUserAuth)
local _ = require(script.Parent.AssetUserAuthStoreTypes)

local function ALWAYS_REFRESH(): boolean
	return true
end

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), FetchAssetUserAuthModule (copy), ALWAYS_REFRESH (copy)
	local P0 = p1 or {}
	local config = { network = P0.network, baseUrl = P0.baseUrl }
	local DataCacheModule = CreateDataCacheModule()
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		cache = DataCacheModule,
		fetchFn = function(p2, _)
			-- upvalues: FetchAssetUserAuthModule (upval), config (copy)
			return FetchAssetUserAuthModule.fetchOperation(p2, config)
		end
	})
	
	return {
		patchAssetIcon = function(p2, p3)
			-- upvalues: FetchAssetUserAuthModule (upval), config (copy), DataCacheModule (copy)
			return FetchAssetUserAuthModule.patchAssetIcon(p2, p3, config):andThen(function(Result)
				-- upvalues: DataCacheModule (upval)
				local Path: string = Result.path
				
				if typeof(Path) == "string" and #Path > 0 then
					DataCacheModule.updateItem(string.match(Path, "operations/(.+)$") or Path, Result)
				end
				return Result
			end)
		end,
		getOperation = DataResolverModule.getCachedItem,
		fetchOperation = DataResolverModule.fetchItem,
		getAndFetchOperation = function(p2)
			-- upvalues: DataResolverModule (copy), ALWAYS_REFRESH (upval)
			return DataResolverModule.getAndFetchItem(p2, ALWAYS_REFRESH)
		end,
		refreshOperation = function(p2)
			-- upvalues: FetchAssetUserAuthModule (upval), config (copy), DataCacheModule (copy)
			return FetchAssetUserAuthModule.fetchOperation(p2, config):andThen(function(Result)
				-- upvalues: DataCacheModule (upval), p2 (copy)
				DataCacheModule.updateItem(p2, Result)
				
				return Result
			end)
		end,
		updateOperation = DataCacheModule.updateItem,
		clear = DataResolverModule.clear,
		dispose = DataResolverModule.dispose
	}
end