local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.HttpClient)
local EventNames = require(Parent.MomentsCommon).Analytics.EventNames
local _ = require(Moments.Components.Comments.createCommentsAnalyticsSession)
local GetCommentsFailureReasonModule = require(Moments.Analytics.getCommentsFailureReason)
local MomentsCommentsModule = require(Parent.DataHydration.MomentsComments)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local _ = require(Parent.MomentsTypes)
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local _ = require(Moments.Components.Comments.GetCommentCollectionStore.createCommentCollectionStore)
local _ = require(Moments.Components.Comments.GetCommentSessionFiltersStore.createCommentSessionFiltersStore)
local FFlagMomentsComments = require(Parent.SharedFlags).FFlagMomentsComments
local FFlagMomentsCommentActionsRealtimeModule = require(Moments.Flags.FFlagMomentsCommentActionsRealtime)
local FFlagMomentsCommentsCountAnalyticsModule = require(Moments.Flags.FFlagMomentsCommentsCountAnalytics)
local _ = require(Moments.Stores.GetCommentReactionsStore.createCommentReactionsStore)
local LoadStatus = require(Moments.Components.Comments.GetCommentCollectionStore.CommentCollectionTypes).LoadStatus
local list = { 250, 500 }
local config = {
	AuthenticationRequired = true,
	CommentsEndpointDisabled = true,
	ViewerNotEligibleToReact = true
}
local config1 = {
	CommentsDisabledByCreator = true,
	MomentUnavailable = true,
	ViewerNotEligibleToRead = true
}
local config2 = {
	CommentsDisabledByCreator = true,
	MomentNotFound = true,
	MomentNotVisible = true,
	ViewerNotEligibleToRead = true,
	ViewerNotEligibleToWrite = true
}
local config3 = {
	Jan = 1,
	Feb = 2,
	Mar = 3,
	Apr = 4,
	May = 5,
	Jun = 6,
	Jul = 7,
	Aug = 8,
	Sep = 9,
	Oct = 10,
	Nov = 11,
	Dec = 12
}

local function _(p1) --[[ Line: 217 | Named "cursorKey" ]]
	return p1 or "<initial>"
end

local function defaultSchedule(p1: number, p2) --[[ Line: 221 ]]
	local DelayedThread = task.delay(p1 / 1000, p2)
	
	return function() --[[ Line: 223 ]]
		-- upvalues: DelayedThread (copy)
		pcall(task.cancel, DelayedThread)
	end
end

local function defaultReadStatusCode(p1, p2) --[[ Line: 228 ]]
	return if p2 == nil then if p1.response == nil then p1.errorCode else p1.response.statusCode else p2
end

local function defaultReadRetryAfter(p1) --[[ Line: 238 ]]
	return if p1.headers == nil then nil else p1.headers["retry-after"] or p1.headers["Retry-After"]
end

local function parseHttpDateMs(Text: string) --[[ Line: 245 ]]
	-- upvalues: config3 (copy)
	local Match, Match2, Match3, Match4, Match5, Match6 = string.match(Text, "^%a%a%a, (%d%d) (%a%a%a) (%d%d%d%d) (%d%d):(%d%d):(%d%d) GMT$")
	local Entry = if Match2 == nil then nil else config3[Match2]
	
	if Match == nil or Entry == nil or Match3 == nil or Match4 == nil or Match5 == nil or Match6 == nil then
		return nil
	else
		local Success, Result = pcall(DateTime.fromUniversalTime, tonumber(Match3), Entry, tonumber(Match), tonumber(Match4), tonumber(Match5), (tonumber(Match6)))
		
		return if Success then Result.UnixTimestampMillis else nil
	end
end

local _ = function(p1, p2) --[[ Line: 264 | Named "retryAfterDelayMs" ]]
	-- upvalues: parseHttpDateMs (copy)
	if p1 == nil then
		return 5000
	end
	local Number: number? = tonumber(p1)
	local ScaledNumber = if Number == nil then nil else Number * 1000
	
	if ScaledNumber == nil then
		local ParseHttpDateMsResult = parseHttpDateMs(p1)
		ScaledNumber = if ParseHttpDateMsResult == nil then nil else math.max(0, ParseHttpDateMsResult - p2)
	end
	return if ScaledNumber == nil or ScaledNumber < 0 or ScaledNumber > 60000 then 5000 else ScaledNumber
end

local _ = function(p1: number, p2) --[[ Line: 286 | Named "definitePostRejectionCode" ]]
	return if p2 == "CommentsUnavailable" then nil elseif p2 == nil then if p1 == nil or p1 == 408 or p1 < 400 or p1 >= 500 then nil elseif p1 == 429 then "RateLimited" elseif p1 == 401 then "AuthenticationRequired" else "PostRejected" else p2
end

local _ = function(p1) --[[ Line: 305 | Named "selectedEmoteId" ]]
	return if p1 == nil or p1.userReaction == nil then nil else p1.userReaction.emoteId
end

local _ = function(p1: number): boolean --[[ Line: 309 | Named "isUncertainStatus" ]]
	return p1 == nil or (p1 == 408 or p1 ~= nil and (p1 >= 500 and p1 <= 599))
end

local _ = function(p1) --[[ Line: 313 | Named "errorCodeFrom" ]]
	-- upvalues: MomentsCommentsModule (copy)
	local ParseCommentsErrorResult = MomentsCommentsModule.parseCommentsError(p1.error)
	
	return if ParseCommentsErrorResult == nil then "CommentsUnavailable" else ParseCommentsErrorResult.errorCode
end

local function observeRequest(p1, Callback1: (any) -> ()) --[[ Line: 318 ]]
	-- upvalues: SignalsModule (copy)
	local Flag = false
	local Callback: () -> () = nil
	
	local function stop() --[[ Line: 322 ]]
		-- upvalues: Flag (ref), Callback (ref), p1 (copy)
		if Flag then return end
		Flag = true
		
		if Callback ~= nil then
			Callback()
			Callback = nil
		end
		p1.dispose()
	end
	
	local function _(p2) --[[ Line: 334 | Named "settle" ]]
		-- upvalues: Flag (ref), Callback (ref), p1 (copy), Callback1 (copy)
		if Flag or p2.status == "pending" then return end
		Flag = true
		
		if Callback ~= nil then
			Callback()
			Callback = nil
		end
		p1.dispose()
		Callback1(p2)
	end
	
	local StateResult = p1.state(false)
	
	if StateResult.status == "pending" then
		Callback = SignalsModule.createEffect(function(p2) --[[ Line: 353 ]]
			-- upvalues: p1 (copy), Flag (ref), Callback (ref), Callback1 (copy)
			local StateResult = p1.state(p2)
			
			if not Flag then
				if StateResult.status == "pending" then return end
				Flag = true
				
				if Callback ~= nil then
					Callback()
					Callback = nil
				end
				p1.dispose()
				Callback1(StateResult)
			end
		end)
		
		if Flag and Callback ~= nil then
			Callback()
			Callback = nil
		end
		return stop
	else
		if not Flag and StateResult.status ~= "pending" then
			Flag = true
			
			if Callback ~= nil then
				Callback()
				Callback = nil
			end
			p1.dispose()
			Callback1(StateResult)
		end
		return stop
	end
end

local function rejectReactionMutation(_, _, _, _): boolean --[[ Line: 364 ]]
	return false
end

local function noOp() --[[ Line: 373 ]] end

return function(p1) --[[ Line: 377 | Named "createCommentsListCoordinator" ]]
	-- upvalues: MomentsCommentsModule (copy), defaultSchedule (copy), defaultReadStatusCode (copy), defaultReadRetryAfter (copy), SignalsModule (copy), parseHttpDateMs (copy), LoadStatus (copy), SignalsExperimentalModule (copy), config (copy), config2 (copy), FFlagMomentsCommentActionsRealtimeModule (copy), observeRequest (copy), GetCommentsFailureReasonModule (copy), list (copy), FFlagMomentsComments (copy), EventNames (copy), FFlagMomentsCommentsCountAnalyticsModule (copy), config1 (copy), rejectReactionMutation (copy), noOp (copy)
	local CollectionStore = p1.collectionStore
	local CommentsStore = p1.commentsStore
	local ReactionStore = p1.reactionStore
	local CatalogStore = p1.catalogStore
	local FetchPage = p1.fetchPage or MomentsCommentsModule.fetchMomentComments
	local PostComment = p1.postComment or MomentsCommentsModule.postMomentComment
	local PutReaction = p1.putReaction or MomentsCommentsModule.putMomentCommentReaction
	local DeleteReaction = p1.deleteReaction or MomentsCommentsModule.deleteMomentCommentReaction
	local DeleteComment = p1.deleteComment or MomentsCommentsModule.deleteMomentComment
	local SessionFilters = p1.sessionFilters
	local NowMs = p1.nowMs or function() --[[ Line: 389 ]]
		return DateTime.now().UnixTimestampMillis
	end
	local Schedule = p1.schedule or defaultSchedule
	local ReadStatusCode = p1.readStatusCode or defaultReadStatusCode
	local ReadRetryAfter = p1.readRetryAfter or defaultReadRetryAfter
	local ReactionDebounceMs = p1.reactionDebounceMs or 500
	local v1 = nil
	local v2 = nil
	local t = {}
	local T = {}
	local t1 = {}
	local FeedItemIds = {}
	local Callback: (() -> ())? = nil
	local Signal, Signal2 = SignalsModule.createSignal(0)
	local Callback1: (() -> ())? = nil
	local OwnerGeneration = CommentsStore.getOwnerGeneration(false)
	local Flag = false
	local CommentPostedCallback = nil
	local AnalyticsSession = nil
	
	local function _(p2) --[[ Line: 410 | Named "cancelActivePage" ]]
		local ActivePageRequest = p2.activePageRequest
		p2.activePageRequest = nil
		
		if ActivePageRequest ~= nil then
			ActivePageRequest.cancel()
		end
	end
	
	local _ = function(FeedItemId, SessionId) --[[ Line: 418 | Named "getSession" ]]
		-- upvalues: v1 (ref), Flag (ref), CommentsStore (copy)
		local v3 = v1
		
		return if Flag or v3 == nil or v3.feedItemId ~= FeedItemId or v3.sessionId ~= SessionId or v3.ownerGeneration ~= CommentsStore.getOwnerGeneration(false) or v3.refCount == 0 then nil else v3
	end
	
	local _ = function(p2, FeedItemId, SessionId, OwnerGeneration): boolean --[[ Line: 433 | Named "isCurrentRequestSession" ]]
		-- upvalues: Flag (ref), v1 (ref), CommentsStore (copy)
		return not Flag and (v1 == p2 and (p2.feedItemId == FeedItemId and (p2.sessionId == SessionId and p2.ownerGeneration == OwnerGeneration)) and CommentsStore.getOwnerGeneration(false) == OwnerGeneration)
	end
	
	local _ = function(Key) --[[ Line: 447 | Named "cancelIntentExpiry" ]]
		-- upvalues: t1 (copy)
		local Entry: () -> () = t1[Key]
		t1[Key] = nil
		
		if Entry ~= nil then
			Entry()
		end
	end
	
	local _ = function(Key, p2) --[[ Line: 455 | Named "scheduleIntentExpiry" ]]
		-- upvalues: t1 (copy), Schedule (copy), ReactionStore (copy), FeedItemIds (copy)
		local Entry: () -> () = t1[Key]
		t1[Key] = nil
		
		if Entry ~= nil then
			Entry()
		end
		t1[Key] = Schedule(10000, function() --[[ Line: 457 ]]
			-- upvalues: t1 (upval), Key (copy), ReactionStore (upval), p2 (copy), FeedItemIds (upval)
			t1[Key] = nil
			
			if ReactionStore.expireIntent(Key, p2) then
				FeedItemIds[Key] = nil
			end
		end)
	end
	
	local function cancelReactionRequest(CommentId) --[[ Line: 465 ]]
		-- upvalues: t (copy)
		local Entry = t[CommentId]
		t[CommentId] = nil
		
		if Entry == nil then return end
		if Entry.cancelRequest ~= nil then
			Entry.cancelRequest()
			Entry.cancelRequest = nil
		end
		if Entry.cancelRetry ~= nil then
			Entry.cancelRetry()
			Entry.cancelRetry = nil
		end
		if Entry.cancelDebounce ~= nil then
			Entry.cancelDebounce()
			Entry.cancelDebounce = nil
		end
	end
	
	local _ = function(p2, Key, p3, p4) --[[ Line: 485 | Named "hardResetReaction" ]]
		-- upvalues: cancelReactionRequest (copy), t1 (copy), FeedItemIds (copy), ReactionStore (copy)
		cancelReactionRequest(Key)
		local Entry: () -> () = t1[Key]
		t1[Key] = nil
		
		if Entry ~= nil then
			Entry()
		end
		FeedItemIds[Key] = nil
		ReactionStore.clearComment(Key)
		
		if p3 ~= nil then
			ReactionStore.setCommentRestriction(p2, Key, p3, p4)
		end
	end
	
	local function clearReactionState() --[[ Line: 495 ]]
		-- upvalues: t (copy), cancelReactionRequest (copy), t1 (copy), Callback (ref), FeedItemIds (copy), ReactionStore (copy)
		local List = {}
		
		for i in t do
			table.insert(List, i)
		end
		for _, value in List do
			cancelReactionRequest(value)
		end
		local List1 = {}
		
		for i1 in t1 do
			table.insert(List1, i1)
		end
		for _, value1 in List1 do
			local Entry: () -> () = t1[value1]
			t1[value1] = nil
			
			if Entry ~= nil then
				Entry()
			end
		end
		if Callback ~= nil then
			Callback()
			Callback = nil
		end
		table.clear(FeedItemIds)
		ReactionStore.clear()
	end
	
	local function clearReactionsForFeed(FeedItemId, CommentsUnavailable) --[[ Line: 518 ]]
		-- upvalues: FeedItemIds (copy), cancelReactionRequest (copy), t1 (copy), ReactionStore (copy)
		local List = {}
		
		for i, feedItemId in FeedItemIds do
			if feedItemId == FeedItemId then
				table.insert(List, i)
			end
		end
		for _, value in List do
			cancelReactionRequest(value)
			local Entry: () -> () = t1[value]
			t1[value] = nil
			
			if Entry ~= nil then
				Entry()
			end
			FeedItemIds[value] = nil
		end
		ReactionStore.clearFeed(FeedItemId)
		ReactionStore.setFeedRestriction(FeedItemId, CommentsUnavailable)
	end
	
	local function setReactionCooldown(p2) --[[ Line: 534 ]]
		-- upvalues: NowMs (copy), ReactionStore (copy), parseHttpDateMs (upval), Callback (ref), Schedule (copy)
		local NowMsResult: number = NowMs()
		local CooldownUntilMs: number = ReactionStore.getCooldownUntilMs(false)
		local v3 = nil
		
		if p2 == nil then
			v3 = 5000
		else
			local Number: number? = tonumber(p2)
			local ScaledNumber = if Number == nil then nil else Number * 1000
			
			if ScaledNumber == nil then
				local ParseHttpDateMsResult: number = parseHttpDateMs(p2)
				ScaledNumber = if ParseHttpDateMsResult == nil then nil else math.max(0, ParseHttpDateMsResult - NowMsResult)
			end
			v3 = if ScaledNumber == nil or ScaledNumber < 0 or ScaledNumber > 60000 then 5000 else ScaledNumber
		end
		local Largest = math.max(CooldownUntilMs, NowMsResult + v3)
		ReactionStore.setCooldownUntilMs(Largest)
		
		if Callback ~= nil then
			Callback()
		end
		Callback = Schedule(math.max(0, Largest - NowMsResult), function() --[[ Line: 544 ]]
			-- upvalues: Callback (upval), ReactionStore (upval), Largest (copy)
			Callback = nil
			
			if ReactionStore.getCooldownUntilMs(false) == Largest then
				ReactionStore.setCooldownUntilMs(0)
			end
		end)
	end
	
	local _ = function() --[[ Line: 552 | Named "clearPostCooldown" ]]
		-- upvalues: Callback1 (ref), Signal2 (copy)
		if Callback1 ~= nil then
			Callback1()
			Callback1 = nil
		end
		Signal2(0)
	end
	
	local function setPostCooldown(p2) --[[ Line: 560 ]]
		-- upvalues: NowMs (copy), Signal (copy), parseHttpDateMs (upval), Signal2 (copy), Callback1 (ref), Schedule (copy)
		local NowMsResult: number = NowMs()
		local SignalResult: number = Signal(false)
		local v3 = nil
		
		if p2 == nil then
			v3 = 5000
		else
			local Number: number? = tonumber(p2)
			local ScaledNumber = if Number == nil then nil else Number * 1000
			
			if ScaledNumber == nil then
				local ParseHttpDateMsResult: number = parseHttpDateMs(p2)
				ScaledNumber = if ParseHttpDateMsResult == nil then nil else math.max(0, ParseHttpDateMsResult - NowMsResult)
			end
			v3 = if ScaledNumber == nil or ScaledNumber < 0 or ScaledNumber > 60000 then 5000 else ScaledNumber
		end
		local Largest = math.max(SignalResult, NowMsResult + v3)
		Signal2(Largest)
		
		if Callback1 ~= nil then
			Callback1()
		end
		Callback1 = Schedule(math.max(0, Largest - NowMsResult), function() --[[ Line: 568 ]]
			-- upvalues: Callback1 (upval), Signal (upval), Largest (copy), Signal2 (upval)
			Callback1 = nil
			
			if Signal(false) == Largest then
				Signal2(0)
			end
		end)
	end
	
	local _ = function(): boolean --[[ Line: 576 | Named "isPostCoolingDown" ]]
		-- upvalues: Signal (copy), NowMs (copy), Callback1 (ref), Signal2 (copy)
		local SignalResult = Signal(false)
		
		if SignalResult == 0 then
			return false
		end
		if NowMs() < SignalResult then
			return true
		end
		if Callback1 ~= nil then
			Callback1()
			Callback1 = nil
		end
		Signal2(0)
		
		return false
	end
	
	local function markFeedUnavailable(FeedItemId, RateLimited) --[[ Line: 588 ]]
		-- upvalues: v1 (ref), CommentsStore (copy), CollectionStore (copy), LoadStatus (upval)
		local v3 = v1
		
		if v3 == nil or v3.feedItemId ~= FeedItemId or v3.ownerGeneration ~= CommentsStore.getOwnerGeneration(false) then return end
		local ActivePageRequest = v3.activePageRequest
		v3.activePageRequest = nil
		
		if ActivePageRequest ~= nil then
			ActivePageRequest.cancel()
		end
		CollectionStore.failLoad(FeedItemId, if CollectionStore.getState(FeedItemId)(false).initialLoadStatus == LoadStatus.Success then "more" else "initial", RateLimited)
	end
	
	local _ = function(FeedItemId) --[[ Line: 604 | Named "getOpenAnalyticsSession" ]]
		-- upvalues: v1 (ref), p1 (copy)
		local v3 = v1
		
		return if p1.getAnalyticsSession == nil or v3 == nil or v3.feedItemId ~= FeedItemId then nil else p1.getAnalyticsSession(FeedItemId, v3.sessionId)
	end
	
	local _ = function(p2, p3, Status, FailureReason) --[[ Line: 612 | Named "logReactionRequest" ]]
		local AnalyticsSession = p2.analyticsSession
		
		if AnalyticsSession == nil then return end
		local config = {
			status = Status,
			action = if p3 == "PUT" then "add" else "remove"
		}
		
		if FailureReason ~= nil then
			config.failureReason = FailureReason
		end
		AnalyticsSession.logRealtimeEvent("MomentsCommentReaction", config)
	end
	
	local function commitProjectedReaction(p2) --[[ Line: 632 ]]
		-- upvalues: ReactionStore (copy), CommentsStore (copy), SignalsExperimentalModule (upval)
		local Intent = ReactionStore.getIntent(p2.commentId, false)
		
		if Intent == nil or Intent.generation ~= p2.generation then
			return false
		end
		local DataResult = CommentsStore.getCachedComment(p2.commentId).data(false)
		
		if DataResult == nil then
			return ReactionStore.markLocallyConfirmed(p2.commentId, p2.generation)
		end
		local Reactions = ReactionStore.getProjection(p2.feedItemId, p2.commentId, DataResult.reactions, false).reactions
		
		if Reactions == nil then
			return ReactionStore.markLocallyConfirmed(p2.commentId, p2.generation)
		else
			local Copy = table.clone(DataResult)
			Copy.reactions = Reactions
			local ConfirmAndRebaseResult = false
			SignalsExperimentalModule.batch(function() --[[ Line: 649 ]]
				-- upvalues: CommentsStore (upval), Copy (copy), p2 (copy), ConfirmAndRebaseResult (ref), ReactionStore (upval), Reactions (copy)
				CommentsStore.upsertComments({ Copy }, p2.ownerGeneration)
				ConfirmAndRebaseResult = ReactionStore.confirmAndRebase(p2.commentId, p2.generation, Reactions)
			end)
			
			return ConfirmAndRebaseResult
		end
	end
	
	local _ = function(p2) --[[ Line: 656 | Named "retainUncertainUntilExpiry" ]]
		-- upvalues: t (copy), ReactionStore (copy), t1 (copy), Schedule (copy), FeedItemIds (copy)
		t[p2.commentId] = nil
		p2.cancelRetry = nil
		ReactionStore.markUncertain(p2.commentId, p2.generation)
		local CommentId = p2.commentId
		local Generation = p2.generation
		local Entry: () -> () = t1[CommentId]
		t1[CommentId] = nil
		
		if Entry ~= nil then
			Entry()
		end
		t1[CommentId] = Schedule(10000, function() --[[ Line: 457 ]]
			-- upvalues: t1 (upval), CommentId (copy), ReactionStore (upval), Generation (copy), FeedItemIds (upval)
			t1[CommentId] = nil
			
			if ReactionStore.expireIntent(CommentId, Generation) then
				FeedItemIds[CommentId] = nil
			end
		end)
	end
	
	local function rollbackReaction(p2, p3) --[[ Line: 663 ]]
		-- upvalues: t1 (copy), ReactionStore (copy), FeedItemIds (copy), Schedule (copy)
		local CommentId = p2.commentId
		local Entry: () -> () = t1[CommentId]
		t1[CommentId] = nil
		
		if Entry ~= nil then
			Entry()
		end
		if not ReactionStore.rollback(p2.commentId, p2.generation, p3) then return end
		local Intent = ReactionStore.getIntent(p2.commentId, false)
		
		if Intent == nil or Intent.status ~= "LocallyConfirmed" then
			FeedItemIds[p2.commentId] = nil
			
			return
		end
		FeedItemIds[p2.commentId] = p2.feedItemId
		local CommentId1 = p2.commentId
		local Generation = Intent.generation
		local Entry1: () -> () = t1[CommentId1]
		t1[CommentId1] = nil
		
		if Entry1 ~= nil then
			Entry1()
		end
		t1[CommentId1] = Schedule(10000, function() --[[ Line: 457 ]]
			-- upvalues: t1 (upval), CommentId1 (copy), ReactionStore (upval), Generation (copy), FeedItemIds (upval)
			t1[CommentId1] = nil
			
			if ReactionStore.expireIntent(CommentId1, Generation) then
				FeedItemIds[CommentId1] = nil
			end
		end)
	end
	
	local function applyTerminalFailure(p2, p3, CommentsUnavailable) --[[ Line: 677 ]]
		-- upvalues: clearReactionsForFeed (copy), markFeedUnavailable (copy), config (upval), clearReactionState (copy), ReactionStore (copy), config2 (upval), cancelReactionRequest (copy), t1 (copy), FeedItemIds (copy), rollbackReaction (copy)
		if CommentsUnavailable == "MomentUnavailable" then
			clearReactionsForFeed(p2.feedItemId, CommentsUnavailable)
			markFeedUnavailable(p2.feedItemId, CommentsUnavailable)
			
			return
		end
		if config[CommentsUnavailable] then
			clearReactionState()
			ReactionStore.setGlobalRestriction(CommentsUnavailable)
			
			return
		end
		if config2[CommentsUnavailable] then
			clearReactionsForFeed(p2.feedItemId, CommentsUnavailable)
			
			return
		end
		if CommentsUnavailable == "CommentNotFound" or p3 == 404 then
			local FeedItemId = p2.feedItemId
			local CommentId = p2.commentId
			local Generation = p2.generation
			cancelReactionRequest(CommentId)
			local Entry: () -> () = t1[CommentId]
			t1[CommentId] = nil
			
			if Entry ~= nil then
				Entry()
			end
			FeedItemIds[CommentId] = nil
			ReactionStore.clearComment(CommentId)
			
			if CommentsUnavailable ~= nil then
				ReactionStore.setCommentRestriction(FeedItemId, CommentId, CommentsUnavailable, Generation)
				
				return
			end
		else
			rollbackReaction(p2, CommentsUnavailable)
		end
	end
	
	local _ = nil
	
	local function v103(p2) --[[ Line: 695 ]]
		-- upvalues: Flag (ref), t (copy), CommentsStore (copy), ReactionStore (copy), rollbackReaction (copy), NowMs (copy), Schedule (copy), v103 (ref), t1 (copy), FeedItemIds (copy), ReadRetryAfter (copy), PutReaction (copy), DeleteReaction (copy), p1 (copy), FFlagMomentsCommentActionsRealtimeModule (upval), observeRequest (upval), commitProjectedReaction (copy), ReadStatusCode (copy), MomentsCommentsModule (upval), GetCommentsFailureReasonModule (upval), setReactionCooldown (copy), list (upval), applyTerminalFailure (copy)
		if Flag or t[p2.commentId] ~= p2 or CommentsStore.getOwnerGeneration(false) ~= p2.ownerGeneration or ReactionStore.getIntent(p2.commentId, false) == nil then return end
		if not p2.syncIsUncertain and p2.desiredEmoteId == p2.syncedEmoteId then
			t[p2.commentId] = nil
			rollbackReaction(p2, nil)
			
			return
		end
		local NowMsResult: number = NowMs()
		local CooldownUntilMs: number = ReactionStore.getCooldownUntilMs(false)
		
		if NowMsResult < CooldownUntilMs then
			ReactionStore.markUncertain(p2.commentId, p2.generation)
			local CooldownUntilMsDelta = CooldownUntilMs - NowMsResult
			
			if NowMsResult - p2.startedAtMs + CooldownUntilMsDelta <= 2000 then
				p2.cancelRetry = Schedule(CooldownUntilMsDelta, function() --[[ Line: 717 ]]
					-- upvalues: p2 (copy), v103 (upval)
					p2.cancelRetry = nil
					v103(p2)
				end)
				
				return
			end
			t[p2.commentId] = nil
			p2.cancelRetry = nil
			ReactionStore.markUncertain(p2.commentId, p2.generation)
			local CommentId = p2.commentId
			local Generation = p2.generation
			local Entry: () -> () = t1[CommentId]
			t1[CommentId] = nil
			
			if Entry ~= nil then
				Entry()
			end
			t1[CommentId] = Schedule(10000, function() --[[ Line: 457 ]]
				-- upvalues: t1 (upval), CommentId (copy), ReactionStore (upval), Generation (copy), FeedItemIds (upval)
				t1[CommentId] = nil
				
				if ReactionStore.expireIntent(CommentId, Generation) then
					FeedItemIds[CommentId] = nil
				end
			end)
			
			return
		else
			if CooldownUntilMs > 0 then
				ReactionStore.setCooldownUntilMs(0)
			end
			if p2.attemptGeneration ~= p2.generation then
				p2.attemptGeneration = p2.generation
				p2.attempt = 0
				p2.startedAtMs = NowMsResult
			end
			if p2.attempt > 0 and NowMsResult - p2.startedAtMs > 2000 then
				t[p2.commentId] = nil
				p2.cancelRetry = nil
				ReactionStore.markUncertain(p2.commentId, p2.generation)
				local CommentId1 = p2.commentId
				local Generation1 = p2.generation
				local Entry: () -> () = t1[CommentId1]
				t1[CommentId1] = nil
				
				if Entry ~= nil then
					Entry()
				end
				t1[CommentId1] = Schedule(10000, function() --[[ Line: 457 ]]
					-- upvalues: t1 (upval), CommentId1 (copy), ReactionStore (upval), Generation1 (copy), FeedItemIds (upval)
					t1[CommentId1] = nil
					
					if ReactionStore.expireIntent(CommentId1, Generation1) then
						FeedItemIds[CommentId1] = nil
					end
				end)
				
				return
			else
				p2.attempt += 1
				
				if not ReactionStore.markPending(p2.commentId, p2.generation) then
					t[p2.commentId] = nil
					
					return
				end
				p2.readyToCommit = false
				local Generation2 = p2.generation
				local DesiredEmoteId = p2.desiredEmoteId
				local Verb = p2.verb
				local StatusCode = nil
				local v3 = nil
				local v4 = (if Verb == "PUT" then PutReaction else DeleteReaction)(p2.feedItemId, p2.commentId, p2.emoteId, p1.network, {
					[429] = {
						function(p3) --[[ Line: 752 ]]
							-- upvalues: StatusCode (ref), v3 (ref), ReadRetryAfter (upval)
							StatusCode = p3.statusCode
							v3 = ReadRetryAfter(p3)
						end
					}
				})
				
				if FFlagMomentsCommentActionsRealtimeModule then
					local AnalyticsSession = p2.analyticsSession
					
					if AnalyticsSession ~= nil then
						AnalyticsSession.logRealtimeEvent("MomentsCommentReaction", {
							status = "attempted",
							action = if Verb == "PUT" then "add" else "remove"
						})
					end
				end
				p2.cancelRequest = observeRequest(v4, function(p3) --[[ Line: 763 ]]
					-- upvalues: Flag (upval), t (upval), p2 (copy), CommentsStore (upval), FFlagMomentsCommentActionsRealtimeModule (upval), Verb (copy), DesiredEmoteId (copy), Generation2 (copy), commitProjectedReaction (upval), t1 (upval), Schedule (upval), ReactionStore (upval), FeedItemIds (upval), v103 (upval), ReadStatusCode (upval), StatusCode (ref), MomentsCommentsModule (upval), GetCommentsFailureReasonModule (upval), rollbackReaction (upval), setReactionCooldown (upval), v3 (ref), list (upval), NowMs (upval), applyTerminalFailure (upval)
					if Flag or t[p2.commentId] ~= p2 or CommentsStore.getOwnerGeneration(false) ~= p2.ownerGeneration then return end
					p2.cancelRequest = nil
					
					if FFlagMomentsCommentActionsRealtimeModule and p3.status == "succeeded" then
						local AnalyticsSession = p2.analyticsSession
						
						if AnalyticsSession ~= nil then
							AnalyticsSession.logRealtimeEvent("MomentsCommentReaction", {
								status = "succeeded",
								action = if Verb == "PUT" then "add" else "remove"
							})
						end
					end
					if p3.status == "succeeded" then
						p2.syncedEmoteId = DesiredEmoteId
						p2.syncIsUncertain = false
						
						if p2.generation == Generation2 then
							t[p2.commentId] = nil
							
							if commitProjectedReaction(p2) then
								local CommentId1 = p2.commentId
								local Entry: () -> () = t1[CommentId1]
								t1[CommentId1] = nil
								
								if Entry ~= nil then
									Entry()
								end
								t1[CommentId1] = Schedule(10000, function() --[[ Line: 457 ]]
									-- upvalues: t1 (upval), CommentId1 (copy), ReactionStore (upval), Generation2 (copy), FeedItemIds (upval)
									t1[CommentId1] = nil
									
									if ReactionStore.expireIntent(CommentId1, Generation2) then
										FeedItemIds[CommentId1] = nil
									end
								end)
							end
							return
						else
							if p2.desiredEmoteId == p2.syncedEmoteId then
								t[p2.commentId] = nil
								
								if commitProjectedReaction(p2) then
									local CommentId = p2.commentId
									local Generation = p2.generation
									local Entry: () -> () = t1[CommentId]
									t1[CommentId] = nil
									
									if Entry ~= nil then
										Entry()
									end
									t1[CommentId] = Schedule(10000, function() --[[ Line: 457 ]]
										-- upvalues: t1 (upval), CommentId (copy), ReactionStore (upval), Generation (copy), FeedItemIds (upval)
										t1[CommentId] = nil
										
										if ReactionStore.expireIntent(CommentId, Generation) then
											FeedItemIds[CommentId] = nil
										end
									end)
									
									return
								end
							elseif p2.readyToCommit then
								v103(p2)
							end
							return
						end
					else
						local StatusCode1: number = ReadStatusCode(p3, StatusCode)
						local ParseCommentsErrorResult = MomentsCommentsModule.parseCommentsError(p3.error)
						local CommentsUnavailable = if ParseCommentsErrorResult == nil then "CommentsUnavailable" else ParseCommentsErrorResult.errorCode
						
						if FFlagMomentsCommentActionsRealtimeModule then
							local CommentsFailureReasonModule = GetCommentsFailureReasonModule(CommentsUnavailable, StatusCode1)
							local AnalyticsSession = p2.analyticsSession
							
							if AnalyticsSession ~= nil then
								local config = {
									status = "failed",
									action = if Verb == "PUT" then "add" else "remove"
								}
								
								if CommentsFailureReasonModule ~= nil then
									config.failureReason = CommentsFailureReasonModule
								end
								AnalyticsSession.logRealtimeEvent("MomentsCommentReaction", config)
							end
						end
						if StatusCode1 == 429 then
							t[p2.commentId] = nil
							rollbackReaction(p2, nil)
							setReactionCooldown(v3)
							
							return
						end
						if StatusCode1 ~= nil and (StatusCode1 ~= 408 and (StatusCode1 == nil or (StatusCode1 < 500 or StatusCode1 > 599))) then
							t[p2.commentId] = nil
							applyTerminalFailure(p2, StatusCode1, CommentsUnavailable)
							
							return
						end
						p2.syncIsUncertain = true
						
						if p2.generation == Generation2 then
							ReactionStore.markUncertain(p2.commentId, Generation2)
							local Entry = list[p2.attempt]
							
							if p2.attempt <= 2 and Entry ~= nil and NowMs() - p2.startedAtMs + Entry <= 2000 then
								p2.cancelRetry = Schedule(Entry, function() --[[ Line: 825 ]]
									-- upvalues: p2 (upval), t (upval), CommentsStore (upval), v103 (upval)
									p2.cancelRetry = nil
									
									if t[p2.commentId] == p2 and CommentsStore.getOwnerGeneration(false) == p2.ownerGeneration then
										v103(p2)
									end
								end)
								
								return
							end
							t[p2.commentId] = nil
							p2.cancelRetry = nil
							ReactionStore.markUncertain(p2.commentId, p2.generation)
							local CommentId2 = p2.commentId
							local Generation1 = p2.generation
							local Entry1: () -> () = t1[CommentId2]
							t1[CommentId2] = nil
							
							if Entry1 ~= nil then
								Entry1()
							end
							t1[CommentId2] = Schedule(10000, function() --[[ Line: 457 ]]
								-- upvalues: t1 (upval), CommentId2 (copy), ReactionStore (upval), Generation1 (copy), FeedItemIds (upval)
								t1[CommentId2] = nil
								
								if ReactionStore.expireIntent(CommentId2, Generation1) then
									FeedItemIds[CommentId2] = nil
								end
							end)
							
							return
						elseif p2.readyToCommit then
							v103(p2)
						end
					end
				end)
			end
		end
	end
	
	local function scheduleReactionCommit(p2) --[[ Line: 845 ]]
		-- upvalues: ReactionDebounceMs (copy), v103 (ref), Schedule (copy), Flag (ref), t (copy)
		if p2.cancelDebounce ~= nil then
			p2.cancelDebounce()
			p2.cancelDebounce = nil
		end
		p2.readyToCommit = false
		
		if ReactionDebounceMs > 0 then
			p2.cancelDebounce = Schedule(ReactionDebounceMs, function() --[[ Line: 858 ]]
				-- upvalues: p2 (copy), Flag (upval), t (upval), v103 (upval)
				p2.cancelDebounce = nil
				
				if Flag or t[p2.commentId] ~= p2 then return end
				p2.readyToCommit = true
				
				if p2.cancelRequest == nil and p2.cancelRetry == nil then
					v103(p2)
				end
			end)
			
			return
		end
		p2.readyToCommit = true
		
		if p2.cancelRequest == nil and p2.cancelRetry == nil then
			v103(p2)
		end
	end
	
	local function beginReactionMutation(FeedItemId, Key, EmoteId, p2, DesiredEmoteId, Verb, SyncedEmoteId): boolean --[[ Line: 870 ]]
		-- upvalues: Flag (ref), ReactionStore (copy), NowMs (copy), t1 (copy), t (copy), CommentsStore (copy), FFlagMomentsCommentActionsRealtimeModule (upval), v1 (ref), p1 (copy), FeedItemIds (copy), scheduleReactionCommit (copy)
		if Flag or ReactionStore.getRestriction(FeedItemId, Key, false) ~= nil then
			return false
		end
		local NowMsResult = NowMs()
		local CooldownUntilMs: number = ReactionStore.getCooldownUntilMs(false)
		
		if NowMsResult < CooldownUntilMs then
			return false
		end
		if CooldownUntilMs > 0 then
			ReactionStore.setCooldownUntilMs(0)
		end
		local Entry: () -> () = t1[Key]
		t1[Key] = nil
		
		if Entry ~= nil then
			Entry()
		end
		local BeginIntentResult = ReactionStore.beginIntent(FeedItemId, Key, p2, DesiredEmoteId)
		local Entry1 = t[Key]
		
		if Entry1 == nil then
			Entry1 = {
				attempt = 0,
				syncIsUncertain = false,
				readyToCommit = false,
				cancelRequest = nil,
				cancelRetry = nil,
				cancelDebounce = nil,
				feedItemId = FeedItemId,
				commentId = Key,
				emoteId = EmoteId,
				verb = Verb,
				generation = BeginIntentResult,
				ownerGeneration = CommentsStore.getOwnerGeneration(false),
				startedAtMs = NowMsResult,
				attemptGeneration = BeginIntentResult,
				desiredEmoteId = DesiredEmoteId,
				syncedEmoteId = SyncedEmoteId
			}
			t[Key] = Entry1
		else
			Entry1.verb = Verb
			Entry1.generation = BeginIntentResult
			Entry1.desiredEmoteId = DesiredEmoteId
			
			if Entry1.cancelRetry ~= nil then
				Entry1.cancelRetry()
				Entry1.cancelRetry = nil
				Entry1.syncIsUncertain = true
			end
		end
		if FFlagMomentsCommentActionsRealtimeModule then
			local v3 = v1
			Entry1.analyticsSession = if p1.getAnalyticsSession == nil or v3 == nil or v3.feedItemId ~= FeedItemId then nil else p1.getAnalyticsSession(FeedItemId, v3.sessionId)
		end
		FeedItemIds[Key] = FeedItemId
		scheduleReactionCommit(Entry1)
		
		return true
	end
	
	local function ensureReactionPresent(FeedItemId, Key, DesiredEmoteId, p2) --[[ Line: 931 ]]
		-- upvalues: ReactionStore (copy), beginReactionMutation (copy)
		if p2 == nil then
			return false
		end
		local Reactions = ReactionStore.getProjection(FeedItemId, Key, p2, false).reactions
		
		if Reactions == nil or (if Reactions == nil or Reactions.userReaction == nil then nil else Reactions.userReaction.emoteId) ~= nil then
			return false
		else
			return (beginReactionMutation(FeedItemId, Key, DesiredEmoteId, p2, DesiredEmoteId, "PUT", nil))
		end
	end
	
	local function ensureReactionAbsent(FeedItemId, Key, EmoteId, p2) --[[ Line: 947 ]]
		-- upvalues: ReactionStore (copy), beginReactionMutation (copy)
		if p2 == nil then
			return false
		end
		local Reactions = ReactionStore.getProjection(FeedItemId, Key, p2, false).reactions
		
		if Reactions == nil or (if Reactions == nil or Reactions.userReaction == nil then nil else Reactions.userReaction.emoteId) ~= EmoteId then
			return false
		else
			return (beginReactionMutation(FeedItemId, Key, EmoteId, p2, nil, "DELETE", EmoteId))
		end
	end
	
	local Callback2 = nil
	
	local function failInvalidContinuation(FeedItemId) --[[ Line: 965 ]]
		-- upvalues: CollectionStore (copy)
		local v3 = CollectionStore.getState(FeedItemId)(false)
		
		if #v3.orderedCommentIds > 0 or v3.pendingSubmission ~= nil then
			CollectionStore.failLoad(FeedItemId, "more", "CommentsUnavailable")
			
			return
		else
			CollectionStore.failLoad(FeedItemId, "initial", "CommentsUnavailable")
		end
	end
	
	local function continueAfterMerge(FeedItemId, SessionId, p2, ShouldContinuePaging) --[[ Line: 974 ]]
		-- upvalues: v1 (ref), Flag (ref), CommentsStore (copy), failInvalidContinuation (copy), Callback2 (ref)
		if not p2.hasMore then return end
		local v3 = v1
		local v4 = if Flag or v3 == nil or v3.feedItemId ~= FeedItemId or v3.sessionId ~= SessionId or v3.ownerGeneration ~= CommentsStore.getOwnerGeneration(false) or v3.refCount == 0 then nil else v3
		
		if v4 == nil then return end
		local NextCursor = p2.nextCursor
		
		if NextCursor == nil or v4.requestedCursors[NextCursor or "<initial>"] == true then
			failInvalidContinuation(FeedItemId)
			
			return
		end
		if ShouldContinuePaging then
			Callback2(FeedItemId, SessionId, "more", NextCursor)
		end
	end
	
	local function commentsForUpsert(Comments, Generation) --[[ Line: 1000 ]]
		-- upvalues: ReactionStore (copy), CommentsStore (copy)
		local Buffer = table.create(#Comments)
		
		for _, comment in Comments do
			local v3 = comment
			local Intent = ReactionStore.getIntent(comment.commentId, false)
			local IsDesiredEmoteIdMatch = false
			local NoReactions = comment.reactions == nil
			
			if not NoReactions then
				IsDesiredEmoteIdMatch = false
				NoReactions = Intent == nil
			end
			if not NoReactions then
				local Reactions = comment.reactions
				IsDesiredEmoteIdMatch = (if Reactions == nil or Reactions.userReaction == nil then nil else Reactions.userReaction.emoteId) == Intent.desiredEmoteId
			end
			local NoIntent: boolean = Intent == nil or Generation >= Intent.generation or IsDesiredEmoteIdMatch
			local DataResult = nil
			
			if not NoIntent then
				DataResult = CommentsStore.getCachedComment(comment.commentId).data(false)
				NoIntent = DataResult == nil
			end
			if not NoIntent then
				v3 = table.clone(comment)
				v3.reactions = DataResult.reactions
			end
			table.insert(Buffer, v3)
		end
		return Buffer
	end
	
	Callback2 = function(FeedItemId, SessionId, p2, NextCursor): boolean --[[ Line: 1020 ]]
		-- upvalues: v1 (ref), Flag (ref), CommentsStore (copy), FFlagMomentsComments (upval), ReactionStore (copy), failInvalidContinuation (copy), CollectionStore (copy), p1 (copy), EventNames (upval), FetchPage (copy), observeRequest (upval), FFlagMomentsCommentsCountAnalyticsModule (upval), GetCommentsFailureReasonModule (upval), MomentsCommentsModule (upval), ReadStatusCode (copy), commentsForUpsert (copy), cancelReactionRequest (copy), t1 (copy), FeedItemIds (copy), continueAfterMerge (copy), clearReactionsForFeed (copy), Callback2 (ref)
		local v4 = v1
		local v5 = if Flag or v4 == nil or v4.feedItemId ~= FeedItemId or v4.sessionId ~= SessionId or v4.ownerGeneration ~= CommentsStore.getOwnerGeneration(false) or v4.refCount == 0 then nil else v4
		
		if v5 == nil or v5.activePageRequest ~= nil then
			return false
		end
		local OwnerGeneration = CommentsStore.getOwnerGeneration(false)
		local Generation = if FFlagMomentsComments then ReactionStore.getGeneration(false) else 0
		
		if p2 == "more" then
			if NextCursor == nil or v5.requestedCursors[NextCursor or "<initial>"] == true then
				failInvalidContinuation(FeedItemId)
				
				return false
			end
			v5.requestedCursors[NextCursor or "<initial>"] = true
		end
		if p2 == "initial" then
			CollectionStore.beginInitialLoad(FeedItemId)
		else
			CollectionStore.beginLoadMore(FeedItemId)
		end
		local AnalyticsSession = nil
		local Pagination = if p2 == "more" then "pagination" else v5.initialLoadType
		
		if FFlagMomentsComments and p1.getAnalyticsSession ~= nil then
			AnalyticsSession = p1.getAnalyticsSession(FeedItemId, SessionId)
			
			if AnalyticsSession ~= nil then
				AnalyticsSession.logEvent(EventNames.MomentCommentsListLoadAttempted, { loadType = Pagination })
			end
		end
		local ActivePageRequest = { cancel = function() --[[ Line: 1056 ]] end }
		v5.activePageRequest = ActivePageRequest
		ActivePageRequest.cancel = observeRequest(FetchPage({
			sort = "newest",
			feedItemId = FeedItemId,
			cursor = NextCursor
		}, p1.network), function(p3) --[[ Line: 1060 ]]
			-- upvalues: v5 (copy), FeedItemId (copy), SessionId (copy), OwnerGeneration (copy), Flag (upval), v1 (upval), CommentsStore (upval), ActivePageRequest (copy), FFlagMomentsComments (upval), AnalyticsSession (ref), Pagination (copy), FFlagMomentsCommentsCountAnalyticsModule (upval), EventNames (upval), GetCommentsFailureReasonModule (upval), MomentsCommentsModule (upval), ReadStatusCode (upval), commentsForUpsert (upval), Generation (copy), ReactionStore (upval), cancelReactionRequest (upval), t1 (upval), FeedItemIds (upval), p2 (copy), CollectionStore (upval), continueAfterMerge (upval), clearReactionsForFeed (upval), Callback2 (upval), NextCursor (copy)
			if Flag or (v1 ~= v5 or (v5.feedItemId ~= FeedItemId or (v5.sessionId ~= SessionId or (v5.ownerGeneration ~= OwnerGeneration or CommentsStore.getOwnerGeneration(false) ~= OwnerGeneration)))) or v5.activePageRequest ~= ActivePageRequest then return end
			v5.activePageRequest = nil
			
			if FFlagMomentsComments and AnalyticsSession ~= nil then
				if p3.status == "succeeded" and p3.result ~= nil then
					local config = { loadType = Pagination }
					
					if FFlagMomentsCommentsCountAnalyticsModule then
						config.loadedCommentCount = tostring(#p3.result.comments)
					end
					AnalyticsSession.logEvent(EventNames.MomentCommentsListLoadSucceeded, config)
				else
					local ParseCommentsErrorResult = MomentsCommentsModule.parseCommentsError(p3.error)
					AnalyticsSession.logEvent(EventNames.MomentCommentsListLoadFailed, {
						loadType = Pagination,
						failureReason = GetCommentsFailureReasonModule(if ParseCommentsErrorResult == nil then "CommentsUnavailable" else ParseCommentsErrorResult.errorCode, ReadStatusCode(p3, nil))
					})
				end
			end
			if p3.status == "succeeded" and p3.result ~= nil then
				if FFlagMomentsComments then
					CommentsStore.upsertComments(commentsForUpsert(p3.result.comments, Generation), OwnerGeneration)
					
					for _, comment in p3.result.comments do
						if ReactionStore.reconcile(FeedItemId, comment.commentId, comment.reactions, Generation) then
							cancelReactionRequest(comment.commentId)
							local CommentId = comment.commentId
							local Entry: () -> () = t1[CommentId]
							t1[CommentId] = nil
							
							if Entry ~= nil then
								Entry()
							end
							FeedItemIds[comment.commentId] = nil
						end
					end
				else
					CommentsStore.upsertComments(p3.result.comments, OwnerGeneration)
				end
				continueAfterMerge(FeedItemId, SessionId, p3.result, (if p2 == "initial" then CollectionStore.completeInitialLoad(FeedItemId, p3.result) else CollectionStore.completeLoadMore(FeedItemId, p3.result)).shouldContinuePaging)
				
				return
			else
				local ParseCommentsErrorResult = MomentsCommentsModule.parseCommentsError(p3.error)
				local CommentsUnavailable = if ParseCommentsErrorResult == nil then "CommentsUnavailable" else ParseCommentsErrorResult.errorCode
				
				if FFlagMomentsComments and CommentsUnavailable == "MomentUnavailable" then
					clearReactionsForFeed(FeedItemId, CommentsUnavailable)
				end
				if p2 == "more" and CommentsUnavailable == "InvalidCursor" then
					if FFlagMomentsComments then
						v5.initialLoadType = "refresh"
					end
					CollectionStore.resetListSession(FeedItemId)
					table.clear(v5.requestedCursors)
					Callback2(FeedItemId, SessionId, "initial", nil)
					
					return
				else
					if p2 == "more" and NextCursor ~= nil then
						v5.requestedCursors[NextCursor or "<initial>"] = nil
					end
					CollectionStore.failLoad(FeedItemId, p2, CommentsUnavailable)
				end
			end
		end)
		
		if not Flag and (v1 == v5 and (v5.feedItemId == FeedItemId and (v5.sessionId == SessionId and (v5.ownerGeneration == OwnerGeneration and CommentsStore.getOwnerGeneration(false) == OwnerGeneration)))) then
			return true
		end
		if v5.activePageRequest == ActivePageRequest then
			v5.activePageRequest = nil
		end
		ActivePageRequest.cancel()
		
		return false
	end
	
	local function revokeViewerWrite(FeedItemId, OwnerGeneration) --[[ Line: 1145 ]]
		-- upvalues: CommentsStore (copy), markFeedUnavailable (copy)
		local DataResult = CommentsStore.getCachedMomentComments(FeedItemId).data(false)
		
		if DataResult == nil then
			markFeedUnavailable(FeedItemId, "ViewerNotEligibleToWrite")
			
			return
		else
			local Copy = table.clone(DataResult)
			Copy.viewerCanWrite = false
			CommentsStore.upsertMomentComments({ [FeedItemId] = Copy }, OwnerGeneration)
		end
	end
	
	local function incrementMomentCommentCount(FeedItemId, OwnerGeneration) --[[ Line: 1156 ]]
		-- upvalues: CommentsStore (copy)
		local DataResult = CommentsStore.getCachedMomentComments(FeedItemId).data(false)
		
		if DataResult ~= nil and DataResult.count ~= nil and DataResult.countIsCapped ~= true then
			local Copy = table.clone(DataResult)
			Copy.count = DataResult.count + 1
			CommentsStore.upsertMomentComments({ [FeedItemId] = Copy }, OwnerGeneration)
			
			return
		end
	end
	
	local function startPendingPost(p3, FeedItemId, SessionId, PendingSubmission, p4): boolean --[[ Line: 1167 ]]
		-- upvalues: v2 (ref), CommentsStore (copy), FFlagMomentsComments (upval), ReadRetryAfter (copy), AnalyticsSession (ref), EventNames (upval), PostComment (copy), p1 (copy), observeRequest (upval), Flag (ref), v1 (ref), CollectionStore (copy), incrementMomentCommentCount (copy), CommentPostedCallback (ref), ReadStatusCode (copy), MomentsCommentsModule (upval), setPostCooldown (copy), GetCommentsFailureReasonModule (upval), config1 (upval), markFeedUnavailable (copy), revokeViewerWrite (copy)
		if v2 ~= nil then
			return false
		end
		local OwnerGeneration = CommentsStore.getOwnerGeneration(false)
		local StatusCode = nil
		local v6 = nil
		local Config = if FFlagMomentsComments then {
			[429] = {
				function(p5) --[[ Line: 1188 ]]
					-- upvalues: StatusCode (ref), v6 (ref), ReadRetryAfter (upval)
					StatusCode = p5.statusCode
					v6 = ReadRetryAfter(p5)
				end
			}
		} else nil
		local AnalyticsSession1 = AnalyticsSession
		
		if FFlagMomentsComments and AnalyticsSession1 ~= nil then
			AnalyticsSession1.logEvent(EventNames.MomentCommentPostAttempted)
		end
		local PostCommentResult = PostComment(FeedItemId, {
			text = PendingSubmission.text,
			clientRequestId = PendingSubmission.clientRequestId
		}, p1.network, Config)
		local config = {
			analyticsSession = AnalyticsSession1,
			clientRequestId = PendingSubmission.clientRequestId,
			feedItemId = FeedItemId,
			sessionId = SessionId,
			ownerGeneration = OwnerGeneration,
			cancel = function() --[[ Line: 1209 ]] end
		}
		v2 = config
		config.cancel = observeRequest(PostCommentResult, function(p5) --[[ Line: 1212 ]]
			-- upvalues: v2 (upval), config (copy), FeedItemId (copy), SessionId (copy), OwnerGeneration (copy), p3 (copy), Flag (upval), v1 (upval), CommentsStore (upval), CollectionStore (upval), incrementMomentCommentCount (upval), FFlagMomentsComments (upval), AnalyticsSession1 (copy), EventNames (upval), CommentPostedCallback (upval), ReadStatusCode (upval), StatusCode (ref), MomentsCommentsModule (upval), p4 (copy), setPostCooldown (upval), v6 (ref), GetCommentsFailureReasonModule (upval), config1 (upval), markFeedUnavailable (upval), revokeViewerWrite (upval)
			if v2 ~= config or config.feedItemId ~= FeedItemId or config.sessionId ~= SessionId or config.ownerGeneration ~= OwnerGeneration or (Flag or (v1 ~= p3 or (p3.feedItemId ~= FeedItemId or (p3.sessionId ~= SessionId or (p3.ownerGeneration ~= OwnerGeneration or CommentsStore.getOwnerGeneration(false) ~= OwnerGeneration))))) then return end
			v2 = nil
			local PendingSubmission = CollectionStore.getPendingSubmission(FeedItemId)
			
			if PendingSubmission == nil or PendingSubmission.clientRequestId ~= config.clientRequestId then return end
			if p5.status == "succeeded" and p5.result ~= nil then
				CommentsStore.upsertComments({ p5.result }, OwnerGeneration)
				CollectionStore.resolvePendingSubmission(FeedItemId, p5.result)
				incrementMomentCommentCount(FeedItemId, OwnerGeneration)
				
				if FFlagMomentsComments and AnalyticsSession1 ~= nil then
					AnalyticsSession1.logEvent(EventNames.MomentCommentPostResult, { outcome = "success", commentId = p5.result.commentId })
				end
				if FFlagMomentsComments then
					local Callback: (any) -> () = CommentPostedCallback
					CommentPostedCallback = nil
					
					if Callback ~= nil then
						Callback(p5.result.text)
					end
				end
				return
			elseif FFlagMomentsComments then
				local StatusCode1: number = ReadStatusCode(p5, StatusCode)
				local ParseCommentsErrorResult = MomentsCommentsModule.parseCommentsError(p5.error)
				local ErrorCode = if ParseCommentsErrorResult == nil then nil else ParseCommentsErrorResult.errorCode
				local RateLimited = if ErrorCode == "CommentsUnavailable" then nil elseif ErrorCode == nil then if StatusCode1 == nil or StatusCode1 == 408 or StatusCode1 < 400 or StatusCode1 >= 500 then nil elseif StatusCode1 == 429 then "RateLimited" elseif StatusCode1 == 401 then "AuthenticationRequired" else "PostRejected" else ErrorCode
				
				if p4 and RateLimited ~= nil and (StatusCode1 == 429 or ParseCommentsErrorResult == nil) then
					RateLimited = nil
				end
				if StatusCode1 == 429 then
					setPostCooldown(v6)
				end
				if AnalyticsSession1 ~= nil then
					AnalyticsSession1.logEvent(EventNames.MomentCommentPostResult, {
						outcome = if RateLimited == nil then "unknown" else "rejected",
						failureReason = GetCommentsFailureReasonModule(if ParseCommentsErrorResult == nil then nil else ParseCommentsErrorResult.errorCode, StatusCode1)
					})
				end
				if RateLimited == nil then
					CollectionStore.markPendingOutcomeUnknown(FeedItemId)
				else
					CollectionStore.rejectPendingSubmission(FeedItemId, RateLimited)
					
					if config1[RateLimited] then
						markFeedUnavailable(FeedItemId, RateLimited)
						
						return
					end
					if RateLimited == "ViewerNotEligibleToWrite" then
						revokeViewerWrite(FeedItemId, OwnerGeneration)
						
						return
					end
				end
				return
			else
				local ParseCommentsErrorResult1 = MomentsCommentsModule.parseCommentsError(p5.error)
				
				if ParseCommentsErrorResult1 == nil or ParseCommentsErrorResult1.errorCode ~= "TextFilterRejected" and ParseCommentsErrorResult1.errorCode ~= "RateLimited" then
					CollectionStore.markPendingOutcomeUnknown(FeedItemId)
				else
					CollectionStore.rejectPendingSubmission(FeedItemId, ParseCommentsErrorResult1.errorCode)
					
					if FFlagMomentsComments then
						CommentPostedCallback = nil
						
						return
					end
				end
			end
		end)
		
		if not Flag and (v1 == p3 and (p3.feedItemId == FeedItemId and (p3.sessionId == SessionId and (p3.ownerGeneration == OwnerGeneration and CommentsStore.getOwnerGeneration(false) == OwnerGeneration)))) then
			return true
		end
		if v2 == config then
			v2 = nil
		end
		config.cancel()
		
		return false
	end
	
	local function decrementMomentCommentCount(p3, p4) --[[ Line: 1374 ]]
		-- upvalues: CommentsStore (copy)
		local DataResult = CommentsStore.getCachedMomentComments(p3).data(false)
		
		if DataResult ~= nil and DataResult.count ~= nil and DataResult.countIsCapped ~= true and DataResult.count > 0 then
			local Copy = table.clone(DataResult)
			Copy.count = DataResult.count - 1
			CommentsStore.upsertMomentComments({ [p3] = Copy }, p4)
			
			return
		end
	end
	
	local function removeDeletedComment(FeedItemId, Value, OwnerGeneration) --[[ Line: 1389 ]]
		-- upvalues: SessionFilters (copy), CollectionStore (copy), FFlagMomentsComments (upval), cancelReactionRequest (copy), t1 (copy), FeedItemIds (copy), ReactionStore (copy), decrementMomentCommentCount (copy)
		if SessionFilters ~= nil then
			SessionFilters.hideCommentForSession(Value)
		end
		local v6 = CollectionStore.getState(FeedItemId)(false)
		
		if table.find(v6.orderedCommentIds, Value) ~= nil or table.find(v6.stickyPostedCommentIds, Value) ~= nil then
			CollectionStore.removeCommentId(FeedItemId, Value)
		end
		if FFlagMomentsComments then
			cancelReactionRequest(Value)
			local Entry: () -> () = t1[Value]
			t1[Value] = nil
			
			if Entry ~= nil then
				Entry()
			end
			FeedItemIds[Value] = nil
			ReactionStore.clearComment(Value)
		end
		decrementMomentCommentCount(FeedItemId, OwnerGeneration)
	end
	
	local _ = function() --[[ Line: 1480 | Named "cancelActiveDeletes" ]]
		-- upvalues: T (ref)
		local T1 = T
		T = {}
		
		for _, value in T1 do
			value.cancel()
		end
	end
	
	local function cancelActivePost(IsOwnerGenerationMatch) --[[ Line: 1488 ]]
		-- upvalues: v2 (ref), FFlagMomentsComments (upval), CommentsStore (copy), EventNames (upval), CollectionStore (copy)
		local v6 = v2
		v2 = nil
		
		if v6 == nil then return end
		if FFlagMomentsComments and v6.analyticsSession ~= nil and v6.ownerGeneration == CommentsStore.getOwnerGeneration(false) then
			v6.analyticsSession.logEvent(EventNames.MomentCommentPostResult, { outcome = "cancelled", failureReason = "cancelled" })
		end
		v6.cancel()
		
		if IsOwnerGenerationMatch then
			local PendingSubmission = CollectionStore.getPendingSubmission(v6.feedItemId)
			
			if PendingSubmission ~= nil and PendingSubmission.clientRequestId == v6.clientRequestId then
				CollectionStore.markPendingOutcomeUnknown(v6.feedItemId)
			end
		end
	end
	
	local _ = function(p3) --[[ Line: 1513 | Named "retireActiveSession" ]]
		-- upvalues: FFlagMomentsComments (upval), CommentPostedCallback (ref), v1 (ref), cancelActivePost (copy), AnalyticsSession (ref)
		if FFlagMomentsComments and not p3 then
			CommentPostedCallback = nil
		end
		local v6 = v1
		v1 = nil
		
		if v6 ~= nil then
			local ActivePageRequest = v6.activePageRequest
			v6.activePageRequest = nil
			
			if ActivePageRequest ~= nil then
				ActivePageRequest.cancel()
			end
		end
		cancelActivePost(p3)
		
		if FFlagMomentsComments and not p3 then
			AnalyticsSession = nil
		end
	end
	
	local function ensureInitialLoad(FeedItemId, SessionId) --[[ Line: 1584 ]]
		-- upvalues: v1 (ref), Flag (ref), CommentsStore (copy), CollectionStore (copy), LoadStatus (upval), Callback2 (ref)
		local v6 = v1
		
		if (if Flag or v6 == nil or v6.feedItemId ~= FeedItemId or v6.sessionId ~= SessionId or v6.ownerGeneration ~= CommentsStore.getOwnerGeneration(false) or v6.refCount == 0 then nil else v6) == nil then
			return false
		else
			local v7 = CollectionStore.getState(FeedItemId)(false)
			
			return v7.initialLoadStatus == LoadStatus.Idle and v7.loadMoreStatus ~= LoadStatus.Loading and Callback2(FeedItemId, SessionId, "initial", nil)
		end
	end
	
	local function loadMore(FeedItemId, SessionId) --[[ Line: 1596 ]]
		-- upvalues: CollectionStore (copy), LoadStatus (upval), Callback2 (ref)
		local v6 = CollectionStore.getState(FeedItemId)(false)
		
		return v6.hasMore == true and v6.initialLoadStatus ~= LoadStatus.Loading and v6.loadMoreStatus ~= LoadStatus.Loading and v6.loadMoreStatus ~= LoadStatus.Failed and Callback2(FeedItemId, SessionId, "more", v6.nextCursor)
	end
	
	local function retryInitial(FeedItemId, SessionId) --[[ Line: 1609 ]]
		-- upvalues: v1 (ref), Flag (ref), CommentsStore (copy), FFlagMomentsComments (upval), CollectionStore (copy), LoadStatus (upval), ensureInitialLoad (copy)
		local v6 = v1
		local v7 = if Flag or v6 == nil or v6.feedItemId ~= FeedItemId or v6.sessionId ~= SessionId or v6.ownerGeneration ~= CommentsStore.getOwnerGeneration(false) or v6.refCount == 0 then nil else v6
		
		if v7 == nil then
			return false
		end
		if FFlagMomentsComments and CollectionStore.getState(FeedItemId)(false).initialLoadStatus == LoadStatus.Success then
			v7.initialLoadType = "refresh"
		end
		local ActivePageRequest = v7.activePageRequest
		v7.activePageRequest = nil
		
		if ActivePageRequest ~= nil then
			ActivePageRequest.cancel()
		end
		table.clear(v7.requestedCursors)
		CollectionStore.resetListSession(FeedItemId)
		
		return ensureInitialLoad(FeedItemId, SessionId)
	end
	
	local function resolveCommentAuthor(p3) --[[ Line: 1644 ]]
		-- upvalues: CommentsStore (copy)
		local DataResult = CommentsStore.getCachedComment(p3).data(false)
		
		return if DataResult == nil or DataResult.author == nil then nil else DataResult.author.userId
	end
	
	local _ = function(List, UserId): boolean --[[ Line: 1652 | Named "containsCommentByAuthor" ]]
		-- upvalues: CommentsStore (copy)
		for _, value in List do
			local DataResult = CommentsStore.getCachedComment(value).data(false)
			
			if (if DataResult == nil or DataResult.author == nil then nil else DataResult.author.userId) == UserId then
				return true
			end
		end
		return false
	end
	
	local Effect = SignalsModule.createEffect(function(p3) --[[ Line: 1702 ]]
		-- upvalues: CommentsStore (copy), OwnerGeneration (ref), FFlagMomentsComments (upval), CommentPostedCallback (ref), v1 (ref), v2 (ref), EventNames (upval), AnalyticsSession (ref), T (ref), clearReactionState (copy), Callback1 (ref), Signal2 (copy), CollectionStore (copy)
		local OwnerGeneration1 = CommentsStore.getOwnerGeneration(p3)
		
		if OwnerGeneration1 == OwnerGeneration then return end
		OwnerGeneration = OwnerGeneration1
		
		if FFlagMomentsComments then
			CommentPostedCallback = nil
		end
		local v6 = v1
		v1 = nil
		
		if v6 ~= nil then
			local ActivePageRequest = v6.activePageRequest
			v6.activePageRequest = nil
			
			if ActivePageRequest ~= nil then
				ActivePageRequest.cancel()
			end
		end
		local ActivePageRequest1 = v2
		v2 = nil
		
		if ActivePageRequest1 ~= nil then
			if FFlagMomentsComments and ActivePageRequest1.analyticsSession ~= nil and ActivePageRequest1.ownerGeneration == CommentsStore.getOwnerGeneration(false) then
				ActivePageRequest1.analyticsSession.logEvent(EventNames.MomentCommentPostResult, { outcome = "cancelled", failureReason = "cancelled" })
			end
			ActivePageRequest1.cancel()
		end
		if FFlagMomentsComments then
			AnalyticsSession = nil
		end
		local T1 = T
		T = {}
		
		for _, value in T1 do
			value.cancel()
		end
		if FFlagMomentsComments then
			clearReactionState()
		end
		if FFlagMomentsComments then
			if Callback1 ~= nil then
				Callback1()
				Callback1 = nil
			end
			Signal2(0)
		end
		CollectionStore.clear()
	end)
	
	return {
		acquireSession = function(FeedItemId, SessionId) --[[ Line: 1528 ]]
			-- upvalues: Flag (ref), FFlagMomentsComments (upval), CatalogStore (copy), CommentsStore (copy), v1 (ref), CollectionStore (copy), CommentPostedCallback (ref), cancelActivePost (copy), AnalyticsSession (ref)
			if Flag then
				return function() --[[ Line: 1530 ]] end
			end
			if FFlagMomentsComments and CatalogStore ~= nil and CatalogStore.getAndFetchEmojiSets ~= nil then
				CatalogStore.getAndFetchEmojiSets()
			end
			local OwnerGeneration = CommentsStore.getOwnerGeneration(false)
			local v7 = v1
			
			if v7 == nil or v7.feedItemId ~= FeedItemId or v7.sessionId ~= SessionId or v7.ownerGeneration ~= OwnerGeneration then
				local IsOwnerGenerationMatch: boolean = v7 ~= nil and (v7.feedItemId == FeedItemId and v7.ownerGeneration == OwnerGeneration)
				
				if FFlagMomentsComments and not IsOwnerGenerationMatch then
					CommentPostedCallback = nil
				end
				local v8 = v1
				v1 = nil
				
				if v8 ~= nil then
					local ActivePageRequest = v8.activePageRequest
					v8.activePageRequest = nil
					
					if ActivePageRequest ~= nil then
						ActivePageRequest.cancel()
					end
				end
				cancelActivePost(IsOwnerGenerationMatch)
				
				if FFlagMomentsComments and not IsOwnerGenerationMatch then
					AnalyticsSession = nil
				end
				CollectionStore.selectFeed(FeedItemId, OwnerGeneration)
				v7 = {
					refCount = 0,
					activePageRequest = nil,
					initialLoadType = "initial",
					feedItemId = FeedItemId,
					sessionId = SessionId,
					ownerGeneration = OwnerGeneration,
					requestedCursors = {}
				}
				v1 = v7
				CollectionStore.beginListSession(FeedItemId)
			elseif v7.refCount == 0 then
				CollectionStore.resetListSession(FeedItemId)
			end
			v7.refCount += 1
			local Flag1 = false
			
			return function() --[[ Line: 1568 ]]
				-- upvalues: Flag1 (ref), v1 (upval), v7 (copy)
				if Flag1 then return end
				Flag1 = true
				local v9 = v1
				
				if v9 == nil or v9 ~= v7 then return end
				v9.refCount = math.max(0, v9.refCount - 1)
				
				if v9.refCount == 0 then
					local ActivePageRequest = v9.activePageRequest
					v9.activePageRequest = nil
					
					if ActivePageRequest ~= nil then
						ActivePageRequest.cancel()
					end
				end
			end
		end,
		ensureInitialLoad = ensureInitialLoad,
		loadMore = loadMore,
		retryInitial = retryInitial,
		retryLoadMore = function(FeedItemId, SessionId) --[[ Line: 1625 ]]
			-- upvalues: v1 (ref), Flag (ref), CommentsStore (copy), CollectionStore (copy), LoadStatus (upval), retryInitial (copy), Callback2 (ref)
			local v7 = v1
			local v8 = if Flag or v7 == nil or v7.feedItemId ~= FeedItemId or v7.sessionId ~= SessionId or v7.ownerGeneration ~= CommentsStore.getOwnerGeneration(false) or v7.refCount == 0 then nil else v7
			
			if v8 == nil then
				return false
			else
				local v9 = CollectionStore.getState(FeedItemId)(false)
				
				return v9.hasMore == true and v9.initialLoadStatus ~= LoadStatus.Loading and v9.loadMoreStatus ~= LoadStatus.Loading and (if v9.nextCursor == nil or v8.requestedCursors[v9.nextCursor or "<initial>"] == true then retryInitial(FeedItemId, SessionId) else Callback2(FeedItemId, SessionId, "more", v9.nextCursor))
			end
		end,
		submitComment = function(FeedItemId, SessionId, p4) --[[ Line: 1314 ]]
			-- upvalues: v1 (ref), Flag (ref), CommentsStore (copy), v2 (ref), CollectionStore (copy), FFlagMomentsComments (upval), Signal (copy), NowMs (copy), Callback1 (ref), Signal2 (copy), p1 (copy), AnalyticsSession (ref), CommentPostedCallback (ref), startPendingPost (copy)
			local v7 = v1
			local v8 = if Flag or v7 == nil or v7.feedItemId ~= FeedItemId or v7.sessionId ~= SessionId or v7.ownerGeneration ~= CommentsStore.getOwnerGeneration(false) or v7.refCount == 0 then nil else v7
			
			if v8 == nil or v2 ~= nil or CollectionStore.getPendingSubmission(FeedItemId) ~= nil then
				return false
			end
			if FFlagMomentsComments then
				local SignalResult = Signal(false)
				local Flag1 = nil
				
				if SignalResult == 0 then
					Flag1 = false
				elseif NowMs() < SignalResult then
					Flag1 = true
				else
					if Callback1 ~= nil then
						Callback1()
						Callback1 = nil
					end
					Signal2(0)
					Flag1 = false
				end
				if Flag1 then
					return false
				end
			end
			local BeginPendingSubmissionResult = CollectionStore.beginPendingSubmission(FeedItemId, p4)
			local PendingSubmission = CollectionStore.getPendingSubmission(FeedItemId)
			
			if PendingSubmission == nil or PendingSubmission.clientRequestId ~= BeginPendingSubmissionResult then
				return false
			end
			if FFlagMomentsComments and p1.getAnalyticsSession ~= nil then
				AnalyticsSession = p1.getAnalyticsSession(FeedItemId, SessionId)
			end
			if FFlagMomentsComments and p1.getCommentPostedCallback ~= nil then
				CommentPostedCallback = p1.getCommentPostedCallback(FeedItemId, SessionId)
			end
			return (startPendingPost(v8, FeedItemId, SessionId, PendingSubmission))
		end,
		retryPendingSubmission = function(FeedItemId, SessionId) --[[ Line: 1338 ]]
			-- upvalues: v1 (ref), Flag (ref), CommentsStore (copy), v2 (ref), CollectionStore (copy), FFlagMomentsComments (upval), Signal (copy), NowMs (copy), Callback1 (ref), Signal2 (copy), startPendingPost (copy)
			local v7 = v1
			local v8 = if Flag or v7 == nil or v7.feedItemId ~= FeedItemId or v7.sessionId ~= SessionId or v7.ownerGeneration ~= CommentsStore.getOwnerGeneration(false) or v7.refCount == 0 then nil else v7
			
			if v8 == nil or v2 ~= nil then
				return false
			end
			local PendingSubmission = CollectionStore.getPendingSubmission(FeedItemId)
			
			if PendingSubmission == nil or PendingSubmission.status ~= "OutcomeUnknown" then
				return false
			end
			if FFlagMomentsComments then
				local SignalResult = Signal(false)
				local Flag1 = nil
				
				if SignalResult == 0 then
					Flag1 = false
				elseif NowMs() < SignalResult then
					Flag1 = true
				else
					if Callback1 ~= nil then
						Callback1()
						Callback1 = nil
					end
					Signal2(0)
					Flag1 = false
				end
				if Flag1 then
					return false
				end
			end
			CollectionStore.markPendingSending(FeedItemId)
			local PendingSubmission1 = CollectionStore.getPendingSubmission(FeedItemId)
			
			return PendingSubmission1 ~= nil and PendingSubmission1.clientRequestId == PendingSubmission.clientRequestId and startPendingPost(v8, FeedItemId, SessionId, PendingSubmission1, true)
		end,
		editPendingSubmission = function(FeedItemId, SessionId): boolean --[[ Line: 1361 ]]
			-- upvalues: v1 (ref), Flag (ref), CommentsStore (copy), v2 (ref), CollectionStore (copy)
			local v7 = v1
			
			if (if Flag or v7 == nil or v7.feedItemId ~= FeedItemId or v7.sessionId ~= SessionId or v7.ownerGeneration ~= CommentsStore.getOwnerGeneration(false) or v7.refCount == 0 then nil else v7) == nil or v2 ~= nil then
				return false
			end
			local PendingSubmission = CollectionStore.getPendingSubmission(FeedItemId)
			
			if PendingSubmission == nil or PendingSubmission.status ~= "OutcomeUnknown" then
				return false
			else
				CollectionStore.rejectPendingSubmission(FeedItemId, "SubmissionOutcomeUnknown")
				
				return true
			end
		end,
		getPostCooldownUntilMs = Signal,
		ensureReactionPresent = if FFlagMomentsComments then ensureReactionPresent else rejectReactionMutation,
		ensureReactionAbsent = if FFlagMomentsComments then ensureReactionAbsent else rejectReactionMutation,
		clearReactionState = if FFlagMomentsComments then clearReactionState else noOp,
		deleteComment = function(FeedItemId, Key, Callback1, Callback2): boolean --[[ Line: 1411 ]]
			-- upvalues: Flag (ref), T (ref), CommentsStore (copy), FFlagMomentsComments (upval), p1 (copy), v1 (ref), FFlagMomentsCommentActionsRealtimeModule (upval), DeleteComment (copy), observeRequest (upval), MomentsCommentsModule (upval), ReadStatusCode (copy), GetCommentsFailureReasonModule (upval), removeDeletedComment (copy)
			if Flag or T[Key] ~= nil then
				return false
			end
			local OwnerGeneration = CommentsStore.getOwnerGeneration(false)
			local Callback = nil
			
			if FFlagMomentsComments and p1.getCommentDeletedCallback ~= nil then
				local v7 = v1
				
				if v7 ~= nil and v7.feedItemId == FeedItemId then
					Callback = p1.getCommentDeletedCallback(FeedItemId, v7.sessionId)
				end
			end
			local AnalyticsSession = nil
			
			if FFlagMomentsCommentActionsRealtimeModule then
				local v8 = v1
				AnalyticsSession = if p1.getAnalyticsSession == nil or v8 == nil or v8.feedItemId ~= FeedItemId then nil else p1.getAnalyticsSession(FeedItemId, v8.sessionId)
			end
			local DeleteCommentResult = DeleteComment(FeedItemId, Key, p1.network)
			
			if FFlagMomentsCommentActionsRealtimeModule and AnalyticsSession ~= nil then
				AnalyticsSession.logRealtimeEvent("MomentsCommentDelete", { status = "attempted" })
			end
			local config = { cancel = function() --[[ Line: 1438 ]] end }
			T[Key] = config
			config.cancel = observeRequest(DeleteCommentResult, function(p4) --[[ Line: 1441 ]]
				-- upvalues: T (upval), Key (copy), config (copy), Flag (upval), CommentsStore (upval), OwnerGeneration (copy), MomentsCommentsModule (upval), ReadStatusCode (upval), FFlagMomentsCommentActionsRealtimeModule (upval), AnalyticsSession (ref), GetCommentsFailureReasonModule (upval), removeDeletedComment (upval), FeedItemId (copy), FFlagMomentsComments (upval), Callback2 (copy), Callback1 (copy), Callback (ref)
				if T[Key] ~= config then return end
				T[Key] = nil
				
				if Flag or CommentsStore.getOwnerGeneration(false) ~= OwnerGeneration then return end
				local ParseCommentsErrorResult = MomentsCommentsModule.parseCommentsError(p4.error)
				local IsStatusCodeMatch: boolean = ReadStatusCode(p4, nil) == 404 or ParseCommentsErrorResult ~= nil and ParseCommentsErrorResult.errorCode == "CommentNotFound"
				
				if FFlagMomentsCommentActionsRealtimeModule and AnalyticsSession ~= nil then
					if p4.status == "succeeded" then
						AnalyticsSession.logRealtimeEvent("MomentsCommentDelete", { status = "succeeded" })
					elseif IsStatusCodeMatch then
						AnalyticsSession.logRealtimeEvent("MomentsCommentDelete", { status = "already_deleted" })
					else
						local ParseCommentsErrorResult1 = MomentsCommentsModule.parseCommentsError(p4.error)
						AnalyticsSession.logRealtimeEvent("MomentsCommentDelete", {
							status = "failed",
							failureReason = GetCommentsFailureReasonModule(if ParseCommentsErrorResult1 == nil then "CommentsUnavailable" else ParseCommentsErrorResult1.errorCode, ReadStatusCode(p4, nil))
						})
					end
				end
				if p4.status == "succeeded" or IsStatusCodeMatch then
					removeDeletedComment(FeedItemId, Key, OwnerGeneration)
					
					if FFlagMomentsComments and p4.status == "succeeded" and Callback2 ~= nil then
						Callback2()
					end
				elseif Callback1 ~= nil then
					Callback1()
				end
				if FFlagMomentsComments and p4.status == "succeeded" and Callback ~= nil then
					Callback()
				end
			end)
			
			return true
		end,
		hideCommentsByAuthor = function(p4, UserId) --[[ Line: 1661 ]]
			-- upvalues: Flag (ref), SessionFilters (copy), CollectionStore (copy), CommentsStore (copy), resolveCommentAuthor (copy), v1 (ref), loadMore (copy)
			if Flag then return end
			if SessionFilters ~= nil then
				SessionFilters.markAuthorRecentlyBlocked(UserId)
			end
			local v7 = CollectionStore.getState(p4)(false)
			local Flag1 = false
			
			for _, orderedCommentId in v7.orderedCommentIds do
				local DataResult = CommentsStore.getCachedComment(orderedCommentId).data(false)
				
				if (if DataResult == nil or DataResult.author == nil then nil else DataResult.author.userId) == UserId then
					Flag1 = true
					break
				end
			end
			if not Flag1 then
				local Flag2 = false
				
				for _, stickyPostedCommentId in v7.stickyPostedCommentIds do
					local DataResult = CommentsStore.getCachedComment(stickyPostedCommentId).data(false)
					
					if (if DataResult == nil or DataResult.author == nil then nil else DataResult.author.userId) == UserId then
						Flag2 = true
						break
					end
				end
				if not Flag2 then return end
			end
			CollectionStore.removeCommentIdsByAuthor(p4, UserId, resolveCommentAuthor)
			local v8 = v1
			
			if v8 ~= nil and #CollectionStore.getState(p4)(false).orderedCommentIds == 0 then
				loadMore(p4, v8.sessionId)
			end
		end,
		restoreCommentsByAuthor = function(FeedItemId, p5) --[[ Line: 1685 ]]
			-- upvalues: Flag (ref), SessionFilters (copy), v1 (ref), retryInitial (copy)
			if Flag then return end
			if SessionFilters ~= nil then
				if not SessionFilters.isAuthorRecentlyBlocked(p5) then return end
				SessionFilters.unmarkAuthorRecentlyBlocked(p5)
			end
			local v9 = v1
			
			if v9 ~= nil then
				retryInitial(FeedItemId, v9.sessionId)
			end
		end,
		dispose = function() --[[ Line: 1719 ]]
			-- upvalues: Flag (ref), Effect (copy), FFlagMomentsComments (upval), CommentPostedCallback (ref), v1 (ref), v2 (ref), CommentsStore (copy), EventNames (upval), AnalyticsSession (ref), T (ref), clearReactionState (copy), Callback1 (ref), Signal2 (copy), CollectionStore (copy)
			if Flag then return end
			Flag = true
			Effect()
			
			if FFlagMomentsComments then
				CommentPostedCallback = nil
			end
			local v9 = v1
			v1 = nil
			
			if v9 ~= nil then
				local ActivePageRequest = v9.activePageRequest
				v9.activePageRequest = nil
				
				if ActivePageRequest ~= nil then
					ActivePageRequest.cancel()
				end
			end
			local ActivePageRequest1 = v2
			v2 = nil
			
			if ActivePageRequest1 ~= nil then
				if FFlagMomentsComments and ActivePageRequest1.analyticsSession ~= nil and ActivePageRequest1.ownerGeneration == CommentsStore.getOwnerGeneration(false) then
					ActivePageRequest1.analyticsSession.logEvent(EventNames.MomentCommentPostResult, { outcome = "cancelled", failureReason = "cancelled" })
				end
				ActivePageRequest1.cancel()
			end
			if FFlagMomentsComments then
				AnalyticsSession = nil
			end
			local T1 = T
			T = {}
			
			for _, value in T1 do
				value.cancel()
			end
			if FFlagMomentsComments then
				clearReactionState()
			end
			if FFlagMomentsComments then
				if Callback1 ~= nil then
					Callback1()
					Callback1 = nil
				end
				Signal2(0)
			end
			CollectionStore.clear()
		end
	}
end