local dataHydration = script:FindFirstAncestor("DataHydration")
local httpClientModule = require(dataHydration.Parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local fetchShareLinkModule = require(script.Parent.Requests.fetchShareLink)

local function shouldRefreshCachedShareLink(p0) --[[ line: 17 ]]
	return p0 == nil
end

return function(p1) --[[ line: 21 | named "createMomentsShareLinkStore" ]]
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), httpClientModule (ref), fetchShareLinkModule (ref), shouldRefreshCachedShareLink (ref)
	p1 = p1 or {}
	local t = {}
	local t_1 = {}
	local var9 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		fetchFn = function(p2, _) --[[ line: 33 ]]
			-- upvalues: httpClientModule (copy), fetchShareLinkModule (copy), t (write), t_1 (write), p1 (ref)
			return httpClientModule.asPromise(fetchShareLinkModule({ momentId = p2, description = t[p2], title = t_1[p2] }, p1.network))
		end
	})
	
	local function _(value, p3, p4) --[[ line: 42 | named "setRequestParams" ]]
		-- upvalues: t (write), t_1 (write)
		t[value] = p3
		t_1[value] = p4
		
		return value
	end
	
	return {
		getCachedShareLink = function(p5) --[[ line: 48 ]]
			-- upvalues: var9 (ref)
			return var9.getCachedItem(p5)
		end,
		fetchShareLink = function(p6, p7, p8) --[[ line: 52 ]]
			-- upvalues: var9 (ref), t (write), t_1 (write)
			local fetchItem = var9.fetchItem
			t[p6] = p7
			t_1[p6] = p8
			
			return fetchItem(p6)
		end,
		getAndFetchShareLink = function(p9, p10, p11) --[[ line: 60 ]]
			-- upvalues: var9 (ref), t (write), t_1 (write), shouldRefreshCachedShareLink (copy)
			local getAndFetchItem = var9.getAndFetchItem
			t[p9] = p10
			t_1[p9] = p11
			
			return getAndFetchItem(p9, shouldRefreshCachedShareLink)
		end,
		clear = function() --[[ line: 68 ]]
			-- upvalues: t (write), t_1 (write), var9 (ref)
			t = {}
			t_1 = {}
			var9.clear()
		end,
		dispose = function() --[[ line: 74 ]]
			-- upvalues: t (write), t_1 (write), var9 (ref)
			t = {}
			t_1 = {}
			var9.dispose()
		end
	}
end