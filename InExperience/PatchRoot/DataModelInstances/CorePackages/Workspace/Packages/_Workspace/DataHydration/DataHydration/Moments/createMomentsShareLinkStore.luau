local dataHydration = script:FindFirstAncestor("DataHydration")
local httpClientModule = require(dataHydration.Parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local fetchShareLinkModule = require(script.Parent.Requests.fetchShareLink)

local function shouldRefreshCachedShareLink(p1)
	return p1 == nil
end

return function(p1)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), httpClientModule (ref), fetchShareLinkModule (ref), shouldRefreshCachedShareLink (ref)
	p1 = p1 or {}
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var1 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		fetchFn = function(p2, _)
			-- upvalues: httpClientModule (copy), fetchShareLinkModule (copy), t_2 (write), t (write), t_1 (write), p1 (ref)
			return httpClientModule.asPromise(fetchShareLinkModule({
				momentId = p2,
				feedItemId = t_2[p2],
				description = t[p2],
				title = t_1[p2]
			}, p1.network))
		end
	})
	
	local function _(value, p2, p3, p4)
		-- upvalues: t (write), t_1 (write), t_2 (write)
		t[value] = p2
		t_1[value] = p3
		t_2[value] = p4
		
		return value
	end
	
	return {
		getCachedShareLink = function(p2)
			-- upvalues: var1 (ref)
			return var1.getCachedItem(p2)
		end,
		fetchShareLink = function(p2, p3, p4, p5)
			-- upvalues: var1 (ref), t (write), t_1 (write), t_2 (write)
			local fetchItem = var1.fetchItem
			t[p2] = p3
			t_1[p2] = p4
			t_2[p2] = p5
			
			return fetchItem(p2)
		end,
		getAndFetchShareLink = function(p2, p3, p4, p5)
			-- upvalues: var1 (ref), t (write), t_1 (write), t_2 (write), shouldRefreshCachedShareLink (copy)
			local getAndFetchItem = var1.getAndFetchItem
			t[p2] = p3
			t_1[p2] = p4
			t_2[p2] = p5
			
			return getAndFetchItem(p2, shouldRefreshCachedShareLink)
		end,
		clear = function()
			-- upvalues: t (write), t_1 (write), t_2 (write), var1 (ref)
			t = {}
			t_1 = {}
			t_2 = {}
			var1.clear()
		end,
		dispose = function()
			-- upvalues: t (write), t_1 (write), t_2 (write), var1 (ref)
			t = {}
			t_1 = {}
			t_2 = {}
			var1.dispose()
		end
	}
end