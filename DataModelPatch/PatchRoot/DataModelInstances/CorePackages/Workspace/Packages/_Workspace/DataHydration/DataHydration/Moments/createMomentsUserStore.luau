local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Parent.Promise)
local HttpClientModule = require(Parent.HttpClient)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local FetchUserMomentsModule = require(script.Parent.Requests.fetchUserMoments)
local FFlagProfileMomentsOrderingAndReactions = require(Parent.SharedFlags).FFlagProfileMomentsOrderingAndReactions

local function _(TargetUserId, p1)
	-- upvalues: HttpService (copy)
	return HttpService:JSONEncode({
		targetUserId = TargetUserId,
		hasCursor = p1 ~= nil,
		cursor = p1 or ""
	})
end

return function(p1)
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy), HttpClientModule (copy), FetchUserMomentsModule (copy), HttpService (copy), FFlagProfileMomentsOrderingAndReactions (copy)
	local P2 = p1 or {}
	local T = {}
	local AsPromiseResults = {}
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(),
		fetchFn = function(p2, _)
			-- upvalues: T (ref), PromiseModule (upval), HttpClientModule (upval), FetchUserMomentsModule (upval), P2 (copy)
			local Entry = T[p2]
			
			return if Entry == nil then PromiseModule.reject(`Missing user moments request params for {p2}`) else HttpClientModule.asPromise(FetchUserMomentsModule(Entry.targetUserId, Entry.cursor, P2.network))
		end
	})
	
	local function _(TargetUserId, Cursor)
		-- upvalues: HttpService (upval), T (ref)
		local Json = HttpService:JSONEncode({
			targetUserId = TargetUserId,
			hasCursor = Cursor ~= nil,
			cursor = Cursor or ""
		})
		T[Json] = { targetUserId = TargetUserId, cursor = Cursor }
		
		return Json
	end
	
	return {
		getUserMoments = function(TargetUserId, p3)
			-- upvalues: FFlagProfileMomentsOrderingAndReactions (upval), HttpClientModule (upval), FetchUserMomentsModule (upval), P2 (copy), HttpService (upval), AsPromiseResults (ref)
			if not FFlagProfileMomentsOrderingAndReactions then
				return HttpClientModule.asPromise(FetchUserMomentsModule(TargetUserId, p3, P2.network))
			end
			local Json = HttpService:JSONEncode({
				targetUserId = TargetUserId,
				hasCursor = p3 ~= nil,
				cursor = p3 or ""
			})
			local AsPromiseResult = AsPromiseResults[Json]
			
			if AsPromiseResult == nil then
				local AsPromiseResult1 = HttpClientModule.asPromise(FetchUserMomentsModule(TargetUserId, p3, P2.network))
				AsPromiseResults[Json] = AsPromiseResult1
				AsPromiseResult1:catch(function()
					-- upvalues: AsPromiseResults (upval), Json (copy)
					AsPromiseResults[Json] = nil
				end)
				
				return AsPromiseResult1
			else
				return AsPromiseResult
			end
		end,
		getCachedUserMoments = function(TargetUserId, Cursor)
			-- upvalues: DataResolverModule (copy), HttpService (upval), T (ref)
			local GetCachedItemFunction = DataResolverModule.getCachedItem
			local Json = HttpService:JSONEncode({
				targetUserId = TargetUserId,
				hasCursor = Cursor ~= nil,
				cursor = Cursor or ""
			})
			T[Json] = { targetUserId = TargetUserId, cursor = Cursor }
			
			return GetCachedItemFunction(Json)
		end,
		fetchUserMoments = function(TargetUserId, Cursor)
			-- upvalues: DataResolverModule (copy), HttpService (upval), T (ref)
			local FetchItemFunction = DataResolverModule.fetchItem
			local Json = HttpService:JSONEncode({
				targetUserId = TargetUserId,
				hasCursor = Cursor ~= nil,
				cursor = Cursor or ""
			})
			T[Json] = { targetUserId = TargetUserId, cursor = Cursor }
			
			return FetchItemFunction(Json)
		end,
		getAndFetchUserMoments = function(TargetUserId, Cursor)
			-- upvalues: DataResolverModule (copy), HttpService (upval), T (ref)
			local GetAndFetchItemFunction = DataResolverModule.getAndFetchItem
			local Json = HttpService:JSONEncode({
				targetUserId = TargetUserId,
				hasCursor = Cursor ~= nil,
				cursor = Cursor or ""
			})
			T[Json] = { targetUserId = TargetUserId, cursor = Cursor }
			
			return GetAndFetchItemFunction(Json)
		end,
		clear = function()
			-- upvalues: T (ref), FFlagProfileMomentsOrderingAndReactions (upval), AsPromiseResults (ref), DataResolverModule (copy)
			T = {}
			
			if FFlagProfileMomentsOrderingAndReactions then
				AsPromiseResults = {}
			end
			DataResolverModule.clear()
		end,
		dispose = function()
			-- upvalues: T (ref), FFlagProfileMomentsOrderingAndReactions (upval), AsPromiseResults (ref), DataResolverModule (copy)
			T = {}
			
			if FFlagProfileMomentsOrderingAndReactions then
				AsPromiseResults = {}
			end
			DataResolverModule.dispose()
		end
	}
end