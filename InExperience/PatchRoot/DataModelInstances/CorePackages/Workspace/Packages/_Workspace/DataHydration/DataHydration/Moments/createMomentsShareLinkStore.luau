local DataHydration = script:FindFirstAncestor("DataHydration")
local HttpClientModule = require(DataHydration.Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local FetchShareLinkModule = require(script.Parent.Requests.fetchShareLink)

local function shouldRefreshCachedShareLink(p1): boolean --[[ Line: 17 ]]
	return p1 == nil
end

return function(p1) --[[ Line: 21 | Named "createMomentsShareLinkStore" ]]
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), HttpClientModule (copy), FetchShareLinkModule (copy), shouldRefreshCachedShareLink (copy)
	local P1 = p1 or {}
	local T = {}
	local T1 = {}
	local T2 = {}
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(),
		fetchFn = function(MomentId, _) --[[ Line: 34 ]]
			-- upvalues: HttpClientModule (upval), FetchShareLinkModule (upval), T2 (ref), T (ref), T1 (ref), P1 (copy)
			return HttpClientModule.asPromise(FetchShareLinkModule({
				momentId = MomentId,
				feedItemId = T2[MomentId],
				description = T[MomentId],
				title = T1[MomentId]
			}, P1.network))
		end
	})
	
	local function _(Key, p2, p3, p4) --[[ Line: 46 | Named "setRequestParams" ]]
		-- upvalues: T (ref), T1 (ref), T2 (ref)
		T[Key] = p2
		T1[Key] = p3
		T2[Key] = p4
		
		return Key
	end
	
	return {
		getCachedShareLink = function(p2) --[[ Line: 53 ]]
			-- upvalues: DataResolverModule (copy)
			return DataResolverModule.getCachedItem(p2)
		end,
		fetchShareLink = function(Key, p2, p3, p4) --[[ Line: 57 ]]
			-- upvalues: DataResolverModule (copy), T (ref), T1 (ref), T2 (ref)
			T[Key] = p2
			T1[Key] = p3
			T2[Key] = p4
			
			return DataResolverModule.fetchItem(Key)
		end,
		getAndFetchShareLink = function(Key, p2, p3, p4) --[[ Line: 66 ]]
			-- upvalues: DataResolverModule (copy), T (ref), T1 (ref), T2 (ref), shouldRefreshCachedShareLink (upval)
			T[Key] = p2
			T1[Key] = p3
			T2[Key] = p4
			
			return DataResolverModule.getAndFetchItem(Key, shouldRefreshCachedShareLink)
		end,
		clear = function() --[[ Line: 78 ]]
			-- upvalues: T (ref), T1 (ref), T2 (ref), DataResolverModule (copy)
			T = {}
			T1 = {}
			T2 = {}
			DataResolverModule.clear()
		end,
		dispose = function() --[[ Line: 85 ]]
			-- upvalues: T (ref), T1 (ref), T2 (ref), DataResolverModule (copy)
			T = {}
			T1 = {}
			T2 = {}
			DataResolverModule.dispose()
		end
	}
end