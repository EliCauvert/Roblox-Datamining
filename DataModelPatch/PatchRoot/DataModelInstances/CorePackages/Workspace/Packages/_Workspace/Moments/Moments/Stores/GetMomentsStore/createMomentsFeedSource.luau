local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.Signals)
local PromiseModule = require(Parent.Promise)
local _ = require(Parent.MomentsTypes)
local _ = require(Moments.Components.Feed)
local RecommendationSource = require(Parent.MomentsCommon).Analytics.RecommendationSource
local _ = require(Moments.SignalTracker)
local MomentsGetMomentsTrendingStoreModule = require(Parent.DataHydration.MomentsGetMomentsTrendingStore)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local FetchMomentsByIdsModule = require(script.Parent.fetchMomentsByIds)
local ShouldShowMomentInFeedModule = require(script.Parent.shouldShowMomentInFeed)
local GetDeepLinkStoreModule = require(Moments.Stores.GetDeepLinkStore)
local _ = require(Moments.Stores.GetDeepLinkStore.createDeepLinkStore)
local GetReactionsStoreModule = require(Moments.Stores.GetReactionsStore)
local GetShareCountsStoreModule = require(Moments.Stores.GetShareCountsStore)
local GetFFlagMomentsFilterUnavailableFeedItemsModule = require(Moments.Flags.GetFFlagMomentsFilterUnavailableFeedItems)

local function defaultFetchDeepLinkedMoments(p1)
	-- upvalues: PromiseModule (copy), FetchMomentsByIdsModule (copy)
	return PromiseModule.resolve():andThen(function()
		-- upvalues: FetchMomentsByIdsModule (upval), p1 (copy)
		return FetchMomentsByIdsModule({ p1 })
	end)
end

local function loadDeepLinkedMoments(Callback, ConsumeDeepLinkedMomentIdResult, DeepLinkFetchTimeoutSeconds)
	-- upvalues: PromiseModule (copy)
	local v1, v2 = PromiseModule.race({
		Callback(ConsumeDeepLinkedMomentIdResult):catch(function()
			return nil
		end),
		(PromiseModule.delay(DeepLinkFetchTimeoutSeconds):andThen(function()
			return nil
		end))
	}):await()
	
	return if v1 and type(v2) == "table" then v2 else {
		reactionsByMomentId = nil,
		shareInfoByMomentId = nil,
		moments = {}
	}
end

return function(Callback, p1)
	-- upvalues: MomentsGetMomentsTrendingStoreModule (copy), GetDeepLinkStoreModule (copy), defaultFetchDeepLinkedMoments (copy), RecommendationSource (copy), GetReactionsStoreModule (copy), GetShareCountsStoreModule (copy), loadDeepLinkedMoments (copy), GetFFlagMomentsFilterUnavailableFeedItemsModule (copy), ShouldShowMomentInFeedModule (copy)
	local P3 = p1 or {}
	local MomentsGetMomentsTrendingStoreModuleResult = if P3.trendingStore == nil then MomentsGetMomentsTrendingStoreModule(false) else P3.trendingStore
	local DeepLinkStore = P3.deepLinkStore or GetDeepLinkStoreModule()
	local FetchDeepLinkedMoments = P3.fetchDeepLinkedMoments or defaultFetchDeepLinkedMoments
	local DeepLinkFetchTimeoutSeconds = P3.deepLinkFetchTimeoutSeconds or 20
	local NextCursor = nil
	
	return {
		id = "trending",
		recommendationSource = RecommendationSource.Trending,
		fetchAsync = function(p2)
			-- upvalues: NextCursor (ref), P3 (copy), MomentsGetMomentsTrendingStoreModuleResult (copy), Callback (copy), GetReactionsStoreModule (upval), GetShareCountsStoreModule (upval), DeepLinkStore (copy), loadDeepLinkedMoments (upval), FetchDeepLinkedMoments (copy), DeepLinkFetchTimeoutSeconds (copy), GetFFlagMomentsFilterUnavailableFeedItemsModule (upval), ShouldShowMomentInFeedModule (upval)
			local SignalTracker = P3.signalTracker
			local v1, v2 = MomentsGetMomentsTrendingStoreModuleResult.getTrending(Callback(false), p2 or NextCursor, if SignalTracker then SignalTracker:getSignalsPayload() else nil):await()
			
			if not v1 then
				error(v2)
			end
			NextCursor = v2.nextCursor or NextCursor
			
			if p2 == nil then
				GetReactionsStoreModule(false).clear()
				GetShareCountsStoreModule(false).clear()
			end
			GetReactionsStoreModule(false).setBatchReactionCounts(v2.reactionsByMomentId or {})
			GetShareCountsStoreModule(false).setBatchShareCounts(v2.shareInfoByMomentId or {})
			local List = {}
			
			if p2 == nil then
				local ConsumeDeepLinkedMomentIdResult = DeepLinkStore.consumeDeepLinkedMomentId()
				
				if ConsumeDeepLinkedMomentIdResult ~= nil then
					local t = {}
					
					for _, moment in v2.moments do
						t[moment.momentId] = true
					end
					local DeepLinkedMoments = loadDeepLinkedMoments(FetchDeepLinkedMoments, ConsumeDeepLinkedMomentIdResult, DeepLinkFetchTimeoutSeconds)
					
					if DeepLinkedMoments.reactionsByMomentId then
						GetReactionsStoreModule(false).setBatchReactionCounts(DeepLinkedMoments.reactionsByMomentId)
					end
					if DeepLinkedMoments.shareInfoByMomentId then
						GetShareCountsStoreModule(false).setBatchShareCounts(DeepLinkedMoments.shareInfoByMomentId)
					end
					for _, moment1 in DeepLinkedMoments.moments do
						if (not GetFFlagMomentsFilterUnavailableFeedItemsModule() or ShouldShowMomentInFeedModule(moment1)) and not t[moment1.momentId] then
							table.insert(List, { kind = "moment", moment = moment1 })
						end
					end
				end
			end
			for _, moment2 in v2.moments do
				if if GetFFlagMomentsFilterUnavailableFeedItemsModule() then ShouldShowMomentInFeedModule(moment2) else not moment2.isModerated then
					table.insert(List, { kind = "moment", moment = moment2 })
				end
			end
			return { items = List, nextCursor = v2.nextCursor }
		end
	}
end