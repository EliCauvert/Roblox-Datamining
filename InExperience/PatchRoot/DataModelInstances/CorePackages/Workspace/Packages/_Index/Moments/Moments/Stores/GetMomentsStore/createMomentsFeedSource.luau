local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.Signals)
local PromiseModule = require(Parent.Promise)
local MomentsCommonModule = require(Parent.MomentsCommon)
local SharedFlagsModule = require(Parent.SharedFlags)
local _ = require(Moments.Components.Feed)
local Analytics = MomentsCommonModule.Analytics
local RecommendationSource = MomentsCommonModule.Analytics.RecommendationSource
local _ = require(Moments.SignalTracker)
local MomentsGetMomentsTrendingStoreModule = require(Parent.DataHydration.MomentsGetMomentsTrendingStore)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local CreatePendingFeedGetterModule = require(script.Parent.createPendingFeedGetter)
local MomentsGetMomentsUserStoreModule = require(Parent.DataHydration.MomentsGetMomentsUserStore)
local GetLocalUserIdModule = require(Moments.Utils.getLocalUserId)
local FetchMomentsByIdsModule = require(script.Parent.fetchMomentsByIds)
local ShouldShowMomentInFeedModule = require(script.Parent.shouldShowMomentInFeed)
local ReportUnavailableFeedItemModule = require(script.Parent.reportUnavailableFeedItem)
local GetDeepLinkStoreModule = require(Moments.Stores.GetDeepLinkStore)
local _ = require(Moments.Stores.GetDeepLinkStore.createDeepLinkStore)
local GetReactionsStoreModule = require(Moments.Stores.GetReactionsStore)
local GetShareCountsStoreModule = require(Moments.Stores.GetShareCountsStore)
local FFlagMomentsOptimisticProfilePending = SharedFlagsModule.FFlagMomentsOptimisticProfilePending
local FFlagMomentsModeratedMomentPageModule = require(Moments.Flags.FFlagMomentsModeratedMomentPage)
local FFlagMomentsComments = SharedFlagsModule.FFlagMomentsComments
local MomentsGetMomentsCommentsStoreModule = if FFlagMomentsComments then require(Parent.DataHydration.MomentsGetMomentsCommentsStore) else nil
local MomentStatus = require(Parent.MomentsTypes).Enums.MomentStatus

local function _(OnAccepted, p1, p2, p3)
	return if p1 == nil or p2 == nil or p3 == nil then OnAccepted else function()
		-- upvalues: OnAccepted (copy), p1 (copy), p3 (copy), p2 (copy)
		if OnAccepted ~= nil then
			OnAccepted()
		end
		p1.upsertMomentComments(p3, p2)
	end
end

local function defaultFetchDeepLinkedMoments(p1, p2)
	-- upvalues: PromiseModule (copy), FetchMomentsByIdsModule (copy)
	return PromiseModule.resolve():andThen(function()
		-- upvalues: FetchMomentsByIdsModule (upval), p1 (copy), p2 (copy)
		return FetchMomentsByIdsModule({ p1 }, p2)
	end)
end

local _ = function(p1, List)
	if List == nil then
		return p1
	end
	local P6 = p1 or {}
	for i, value in List do
		P6[i] = value
	end
	return P6
end

local _ = function(p2, FeedItemId): boolean
	if p2.momentId == FeedItemId then
		return true
	else
		local RecommendationMetadata = p2.recommendationMetadata
		
		return RecommendationMetadata ~= nil and RecommendationMetadata.feedItemId == FeedItemId
	end
end

local _ = function(List, FeedItemId)
	for _, value in List do
		local IsFeedItemIdMatch = nil
		if value.momentId == FeedItemId then
			IsFeedItemIdMatch = true
		else
			local RecommendationMetadata = value.recommendationMetadata
			IsFeedItemIdMatch = RecommendationMetadata ~= nil and RecommendationMetadata.feedItemId == FeedItemId
		end
		if IsFeedItemIdMatch then
			return value
		end
	end
	return nil
end

local function makeUnavailableMomentItem(FeedItemId, Moments, Moments1)
	-- upvalues: MomentStatus (copy)
	local v1 = nil
	
	for _, moment in Moments do
		local IsFeedItemIdMatch = nil
		if moment.momentId == FeedItemId then
			IsFeedItemIdMatch = true
		else
			local RecommendationMetadata = moment.recommendationMetadata
			IsFeedItemIdMatch = RecommendationMetadata ~= nil and RecommendationMetadata.feedItemId == FeedItemId
		end
		if IsFeedItemIdMatch then
			v1 = moment
			break
		end
	end
	if not v1 then
		v1 = nil
		
		for _, value in Moments1 do
			local IsFeedItemIdMatch = nil
			if value.momentId == FeedItemId then
				IsFeedItemIdMatch = true
			else
				local RecommendationMetadata = value.recommendationMetadata
				IsFeedItemIdMatch = RecommendationMetadata ~= nil and RecommendationMetadata.feedItemId == FeedItemId
			end
			if IsFeedItemIdMatch then
				v1 = value
				break
			end
		end
	end
	return {
		kind = "unavailableMoment",
		targetId = FeedItemId,
		isModerated = v1 ~= nil and (v1.status ~= MomentStatus.Deleted and v1.isModerated == true)
	}
end

local function loadDeepLinkedMomentsForUnavailableDialog(Callback, DeepLinkedMomentId, DeepLinkedMomentTargetIdType, DeepLinkFetchTimeoutSeconds)
	-- upvalues: PromiseModule (copy)
	local v2, v3 = PromiseModule.race({
		Callback(DeepLinkedMomentId, DeepLinkedMomentTargetIdType):catch(function()
			return nil
		end),
		(PromiseModule.delay(DeepLinkFetchTimeoutSeconds):andThen(function()
			return nil
		end))
	}):await()
	
	return if v2 and type(v3) == "table" then v3 else nil
end

return function(Callback, p2)
	-- upvalues: MomentsGetMomentsTrendingStoreModule (copy), FFlagMomentsComments (copy), MomentsGetMomentsCommentsStoreModule (copy), GetDeepLinkStoreModule (copy), defaultFetchDeepLinkedMoments (copy), FFlagMomentsOptimisticProfilePending (copy), GetLocalUserIdModule (copy), CreatePendingFeedGetterModule (copy), MomentsGetMomentsUserStoreModule (copy), RecommendationSource (copy), GetReactionsStoreModule (copy), GetShareCountsStoreModule (copy), ShouldShowMomentInFeedModule (copy), loadDeepLinkedMomentsForUnavailableDialog (copy), FFlagMomentsModeratedMomentPageModule (copy), makeUnavailableMomentItem (copy), Analytics (copy), ReportUnavailableFeedItemModule (copy)
	local P18 = p2 or {}
	local MomentsGetMomentsTrendingStoreModuleResult = if P18.trendingStore == nil then MomentsGetMomentsTrendingStoreModule(false) else P18.trendingStore
	local CommentsStore = nil
	
	if FFlagMomentsComments then
		CommentsStore = P18.commentsStore
		
		if CommentsStore == nil and MomentsGetMomentsCommentsStoreModule ~= nil then
			CommentsStore = MomentsGetMomentsCommentsStoreModule(false)
		end
	end
	local DeepLinkStore = P18.deepLinkStore or GetDeepLinkStoreModule()
	local FetchDeepLinkedMoments = P18.fetchDeepLinkedMoments or defaultFetchDeepLinkedMoments
	local DeepLinkFetchTimeoutSeconds = P18.deepLinkFetchTimeoutSeconds or 20
	local NextCursor = nil
	local GetPendingItems = nil
	
	if FFlagMomentsOptimisticProfilePending then
		local LocalUserId = P18.localUserId or GetLocalUserIdModule()
		
		if LocalUserId ~= nil then
			GetPendingItems = CreatePendingFeedGetterModule(LocalUserId, P18.userStore or MomentsGetMomentsUserStoreModule(false))
		end
	end
	return {
		id = "trending",
		getPendingItems = GetPendingItems,
		recommendationSource = RecommendationSource.Trending,
		fetchAsync = function(p3)
			-- upvalues: CommentsStore (ref), NextCursor (ref), P18 (copy), MomentsGetMomentsTrendingStoreModuleResult (copy), Callback (copy), GetReactionsStoreModule (upval), GetShareCountsStoreModule (upval), DeepLinkStore (copy), ShouldShowMomentInFeedModule (upval), loadDeepLinkedMomentsForUnavailableDialog (upval), FetchDeepLinkedMoments (copy), DeepLinkFetchTimeoutSeconds (copy), FFlagMomentsModeratedMomentPageModule (upval), makeUnavailableMomentItem (upval), FFlagMomentsComments (upval), FFlagMomentsOptimisticProfilePending (upval), Analytics (upval), RecommendationSource (upval), ReportUnavailableFeedItemModule (upval)
			local OwnerGeneration = if CommentsStore == nil then nil else CommentsStore.getOwnerGeneration(false)
			local SignalTracker = P18.signalTracker
			local v2, v3 = MomentsGetMomentsTrendingStoreModuleResult.getTrending(Callback(false), p3 or NextCursor, if SignalTracker then SignalTracker:getSignalsPayload() else nil):await()
			
			if not v2 then
				error(v3)
			end
			local CommentsByFeedItemId = v3.commentsByFeedItemId
			local v4 = nil
			
			if CommentsByFeedItemId == nil then
				v4 = nil
			else
				local t = {}
				
				for i, value in CommentsByFeedItemId do
					t[i] = value
				end
				v4 = t
			end
			NextCursor = v3.nextCursor or NextCursor
			
			if p3 == nil then
				GetReactionsStoreModule(false).clear()
				GetShareCountsStoreModule(false).clear()
			end
			GetReactionsStoreModule(false).setBatchReactionCounts(v3.reactionsByMomentId or {})
			GetShareCountsStoreModule(false).setBatchShareCounts(v3.shareInfoByMomentId or {})
			local List = {}
			local Callback1: (() -> ())? = nil
			local MomentId = nil
			local MomentId1 = nil
			
			if p3 == nil then
				local DeepLinkedMomentId = DeepLinkStore.getDeepLinkedMomentId(false)
				local DeepLinkedMomentTargetIdType = DeepLinkStore.getDeepLinkedMomentTargetIdType(false)
				
				if DeepLinkedMomentId ~= nil then
					local t = {}
					local Moment = nil
					
					for _, moment in v3.moments do
						t[moment.momentId] = true
						
						if Moment == nil then
							local IsFeedItemIdMatch = nil
							if moment.momentId == DeepLinkedMomentId then
								IsFeedItemIdMatch = true
							else
								local RecommendationMetadata = moment.recommendationMetadata
								IsFeedItemIdMatch = RecommendationMetadata ~= nil and RecommendationMetadata.feedItemId == DeepLinkedMomentId
							end
							if IsFeedItemIdMatch then
								Moment = moment
							end
						end
					end
					local Flag = false
					local Inverted = false
					
					if Moment ~= nil and ShouldShowMomentInFeedModule(Moment) then
						table.insert(List, { kind = "moment", moment = Moment })
						MomentId = Moment.momentId
						Flag = true
					else
						local DeepLinkedMomentsForUnavailableDialog = loadDeepLinkedMomentsForUnavailableDialog(FetchDeepLinkedMoments, DeepLinkedMomentId, DeepLinkedMomentTargetIdType, DeepLinkFetchTimeoutSeconds)
						
						if DeepLinkedMomentsForUnavailableDialog ~= nil then
							local v5 = v4
							local CommentsByFeedItemId1 = DeepLinkedMomentsForUnavailableDialog.commentsByFeedItemId
							
							if CommentsByFeedItemId1 == nil then
								v4 = v5
							else
								local V75 = v5 or {}
								for i1, value1 in CommentsByFeedItemId1 do
									V75[i1] = value1
								end
								v4 = V75
							end
							if DeepLinkedMomentsForUnavailableDialog.reactionsByMomentId then
								GetReactionsStoreModule(false).setBatchReactionCounts(DeepLinkedMomentsForUnavailableDialog.reactionsByMomentId)
							end
							if DeepLinkedMomentsForUnavailableDialog.shareInfoByMomentId then
								GetShareCountsStoreModule(false).setBatchShareCounts(DeepLinkedMomentsForUnavailableDialog.shareInfoByMomentId)
							end
							for _, moment2 in DeepLinkedMomentsForUnavailableDialog.moments do
								local IsFeedItemIdMatch = nil
								if moment2.momentId == DeepLinkedMomentId then
									IsFeedItemIdMatch = true
								else
									local RecommendationMetadata = moment2.recommendationMetadata
									IsFeedItemIdMatch = RecommendationMetadata ~= nil and RecommendationMetadata.feedItemId == DeepLinkedMomentId
								end
								if ShouldShowMomentInFeedModule(moment2) and IsFeedItemIdMatch then
									table.insert(List, { kind = "moment", moment = moment2 })
									Flag = true
								end
							end
							Inverted = not Flag
							
							if FFlagMomentsModeratedMomentPageModule and Inverted then
								table.insert(List, (makeUnavailableMomentItem(DeepLinkedMomentId, DeepLinkedMomentsForUnavailableDialog.moments, v3.moments)))
							end
						end
					end
					if Flag or Inverted then
						local NoFFlagMomentsModeratedMomentPageModule: boolean = Inverted and not FFlagMomentsModeratedMomentPageModule
						
						Callback1 = function()
							-- upvalues: DeepLinkStore (upval), DeepLinkedMomentId (copy), NoFFlagMomentsModeratedMomentPageModule (copy), P18 (upval)
							if DeepLinkStore.getDeepLinkedMomentId(false) == DeepLinkedMomentId then
								DeepLinkStore.setDeepLinkedMomentId(nil)
								
								if NoFFlagMomentsModeratedMomentPageModule and P18.onDeepLinkedMomentUnavailable ~= nil then
									P18.onDeepLinkedMomentUnavailable()
								end
							end
						end
					end
				end
			end
			if FFlagMomentsComments then
				local CommentsStore1 = CommentsStore
				Callback1 = if CommentsStore1 == nil or OwnerGeneration == nil or v4 == nil then Callback1 else function()
					-- upvalues: Callback1 (copy), CommentsStore1 (copy), v4 (copy), OwnerGeneration (copy)
					if Callback1 ~= nil then
						Callback1()
					end
					CommentsStore1.upsertMomentComments(v4, OwnerGeneration)
				end
			end
			local Entry = List[1]
			
			if FFlagMomentsOptimisticProfilePending and p3 == nil and Entry ~= nil then
				if Entry.kind == "moment" then
					MomentId1 = Entry.moment.momentId
				elseif Entry.kind == "unavailableMoment" then
					MomentId1 = Entry.targetId
				end
			end
			for _, moment1 in v3.moments do
				Analytics.reportMomentsFeedItemsReceived(RecommendationSource.Trending)
				
				if MomentId == nil or moment1.momentId ~= MomentId then
					if ShouldShowMomentInFeedModule(moment1) then
						table.insert(List, { kind = "moment", moment = moment1 })
					else
						ReportUnavailableFeedItemModule(moment1, RecommendationSource.Trending)
					end
				end
			end
			return {
				items = List,
				initialMomentId = MomentId1,
				nextCursor = v3.nextCursor,
				onAccepted = Callback1
			}
		end
	}
end