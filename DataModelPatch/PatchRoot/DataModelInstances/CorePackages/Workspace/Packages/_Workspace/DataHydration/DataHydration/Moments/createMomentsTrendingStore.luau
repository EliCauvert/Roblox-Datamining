local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Parent.Promise)
local HttpClientModule = require(Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local FetchTrendingMomentsModule = require(script.Parent.Requests.fetchTrendingMoments)

local function _(MomentsSessionId, p1)
	-- upvalues: HttpService (copy)
	return HttpService:JSONEncode({
		momentsSessionId = MomentsSessionId,
		hasCursor = p1 ~= nil,
		cursor = p1 or ""
	})
end

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy), HttpClientModule (copy), FetchTrendingMomentsModule (copy), HttpService (copy)
	local P2 = p1 or {}
	local T = {}
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(),
		fetchFn = function(p2, _)
			-- upvalues: T (ref), PromiseModule (upval), HttpClientModule (upval), FetchTrendingMomentsModule (upval), P2 (copy)
			local Entry = T[p2]
			
			return if Entry == nil then PromiseModule.reject(`Missing trending moments request params for {p2}`) else HttpClientModule.asPromise(FetchTrendingMomentsModule(Entry.momentsSessionId, Entry.cursor, P2.network))
		end
	})
	
	local function _(MomentsSessionId, Cursor)
		-- upvalues: HttpService (upval), T (ref)
		local Json = HttpService:JSONEncode({
			momentsSessionId = MomentsSessionId,
			hasCursor = Cursor ~= nil,
			cursor = Cursor or ""
		})
		T[Json] = { momentsSessionId = MomentsSessionId, cursor = Cursor }
		
		return Json
	end
	
	return {
		getTrending = function(p3, p4, p5)
			-- upvalues: HttpClientModule (upval), FetchTrendingMomentsModule (upval), P2 (copy)
			return HttpClientModule.asPromise(FetchTrendingMomentsModule(p3, p4, P2.network, p5))
		end,
		getCachedTrending = function(MomentsSessionId, Cursor)
			-- upvalues: DataResolverModule (copy), HttpService (upval), T (ref)
			local GetCachedItemFunction = DataResolverModule.getCachedItem
			local Json = HttpService:JSONEncode({
				momentsSessionId = MomentsSessionId,
				hasCursor = Cursor ~= nil,
				cursor = Cursor or ""
			})
			T[Json] = { momentsSessionId = MomentsSessionId, cursor = Cursor }
			
			return GetCachedItemFunction(Json)
		end,
		fetchTrending = function(MomentsSessionId, Cursor)
			-- upvalues: DataResolverModule (copy), HttpService (upval), T (ref)
			local FetchItemFunction = DataResolverModule.fetchItem
			local Json = HttpService:JSONEncode({
				momentsSessionId = MomentsSessionId,
				hasCursor = Cursor ~= nil,
				cursor = Cursor or ""
			})
			T[Json] = { momentsSessionId = MomentsSessionId, cursor = Cursor }
			
			return FetchItemFunction(Json)
		end,
		getAndFetchTrending = function(MomentsSessionId, Cursor)
			-- upvalues: DataResolverModule (copy), HttpService (upval), T (ref)
			local GetAndFetchItemFunction = DataResolverModule.getAndFetchItem
			local Json = HttpService:JSONEncode({
				momentsSessionId = MomentsSessionId,
				hasCursor = Cursor ~= nil,
				cursor = Cursor or ""
			})
			T[Json] = { momentsSessionId = MomentsSessionId, cursor = Cursor }
			
			return GetAndFetchItemFunction(Json)
		end,
		clear = function()
			-- upvalues: T (ref), DataResolverModule (copy)
			T = {}
			DataResolverModule.clear()
		end,
		dispose = function()
			-- upvalues: T (ref), DataResolverModule (copy)
			T = {}
			DataResolverModule.dispose()
		end
	}
end