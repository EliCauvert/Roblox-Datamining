local DataHydration = script:FindFirstAncestor("DataHydration")
local HttpClientModule = require(DataHydration.Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local FetchShareLinkModule = require(script.Parent.Requests.fetchShareLink)

local function shouldRefreshCachedShareLink(p1): boolean
	return p1 == nil
end

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), HttpClientModule (copy), FetchShareLinkModule (copy), shouldRefreshCachedShareLink (copy)
	local P1 = p1 or {}
	local T = {}
	local T1 = {}
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(),
		fetchFn = function(MomentId, _)
			-- upvalues: HttpClientModule (upval), FetchShareLinkModule (upval), T (ref), T1 (ref), P1 (copy)
			return HttpClientModule.asPromise(FetchShareLinkModule({
				momentId = MomentId,
				description = T[MomentId],
				title = T1[MomentId]
			}, P1.network))
		end
	})
	
	local function _(Key, p2, p3)
		-- upvalues: T (ref), T1 (ref)
		T[Key] = p2
		T1[Key] = p3
		
		return Key
	end
	
	return {
		getCachedShareLink = function(p2)
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getCachedItem(p2)
		end,
		fetchShareLink = function(Key, p2, p3)
			-- upvalues: DataResolverModule (copy), T (ref), T1 (ref)
			T[Key] = p2
			T1[Key] = p3
			
			return DataResolverModule.fetchItem(Key)
		end,
		getAndFetchShareLink = function(Key, p2, p3)
			-- upvalues: DataResolverModule (copy), T (ref), T1 (ref), shouldRefreshCachedShareLink (upval)
			T[Key] = p2
			T1[Key] = p3
			
			return DataResolverModule.getAndFetchItem(Key, shouldRefreshCachedShareLink)
		end,
		clear = function()
			-- upvalues: T (ref), T1 (ref), DataResolverModule (copy)
			T = {}
			T1 = {}
			DataResolverModule.clear()
		end,
		dispose = function()
			-- upvalues: T (ref), T1 (ref), DataResolverModule (copy)
			T = {}
			T1 = {}
			DataResolverModule.dispose()
		end
	}
end