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

local function _(p0, p1)
	-- upvalues: httpService (ref)
	return httpService:JSONEncode({
		momentsSessionId = p0,
		hasCursor = p1 ~= nil,
		cursor = p1 or ""
	})
end

return function(p2)
	-- upvalues: createDataCacheModule (ref), createDataResolverModule (ref), promiseModule (ref), httpClientModule (ref), fetchTrendingMomentsModule (ref), httpService (ref)
	p2 = p2 or {}
	local t = {}
	local var9 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = createDataCacheModule(),
		fetchFn = function(p3, _)
			-- upvalues: t (write), promiseModule (copy), httpClientModule (copy), fetchTrendingMomentsModule (copy), p2 (ref)
			local var10 = t[p3]
			
			return if var10 == nil then promiseModule.reject(`Missing trending moments request params for {p3}`) else httpClientModule.asPromise(fetchTrendingMomentsModule(var10.momentsSessionId, var10.cursor, p2.network))
		end
	})
	
	local function _(value, p4)
		-- upvalues: httpService (copy), t (write)
		local var11 = httpService:JSONEncode({
			momentsSessionId = value,
			hasCursor = p4 ~= nil,
			cursor = p4 or ""
		})
		t[var11] = { momentsSessionId = value, cursor = p4 }
		
		return var11
	end
	
	return {
		getTrending = function(p5, p6, p7)
			-- upvalues: httpClientModule (copy), fetchTrendingMomentsModule (copy), p2 (ref)
			return httpClientModule.asPromise(fetchTrendingMomentsModule(p5, p6, p2.network, p7))
		end,
		getCachedTrending = function(p8, p9)
			-- upvalues: var9 (ref), httpService (copy), t (write)
			local getCachedItem = var9.getCachedItem
			local var12 = httpService:JSONEncode({
				momentsSessionId = p8,
				hasCursor = p9 ~= nil,
				cursor = p9 or ""
			})
			t[var12] = { momentsSessionId = p8, cursor = p9 }
			
			return getCachedItem(var12)
		end,
		fetchTrending = function(p10, p11)
			-- upvalues: var9 (ref), httpService (copy), t (write)
			local fetchItem = var9.fetchItem
			local var13 = httpService:JSONEncode({
				momentsSessionId = p10,
				hasCursor = p11 ~= nil,
				cursor = p11 or ""
			})
			t[var13] = { momentsSessionId = p10, cursor = p11 }
			
			return fetchItem(var13)
		end,
		getAndFetchTrending = function(p12, p13)
			-- upvalues: var9 (ref), httpService (copy), t (write)
			local getAndFetchItem = var9.getAndFetchItem
			local var14 = httpService:JSONEncode({
				momentsSessionId = p12,
				hasCursor = p13 ~= nil,
				cursor = p13 or ""
			})
			t[var14] = { momentsSessionId = p12, cursor = p13 }
			
			return getAndFetchItem(var14)
		end,
		clear = function()
			-- upvalues: t (write), var9 (ref)
			t = {}
			var9.clear()
		end,
		dispose = function()
			-- upvalues: t (write), var9 (ref)
			t = {}
			var9.dispose()
		end
	}
end