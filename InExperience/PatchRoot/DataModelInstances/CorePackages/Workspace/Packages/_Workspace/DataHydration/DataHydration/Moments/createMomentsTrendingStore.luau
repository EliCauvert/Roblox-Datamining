local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local httpService = game:GetService("HttpService")
local promiseModule = require(parent.Promise)
local httpClientModule = require(parent.HttpClient)
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local fetchTrendingMomentsModule = require(script.Parent.Requests.fetchTrendingMoments)

local function _(p1, p2)
	-- upvalues: httpService (ref)
	return httpService:JSONEncode({
		momentsSessionId = p1,
		hasCursor = p2 ~= nil,
		cursor = p2 or ""
	})
end

return function(p1)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), httpClientModule (ref), fetchTrendingMomentsModule (ref), httpService (ref)
	p1 = p1 or {}
	local t = {}
	local var1 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		fetchFn = function(p2, _)
			-- upvalues: t (write), promiseModule (copy), httpClientModule (copy), fetchTrendingMomentsModule (copy), p1 (ref)
			local var2 = t[p2]
			
			return if var2 == nil then promiseModule.reject(`Missing trending moments request params for {p2}`) else httpClientModule.asPromise(fetchTrendingMomentsModule(var2.momentsSessionId, var2.cursor, p1.network))
		end
	})
	
	local function _(value, p3)
		-- upvalues: httpService (copy), t (write)
		local var3 = httpService:JSONEncode({
			momentsSessionId = value,
			hasCursor = p3 ~= nil,
			cursor = p3 or ""
		})
		t[var3] = { momentsSessionId = value, cursor = p3 }
		
		return var3
	end
	
	return {
		getTrending = function(p3, p4, p5)
			-- upvalues: httpClientModule (copy), fetchTrendingMomentsModule (copy), p1 (ref)
			return httpClientModule.asPromise(fetchTrendingMomentsModule(p3, p4, p1.network, p5))
		end,
		getCachedTrending = function(p3, p4)
			-- upvalues: var1 (ref), httpService (copy), t (write)
			local getCachedItem = var1.getCachedItem
			local var3 = httpService:JSONEncode({
				momentsSessionId = p3,
				hasCursor = p4 ~= nil,
				cursor = p4 or ""
			})
			t[var3] = { momentsSessionId = p3, cursor = p4 }
			
			return getCachedItem(var3)
		end,
		fetchTrending = function(p3, p4)
			-- upvalues: var1 (ref), httpService (copy), t (write)
			local fetchItem = var1.fetchItem
			local var3 = httpService:JSONEncode({
				momentsSessionId = p3,
				hasCursor = p4 ~= nil,
				cursor = p4 or ""
			})
			t[var3] = { momentsSessionId = p3, cursor = p4 }
			
			return fetchItem(var3)
		end,
		getAndFetchTrending = function(p3, p4)
			-- upvalues: var1 (ref), httpService (copy), t (write)
			local getAndFetchItem = var1.getAndFetchItem
			local var3 = httpService:JSONEncode({
				momentsSessionId = p3,
				hasCursor = p4 ~= nil,
				cursor = p4 or ""
			})
			t[var3] = { momentsSessionId = p3, cursor = p4 }
			
			return getAndFetchItem(var3)
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