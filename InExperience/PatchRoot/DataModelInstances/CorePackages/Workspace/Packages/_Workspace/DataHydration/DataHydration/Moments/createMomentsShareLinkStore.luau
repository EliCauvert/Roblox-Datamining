local dataHydration = script:FindFirstAncestor("DataHydration")
local httpClientModule = require(dataHydration.Parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local fetchShareLinkModule = require(script.Parent.Requests.fetchShareLink)

local function shouldRefreshCachedShareLink(p0)
	return p0 == nil
end

return function(p1)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), httpClientModule (ref), fetchShareLinkModule (ref), shouldRefreshCachedShareLink (ref)
	p1 = p1 or {}
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local var10 = createDataResolverModule({
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
	
	local function _(value, p3, p4, p5)
		-- upvalues: t (write), t_1 (write), t_2 (write)
		t[value] = p3
		t_1[value] = p4
		t_2[value] = p5
		
		return value
	end
	
	return {
		getCachedShareLink = function(p6)
			-- upvalues: var10 (ref)
			return var10.getCachedItem(p6)
		end,
		fetchShareLink = function(p7, p8, p9, p10)
			-- upvalues: var10 (ref), t (write), t_1 (write), t_2 (write)
			local fetchItem = var10.fetchItem
			t[p7] = p8
			t_1[p7] = p9
			t_2[p7] = p10
			
			return fetchItem(p7)
		end,
		getAndFetchShareLink = function(p11, p12, p13, p14)
			-- upvalues: var10 (ref), t (write), t_1 (write), t_2 (write), shouldRefreshCachedShareLink (copy)
			local getAndFetchItem = var10.getAndFetchItem
			t[p11] = p12
			t_1[p11] = p13
			t_2[p11] = p14
			
			return getAndFetchItem(p11, shouldRefreshCachedShareLink)
		end,
		clear = function()
			-- upvalues: t (write), t_1 (write), t_2 (write), var10 (ref)
			t = {}
			t_1 = {}
			t_2 = {}
			var10.clear()
		end,
		dispose = function()
			-- upvalues: t (write), t_1 (write), t_2 (write), var10 (ref)
			t = {}
			t_1 = {}
			t_2 = {}
			var10.dispose()
		end
	}
end