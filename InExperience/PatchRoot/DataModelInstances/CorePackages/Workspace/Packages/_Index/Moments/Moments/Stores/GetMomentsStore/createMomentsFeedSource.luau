local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.Signals)
local PromiseModule = require(Parent.Promise)
local MomentsCommonModule = require(Parent.MomentsCommon)
local SharedFlagsModule = require(Parent.SharedFlags)
local _ = require(Moments.Components.Feed)
local Analytics = MomentsCommonModule.Analytics
local RecommendationSource = MomentsCommonModule.Analytics.RecommendationSource
local FFlagMomentsContentStatsTelemetry = MomentsCommonModule.Flags.FFlagMomentsContentStatsTelemetry
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
local GetFFlagMomentsShareDeeplinkReliableOpenModule = require(Moments.Flags.GetFFlagMomentsShareDeeplinkReliableOpen)
local FFlagMomentsOptimisticProfilePending = SharedFlagsModule.FFlagMomentsOptimisticProfilePending
local FFlagMomentsModeratedMomentPageModule = require(Moments.Flags.FFlagMomentsModeratedMomentPage)
local FFlagMomentsPassFeedItemIdToBackendApis = SharedFlagsModule.FFlagMomentsPassFeedItemIdToBackendApis
local FFlagMomentsComments = SharedFlagsModule.FFlagMomentsComments
local MomentsGetMomentsCommentsStoreModule = if FFlagMomentsComments then require(Parent.DataHydration.MomentsGetMomentsCommentsStore) else nil
local MomentStatus = require(Parent.MomentsTypes).Enums.MomentStatus

local function _(OnAccepted, p1, p2, p3) --[[ Line: 55 | Named "withCommentsSeeding" ]]
	return if p1 == nil or p2 == nil or p3 == nil then OnAccepted else function() --[[ Line: 67 ]]
		-- upvalues: OnAccepted (copy), p1 (copy), p3 (copy), p2 (copy)
		if OnAccepted ~= nil then
			OnAccepted()
		end
		p1.upsertMomentComments(p3, p2)
	end
end

local function defaultFetchDeepLinkedMoments(p1, p2) --[[ Line: 96 ]]
	-- upvalues: PromiseModule (copy), FFlagMomentsPassFeedItemIdToBackendApis (copy), FetchMomentsByIdsModule (copy)
	return PromiseModule.resolve():andThen(function() --[[ Line: 97 ]]
		-- upvalues: FFlagMomentsPassFeedItemIdToBackendApis (upval), FetchMomentsByIdsModule (upval), p1 (copy), p2 (copy)
		return if FFlagMomentsPassFeedItemIdToBackendApis then FetchMomentsByIdsModule({ p1 }, p2) else FetchMomentsByIdsModule({ p1 })
	end)
end

local _ = function(p1, List) --[[ Line: 111 | Named "mergeCommentsByFeedItemId" ]]
	if List == nil then
		return p1
	end
	local P6 = p1 or {}
	for i, value in List do
		P6[i] = value
	end
	return P6
end

local _ = function(p2, FeedItemId): boolean --[[ Line: 125 | Named "hasDeepLinkIdentity" ]]
	if p2.momentId == FeedItemId then
		return true
	else
		local RecommendationMetadata = p2.recommendationMetadata
		
		return RecommendationMetadata ~= nil and RecommendationMetadata.feedItemId == FeedItemId
	end
end

local _ = function(List, FeedItemId) --[[ Line: 133 | Named "findDeepLinkTarget" ]]
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

local function makeUnavailableMomentItem(TargetId, Moments, Moments1) --[[ Line: 144 ]]
	-- upvalues: MomentStatus (copy)
	local v1 = nil
	
	for _, moment in Moments do
		local IsFeedItemIdMatch = nil
		if moment.momentId == TargetId then
			IsFeedItemIdMatch = true
		else
			local RecommendationMetadata = moment.recommendationMetadata
			IsFeedItemIdMatch = RecommendationMetadata ~= nil and RecommendationMetadata.feedItemId == TargetId
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
			if value.momentId == TargetId then
				IsFeedItemIdMatch = true
			else
				local RecommendationMetadata = value.recommendationMetadata
				IsFeedItemIdMatch = RecommendationMetadata ~= nil and RecommendationMetadata.feedItemId == TargetId
			end
			if IsFeedItemIdMatch then
				v1 = value
				break
			end
		end
	end
	return {
		kind = "unavailableMoment",
		targetId = TargetId,
		isModerated = v1 ~= nil and (v1.status ~= MomentStatus.Deleted and v1.isModerated == true)
	}
end

local function loadDeepLinkedMomentsForUnavailableDialog(Callback, DeepLinkedMomentId, DeepLinkedMomentTargetIdType, DeepLinkFetchTimeoutSeconds) --[[ Line: 156 ]]
	-- upvalues: FFlagMomentsPassFeedItemIdToBackendApis (copy), PromiseModule (copy)
	local v2, v3 = PromiseModule.race({
		(if FFlagMomentsPassFeedItemIdToBackendApis then Callback(DeepLinkedMomentId, DeepLinkedMomentTargetIdType) else Callback(DeepLinkedMomentId)):catch(function() --[[ Line: 165 ]]
			return nil
		end),
		(PromiseModule.delay(DeepLinkFetchTimeoutSeconds):andThen(function() --[[ Line: 168 ]]
			return nil
		end))
	}):await()
	
	return if v2 and type(v3) == "table" then v3 else nil
end

return function(Callback, p2) --[[ Line: 179 | Named "createMomentsFeedSource" ]]
	-- upvalues: MomentsGetMomentsTrendingStoreModule (copy), FFlagMomentsComments (copy), MomentsGetMomentsCommentsStoreModule (copy), GetDeepLinkStoreModule (copy), defaultFetchDeepLinkedMoments (copy), FFlagMomentsOptimisticProfilePending (copy), GetLocalUserIdModule (copy), CreatePendingFeedGetterModule (copy), MomentsGetMomentsUserStoreModule (copy), RecommendationSource (copy), GetReactionsStoreModule (copy), GetShareCountsStoreModule (copy), GetFFlagMomentsShareDeeplinkReliableOpenModule (copy), FFlagMomentsPassFeedItemIdToBackendApis (copy), ShouldShowMomentInFeedModule (copy), loadDeepLinkedMomentsForUnavailableDialog (copy), FFlagMomentsModeratedMomentPageModule (copy), makeUnavailableMomentItem (copy), FFlagMomentsContentStatsTelemetry (copy), Analytics (copy), ReportUnavailableFeedItemModule (copy)
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
		fetchAsync = function(p3) --[[ Line: 212 ]]
			-- upvalues: CommentsStore (ref), NextCursor (ref), P18 (copy), MomentsGetMomentsTrendingStoreModuleResult (copy), Callback (copy), GetReactionsStoreModule (upval), GetShareCountsStoreModule (upval), GetFFlagMomentsShareDeeplinkReliableOpenModule (upval), DeepLinkStore (copy), FFlagMomentsPassFeedItemIdToBackendApis (upval), ShouldShowMomentInFeedModule (upval), loadDeepLinkedMomentsForUnavailableDialog (upval), FetchDeepLinkedMoments (copy), DeepLinkFetchTimeoutSeconds (copy), FFlagMomentsModeratedMomentPageModule (upval), makeUnavailableMomentItem (upval), FFlagMomentsComments (upval), FFlagMomentsOptimisticProfilePending (upval), FFlagMomentsContentStatsTelemetry (upval), Analytics (upval), RecommendationSource (upval), ReportUnavailableFeedItemModule (upval)
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
				if GetFFlagMomentsShareDeeplinkReliableOpenModule() then
					local DeepLinkedMomentId = DeepLinkStore.getDeepLinkedMomentId(false)
					local DeepLinkedMomentTargetIdType = if FFlagMomentsPassFeedItemIdToBackendApis then DeepLinkStore.getDeepLinkedMomentTargetIdType(false) else nil
					
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
						local v5 = false
						
						if Moment ~= nil and ShouldShowMomentInFeedModule(Moment) then
							table.insert(List, { kind = "moment", moment = Moment })
							MomentId = Moment.momentId
							Flag = true
						else
							local DeepLinkedMomentsForUnavailableDialog = loadDeepLinkedMomentsForUnavailableDialog(FetchDeepLinkedMoments, DeepLinkedMomentId, DeepLinkedMomentTargetIdType, DeepLinkFetchTimeoutSeconds)
							
							if DeepLinkedMomentsForUnavailableDialog ~= nil then
								local v6 = v4
								local CommentsByFeedItemId1 = DeepLinkedMomentsForUnavailableDialog.commentsByFeedItemId
								
								if CommentsByFeedItemId1 == nil then
									v4 = v6
								else
									local V77 = v6 or {}
									for i1, value1 in CommentsByFeedItemId1 do
										V77[i1] = value1
									end
									v4 = V77
								end
								if DeepLinkedMomentsForUnavailableDialog.reactionsByMomentId then
									GetReactionsStoreModule(false).setBatchReactionCounts(DeepLinkedMomentsForUnavailableDialog.reactionsByMomentId)
								end
								if DeepLinkedMomentsForUnavailableDialog.shareInfoByMomentId then
									GetShareCountsStoreModule(false).setBatchShareCounts(DeepLinkedMomentsForUnavailableDialog.shareInfoByMomentId)
								end
								for _, moment1 in DeepLinkedMomentsForUnavailableDialog.moments do
									local IsFeedItemIdMatch = nil
									if moment1.momentId == DeepLinkedMomentId then
										IsFeedItemIdMatch = true
									else
										local RecommendationMetadata = moment1.recommendationMetadata
										IsFeedItemIdMatch = RecommendationMetadata ~= nil and RecommendationMetadata.feedItemId == DeepLinkedMomentId
									end
									if ShouldShowMomentInFeedModule(moment1) and IsFeedItemIdMatch then
										table.insert(List, { kind = "moment", moment = moment1 })
										Flag = true
									end
								end
								v5 = not Flag
								
								if FFlagMomentsModeratedMomentPageModule and v5 then
									table.insert(List, (makeUnavailableMomentItem(DeepLinkedMomentId, DeepLinkedMomentsForUnavailableDialog.moments, v3.moments)))
								end
							end
						end
						if Flag or v5 then
							local NoFFlagMomentsModeratedMomentPageModule: boolean = v5 and not FFlagMomentsModeratedMomentPageModule
							
							Callback1 = function() --[[ Line: 326 ]]
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
				else
					local ConsumeDeepLinkedMomentResult = if FFlagMomentsPassFeedItemIdToBackendApis then DeepLinkStore.consumeDeepLinkedMoment() else nil
					
					if not FFlagMomentsPassFeedItemIdToBackendApis then
						local ConsumeDeepLinkedMomentIdResult = DeepLinkStore.consumeDeepLinkedMomentId()
						
						if ConsumeDeepLinkedMomentIdResult ~= nil then
							ConsumeDeepLinkedMomentResult = {
								targetIdType = nil,
								targetId = ConsumeDeepLinkedMomentIdResult
							}
						end
					end
					if ConsumeDeepLinkedMomentResult ~= nil then
						local TargetId = ConsumeDeepLinkedMomentResult.targetId
						local TargetIdType = ConsumeDeepLinkedMomentResult.targetIdType
						local t = {}
						local Flag = false
						
						for _, moment2 in v3.moments do
							t[moment2.momentId] = true
							local IsFeedItemIdMatch = nil
							
							if moment2.momentId == TargetId then
								IsFeedItemIdMatch = true
							else
								local RecommendationMetadata = moment2.recommendationMetadata
								IsFeedItemIdMatch = RecommendationMetadata ~= nil and RecommendationMetadata.feedItemId == TargetId
							end
							if IsFeedItemIdMatch and ShouldShowMomentInFeedModule(moment2) then
								Flag = true
							end
						end
						local DeepLinkedMomentsForUnavailableDialog = loadDeepLinkedMomentsForUnavailableDialog(FetchDeepLinkedMoments, TargetId, TargetIdType, DeepLinkFetchTimeoutSeconds)
						
						if DeepLinkedMomentsForUnavailableDialog ~= nil then
							local v7 = v4
							local CommentsByFeedItemId2 = DeepLinkedMomentsForUnavailableDialog.commentsByFeedItemId
							
							if CommentsByFeedItemId2 == nil then
								v4 = v7
							else
								local V91 = v7 or {}
								for i2, value2 in CommentsByFeedItemId2 do
									V91[i2] = value2
								end
								v4 = V91
							end
							if DeepLinkedMomentsForUnavailableDialog.reactionsByMomentId then
								GetReactionsStoreModule(false).setBatchReactionCounts(DeepLinkedMomentsForUnavailableDialog.reactionsByMomentId)
							end
							if DeepLinkedMomentsForUnavailableDialog.shareInfoByMomentId then
								GetShareCountsStoreModule(false).setBatchShareCounts(DeepLinkedMomentsForUnavailableDialog.shareInfoByMomentId)
							end
							for _, moment3 in DeepLinkedMomentsForUnavailableDialog.moments do
								local ShouldShowMomentInFeedModule1 = ShouldShowMomentInFeedModule(moment3)
								local IsFeedItemIdMatch = nil
								
								if moment3.momentId == TargetId then
									IsFeedItemIdMatch = true
								else
									local RecommendationMetadata = moment3.recommendationMetadata
									IsFeedItemIdMatch = RecommendationMetadata ~= nil and RecommendationMetadata.feedItemId == TargetId
								end
								if IsFeedItemIdMatch and ShouldShowMomentInFeedModule1 then
									Flag = true
								end
								if ShouldShowMomentInFeedModule1 and IsFeedItemIdMatch and not t[moment3.momentId] then
									table.insert(List, { kind = "moment", moment = moment3 })
								end
							end
							if FFlagMomentsModeratedMomentPageModule then
								if not Flag then
									table.insert(List, 1, (makeUnavailableMomentItem(TargetId, DeepLinkedMomentsForUnavailableDialog.moments, v3.moments)))
								end
							elseif not Flag and P18.onDeepLinkedMomentUnavailable ~= nil then
								P18.onDeepLinkedMomentUnavailable()
							end
						end
					end
				end
			end
			if FFlagMomentsComments then
				local CommentsStore1 = CommentsStore
				Callback1 = if CommentsStore1 == nil or OwnerGeneration == nil or v4 == nil then Callback1 else function() --[[ Line: 67 ]]
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
			for _, moment4 in v3.moments do
				if FFlagMomentsContentStatsTelemetry then
					Analytics.reportMomentsFeedItemsReceived(RecommendationSource.Trending)
				end
				if not GetFFlagMomentsShareDeeplinkReliableOpenModule() or (MomentId == nil or moment4.momentId ~= MomentId) then
					if ShouldShowMomentInFeedModule(moment4) then
						table.insert(List, { kind = "moment", moment = moment4 })
					elseif FFlagMomentsContentStatsTelemetry then
						ReportUnavailableFeedItemModule(moment4, RecommendationSource.Trending)
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