local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local HttpService = game:GetService("HttpService")
local PromiseModule = require(Parent.Promise)
local HttpClientModule = require(Parent.HttpClient)
local SignalsModule = require(Parent.Signals)
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(script.Parent.MomentsStoreTypes)
local FetchUserMomentsModule = require(script.Parent.Requests.fetchUserMoments)
local FFlagProfileMomentsOrderingAndReactions = require(Parent.SharedFlags).FFlagProfileMomentsOrderingAndReactions

local function _(TargetUserId, p1) --[[ Line: 29 | Named "paramsKey" ]]
	-- upvalues: HttpService (copy)
	return HttpService:JSONEncode({
		targetUserId = TargetUserId,
		hasCursor = p1 ~= nil,
		cursor = p1 or ""
	})
end

return function(p1) --[[ Line: 37 | Named "createMomentsUserStore" ]]
	-- upvalues: CreateDataCacheModule (copy), CreateDataResolverModule (copy), PromiseModule (copy), HttpClientModule (copy), FetchUserMomentsModule (copy), HttpService (copy), FFlagProfileMomentsOrderingAndReactions (copy), SignalsModule (copy)
	local P2 = p1 or {}
	local T = {}
	local AsPromiseResults = {}
	local TargetUserIds = {}
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = CreateDataCacheModule(),
		fetchFn = function(p2, _) --[[ Line: 50 ]]
			-- upvalues: T (ref), PromiseModule (upval), HttpClientModule (upval), FetchUserMomentsModule (upval), P2 (copy)
			local Entry = T[p2]
			
			return if Entry == nil then PromiseModule.reject(`Missing user moments request params for {p2}`) else HttpClientModule.asPromise(FetchUserMomentsModule(Entry.targetUserId, Entry.cursor, P2.network))
		end
	})
	
	local function _(TargetUserId, Cursor) --[[ Line: 59 | Named "setParams" ]]
		-- upvalues: HttpService (upval), T (ref)
		local Json = HttpService:JSONEncode({
			targetUserId = TargetUserId,
			hasCursor = Cursor ~= nil,
			cursor = Cursor or ""
		})
		T[Json] = { targetUserId = TargetUserId, cursor = Cursor }
		
		return Json
	end
	
	local function getCachedUserMoments(TargetUserId, Cursor) --[[ Line: 68 ]]
		-- upvalues: DataResolverModule (copy), HttpService (upval), T (ref)
		local GetCachedItemFunction = DataResolverModule.getCachedItem
		local Json = HttpService:JSONEncode({
			targetUserId = TargetUserId,
			hasCursor = Cursor ~= nil,
			cursor = Cursor or ""
		})
		T[Json] = { targetUserId = TargetUserId, cursor = Cursor }
		
		return GetCachedItemFunction(Json)
	end
	
	local function fetchUserMomentsItem(TargetUserId, Cursor) --[[ Line: 75 ]]
		-- upvalues: DataResolverModule (copy), HttpService (upval), T (ref)
		local FetchItemFunction = DataResolverModule.fetchItem
		local Json = HttpService:JSONEncode({
			targetUserId = TargetUserId,
			hasCursor = Cursor ~= nil,
			cursor = Cursor or ""
		})
		T[Json] = { targetUserId = TargetUserId, cursor = Cursor }
		
		return FetchItemFunction(Json)
	end
	
	local function getAndFetchUserMoments(TargetUserId, Cursor) --[[ Line: 82 ]]
		-- upvalues: DataResolverModule (copy), HttpService (upval), T (ref)
		local GetAndFetchItemFunction = DataResolverModule.getAndFetchItem
		local Json = HttpService:JSONEncode({
			targetUserId = TargetUserId,
			hasCursor = Cursor ~= nil,
			cursor = Cursor or ""
		})
		T[Json] = { targetUserId = TargetUserId, cursor = Cursor }
		
		return GetAndFetchItemFunction(Json)
	end
	
	local function getUserMoments(TargetUserId, p3) --[[ Line: 89 ]]
		-- upvalues: FFlagProfileMomentsOrderingAndReactions (upval), HttpClientModule (upval), FetchUserMomentsModule (upval), P2 (copy), HttpService (upval), AsPromiseResults (ref), TargetUserIds (ref)
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
			TargetUserIds[Json] = TargetUserId
			AsPromiseResult1:catch(function() --[[ Line: 101 ]]
				-- upvalues: AsPromiseResults (upval), Json (copy), TargetUserIds (upval)
				AsPromiseResults[Json] = nil
				TargetUserIds[Json] = nil
			end)
			
			return AsPromiseResult1
		else
			return AsPromiseResult
		end
	end
	
	local function getFreshUserMoments(p3, p4) --[[ Line: 110 ]]
		-- upvalues: HttpClientModule (upval), FetchUserMomentsModule (upval), P2 (copy)
		return HttpClientModule.asPromise(FetchUserMomentsModule(p3, p4, P2.network))
	end
	
	local Signal, Signal2 = SignalsModule.createSignal(0)
	local Signal1, Signal2_1 = SignalsModule.createSignal({})
	
	return {
		getUserMoments = getUserMoments,
		getFreshUserMoments = getFreshUserMoments,
		getCachedUserMoments = getCachedUserMoments,
		fetchUserMoments = fetchUserMomentsItem,
		getAndFetchUserMoments = getAndFetchUserMoments,
		evictUserMoments = function(p3) --[[ Line: 183 ]]
			-- upvalues: TargetUserIds (ref), AsPromiseResults (ref)
			for i, targetUserId in TargetUserIds do
				if targetUserId == p3 then
					AsPromiseResults[i] = nil
					TargetUserIds[i] = nil
				end
			end
		end,
		invalidateUser = function(p4) --[[ Line: 192 ]]
			-- upvalues: TargetUserIds (ref), AsPromiseResults (ref), Signal2 (copy), Signal (copy)
			for i, targetUserId in TargetUserIds do
				if targetUserId == p4 then
					AsPromiseResults[i] = nil
					TargetUserIds[i] = nil
				end
			end
			Signal2(Signal(false) + 1)
		end,
		getUserMomentsVersion = Signal,
		getPendingUserMoments = Signal1,
		prependPendingUserMoment = function(Key, Moment) --[[ Line: 121 ]]
			-- upvalues: Signal1 (copy), Signal2_1 (copy)
			local Copy = table.clone(Signal1(false))
			local Copy1 = table.clone(Copy[Key] or {})
			table.insert(Copy1, 1, { moment = Moment })
			Copy[Key] = Copy1
			Signal2_1(Copy)
		end,
		removePendingUserMoment = function(Key, MomentId) --[[ Line: 129 ]]
			-- upvalues: Signal1 (copy), Signal2_1 (copy)
			local Copy = table.clone(Signal1(false))
			local Entry = Copy[Key]
			
			if Entry == nil then return end
			local List = {}
			
			for _, value in Entry do
				if value.moment.momentId ~= MomentId then
					table.insert(List, value)
				end
			end
			Copy[Key] = if #List > 0 then List else nil
			Signal2_1(Copy)
		end,
		resolvePendingUserMoment = function(Key, MomentId, PublishedMoment): boolean --[[ Line: 145 ]]
			-- upvalues: Signal1 (copy), Signal2_1 (copy)
			local Copy = table.clone(Signal1(false))
			local Tbl = Copy[Key] or {}
			local v1 = nil
			local FeedItemId = PublishedMoment.recommendationMetadata.feedItemId
			
			for i, value in Tbl do
				if value.moment.momentId == MomentId then
					v1 = i
				elseif value.publishedMoment ~= nil then
					local PublishedMoment1 = value.publishedMoment
					
					if PublishedMoment1.momentId == PublishedMoment.momentId or FeedItemId ~= nil and FeedItemId ~= "" and PublishedMoment1.recommendationMetadata.feedItemId == FeedItemId then
						return false
					end
				end
			end
			if v1 == nil then
				return false
			else
				local Copy1 = table.clone(Tbl)
				Copy1[v1] = {
					moment = Tbl[v1].moment,
					publishedMoment = PublishedMoment
				}
				Copy[Key] = Copy1
				Signal2_1(Copy)
				
				return true
			end
		end,
		clear = function() --[[ Line: 197 ]]
			-- upvalues: Signal2_1 (copy), T (ref), FFlagProfileMomentsOrderingAndReactions (upval), AsPromiseResults (ref), TargetUserIds (ref), DataResolverModule (copy)
			Signal2_1({})
			T = {}
			
			if FFlagProfileMomentsOrderingAndReactions then
				AsPromiseResults = {}
				TargetUserIds = {}
			end
			DataResolverModule.clear()
		end,
		dispose = function() --[[ Line: 207 ]]
			-- upvalues: Signal2_1 (copy), T (ref), FFlagProfileMomentsOrderingAndReactions (upval), AsPromiseResults (ref), TargetUserIds (ref), DataResolverModule (copy)
			Signal2_1({})
			T = {}
			
			if FFlagProfileMomentsOrderingAndReactions then
				AsPromiseResults = {}
				TargetUserIds = {}
			end
			DataResolverModule.dispose()
		end
	}
end