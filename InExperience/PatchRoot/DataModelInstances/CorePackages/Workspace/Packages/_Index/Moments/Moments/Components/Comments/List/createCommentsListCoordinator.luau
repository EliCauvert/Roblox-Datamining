local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.HttpClient)
local eventNames = require(parent.MomentsCommon).Analytics.EventNames
local _ = require(moments.Components.Comments.createCommentsAnalyticsSession)
local getCommentsFailureReasonModule = require(moments.Analytics.getCommentsFailureReason)
local momentsCommentsModule = require(parent.DataHydration.MomentsComments)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local _ = require(parent.MomentsTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local signalsExperimentalModule = require(parent.SignalsExperimental)
local _ = require(moments.Components.Comments.GetCommentCollectionStore.createCommentCollectionStore)
local _ = require(moments.Components.Comments.GetCommentSessionFiltersStore.createCommentSessionFiltersStore)
local fFlagMomentsComments = sharedFlagsModule.FFlagMomentsComments
local fFlagMomentsCommentRecommendationTextModule = require(moments.Flags.FFlagMomentsCommentRecommendationText)
local _ = require(moments.Stores.GetCommentReactionsStore.createCommentReactionsStore)
local loadStatus = require(moments.Components.Comments.GetCommentCollectionStore.CommentCollectionTypes).LoadStatus
local list = { 250, 500 }
local t = {
	AuthenticationRequired = true,
	CommentsEndpointDisabled = true,
	ViewerNotEligibleToReact = true
}
local t_1 = {
	CommentsDisabledByCreator = true,
	MomentUnavailable = true,
	ViewerNotEligibleToRead = true
}
local t_2 = {
	CommentsDisabledByCreator = true,
	MomentNotFound = true,
	MomentNotVisible = true,
	ViewerNotEligibleToRead = true,
	ViewerNotEligibleToWrite = true
}
local t_3 = {
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

local function _(p1)
	return p1 or "<initial>"
end

local function defaultSchedule(p1, p2)
	local delayedThread = task.delay(p1 / 1000, p2)
	
	return function()
		-- upvalues: delayedThread (ref)
		pcall(task.cancel, delayedThread)
	end
end

local function defaultReadStatusCode(p1, p2)
	return if p2 == nil then if p1.response == nil then p1.errorCode else p1.response.statusCode else p2
end

local function defaultReadRetryAfter(p1)
	return if p1.headers == nil then nil else p1.headers["retry-after"] or p1.headers["Retry-After"]
end

local function parseHttpDateMs(p1)
	-- upvalues: t_3 (ref)
	local match, match_1, match_2, match_3, match_4, match_5 = string.match(p1, "^%a%a%a, (%d%d) (%a%a%a) (%d%d%d%d) (%d%d):(%d%d):(%d%d) GMT$")
	local var1 = if match_1 ~= nil then nil else t_3[match_1]
	
	if match == nil or var1 == nil or (match_2 == nil or match_3 == nil) or (match_4 == nil or match_5 == nil) then
		return nil
	end
	local ok, status = pcall(DateTime.fromUniversalTime, tonumber(match_2), var1, tonumber(match), tonumber(match_3), tonumber(match_4), tonumber(match_5))
	
	return if ok then status.UnixTimestampMillis else nil
end

local _ = function(p1, p2)
	-- upvalues: parseHttpDateMs (ref)
	if p1 == nil then
		return 5000
	end
	local var1 = tonumber(p1)
	local var2 = if var1 ~= nil then nil else var1 * 1000
	
	if var2 == nil then
		local var3 = parseHttpDateMs(p1)
		var2 = if var3 ~= nil then nil else math.max(0, var3 - p2)
	end
	return if var2 == nil or var2 < 0 or var2 > 60000 then 5000 else var2
end

local _ = function(p1, p2)
	return if p2 == "CommentsUnavailable" then nil elseif p2 == nil then if p1 == nil or p1 == 408 or (p1 < 400 or p1 >= 500) then nil elseif p1 == 429 then "RateLimited" elseif p1 == 401 then "AuthenticationRequired" else "PostRejected" else p2
end

local _ = function(p1)
	return if p1 == nil or p1.userReaction == nil then nil else p1.userReaction.emoteId
end

local _ = function(p1)
	return if p1 ~= nil then if p1 ~= 408 then p1 ~= nil and (p1 >= 500 and p1 <= 599) else true else true
end

local _ = function(p1)
	-- upvalues: momentsCommentsModule (ref)
	local var1 = momentsCommentsModule.parseCommentsError(p1.error)
	
	return if var1 == nil then "CommentsUnavailable" else var1.errorCode
end

local function observeRequest(p1, p2)
	-- upvalues: signalsModule (ref)
	local var1 = false
	local var2 = nil
	
	local function stop()
		-- upvalues: var1 (write), var2 (write), p1 (ref)
		if var1 then return end
		var1 = true
		
		if var2 ~= nil then
			var2()
			var2 = nil
		end
		p1.dispose()
	end
	
	local function _(value)
		-- upvalues: var1 (write), var2 (write), p1 (ref), p2 (ref)
		if var1 or value.status == "pending" then return end
		var1 = true
		
		if var2 ~= nil then
			var2()
			var2 = nil
		end
		p1.dispose()
		p2(value)
	end
	
	local var3 = p1.state(false)
	
	if var3.status == "pending" then
		var2 = signalsModule.createEffect(function(p3)
			-- upvalues: p1 (ref), var1 (write), var2 (write), p2 (ref)
			local var4 = p1.state(p3)
			
			if not var1 then
				if var4.status == "pending" then return end
				var1 = true
				
				if var2 ~= nil then
					var2()
					var2 = nil
				end
				p1.dispose()
				p2(var4)
			end
		end)
		
		if var1 and var2 ~= nil then
			var2()
			var2 = nil
		end
		return stop
	elseif var3.status ~= "pending" then
		var1 = true
		
		if var2 ~= nil then
			var2()
			var2 = nil
		end
		p1.dispose()
		p2(var3)
	end
	return stop
end

local function rejectReactionMutation(_, _, _, _)
	return false
end

local function noOp() end

return function(p1)
	-- upvalues: momentsCommentsModule (ref), defaultSchedule (ref), defaultReadStatusCode (ref), defaultReadRetryAfter (ref), signalsModule (ref), parseHttpDateMs (ref), loadStatus (ref), signalsExperimentalModule (ref), t (ref), t_2 (ref), observeRequest (ref), list (ref), fFlagMomentsComments (ref), eventNames (ref), getCommentsFailureReasonModule (ref), fFlagMomentsCommentRecommendationTextModule (ref), t_1 (ref), rejectReactionMutation (ref), noOp (ref)
	local collectionStore = p1.collectionStore
	local commentsStore = p1.commentsStore
	local reactionStore = p1.reactionStore
	local catalogStore = p1.catalogStore
	local fetchPage = p1.fetchPage or momentsCommentsModule.fetchMomentComments
	local postComment = p1.postComment or momentsCommentsModule.postMomentComment
	local putReaction = p1.putReaction or momentsCommentsModule.putMomentCommentReaction
	local deleteReaction = p1.deleteReaction or momentsCommentsModule.deleteMomentCommentReaction
	local deleteComment = p1.deleteComment or momentsCommentsModule.deleteMomentComment
	local sessionFilters = p1.sessionFilters
	local nowMs = p1.nowMs or function()
		return DateTime.now().UnixTimestampMillis
	end
	local schedule = p1.schedule or defaultSchedule
	local readStatusCode = p1.readStatusCode or defaultReadStatusCode
	local readRetryAfter = p1.readRetryAfter or defaultReadRetryAfter
	local reactionDebounceMs = p1.reactionDebounceMs or 500
	local var1 = nil
	local var2 = nil
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local t_6 = {}
	local var3 = nil
	local var4, var5 = signalsModule.createSignal(0)
	local var6 = nil
	local ownerGeneration = commentsStore.getOwnerGeneration(false)
	local var7 = false
	local var8 = nil
	local var9 = nil
	
	local function _(p2)
		local activePageRequest = p2.activePageRequest
		p2.activePageRequest = nil
		
		if activePageRequest ~= nil then
			activePageRequest.cancel()
		end
	end
	
	local _ = function(p2, p3)
		-- upvalues: var1 (write), var7 (write), commentsStore (ref)
		return if var7 or var1 == nil or (var1.feedItemId ~= p2 or var1.sessionId ~= p3) or (var1.ownerGeneration ~= commentsStore.getOwnerGeneration(false) or var1.refCount == 0) then nil else var1
	end
	
	local _ = function(p2, p3, p4, p5)
		-- upvalues: var7 (write), var1 (write), commentsStore (ref)
		return not var7 and (var1 == p2 and (p2.feedItemId == p3 and (p2.sessionId == p4 and (p2.ownerGeneration == p5 and commentsStore.getOwnerGeneration(false) == p5))))
	end
	
	local _ = function(p2)
		-- upvalues: t_5 (ref)
		local var10 = t_5[p2]
		t_5[p2] = nil
		
		if var10 ~= nil then
			var10()
		end
	end
	
	local _ = function(p2, p3)
		-- upvalues: t_5 (ref), schedule (ref), reactionStore (ref), t_6 (ref)
		local var10 = t_5[p2]
		t_5[p2] = nil
		
		if var10 ~= nil then
			var10()
		end
		t_5[p2] = schedule(10000, function()
			-- upvalues: t_5 (copy), p2 (ref), reactionStore (copy), p3 (ref), t_6 (copy)
			t_5[p2] = nil
			
			if reactionStore.expireIntent(p2, p3) then
				t_6[p2] = nil
			end
		end)
	end
	
	local function cancelReactionRequest(p2)
		-- upvalues: t_3 (ref)
		local var10 = t_3[p2]
		t_3[p2] = nil
		
		if var10 == nil then return end
		if var10.cancelRequest ~= nil then
			var10.cancelRequest()
			var10.cancelRequest = nil
		end
		if var10.cancelRetry ~= nil then
			var10.cancelRetry()
			var10.cancelRetry = nil
		end
		if var10.cancelDebounce ~= nil then
			var10.cancelDebounce()
			var10.cancelDebounce = nil
		end
	end
	
	local _ = function(value, p2, p3, p4)
		-- upvalues: cancelReactionRequest (ref), t_5 (ref), t_6 (ref), reactionStore (ref)
		cancelReactionRequest(p2)
		local var10 = t_5[p2]
		t_5[p2] = nil
		
		if var10 ~= nil then
			var10()
		end
		t_6[p2] = nil
		reactionStore.clearComment(p2)
		
		if p3 ~= nil then
			reactionStore.setCommentRestriction(value, p2, p3, p4)
		end
	end
	
	local function clearReactionState()
		-- upvalues: t_3 (ref), cancelReactionRequest (ref), t_5 (ref), var3 (write), t_6 (ref), reactionStore (ref)
		local t = {}
		
		for i in t_3 do
			table.insert(t, i)
		end
		for i_1, v in t do
			cancelReactionRequest(v)
		end
		local t_1 = {}
		
		for i_2 in t_5 do
			table.insert(t_1, i_2)
		end
		for i_3, v_1 in t_1 do
			local var10 = t_5[v_1]
			t_5[v_1] = nil
			
			if var10 ~= nil then
				var10()
			end
		end
		if var3 ~= nil then
			var3()
			var3 = nil
		end
		table.clear(t_6)
		reactionStore.clear()
	end
	
	local function clearReactionsForFeed(p2, p3)
		-- upvalues: t_6 (ref), cancelReactionRequest (ref), t_5 (ref), reactionStore (ref)
		local t = {}
		
		for i, v in t_6 do
			if v == p2 then
				table.insert(t, i)
			end
		end
		for i_1, v_1 in t do
			cancelReactionRequest(v_1)
			local var11 = t_5[v_1]
			t_5[v_1] = nil
			
			if var11 ~= nil then
				var11()
			end
			t_6[v_1] = nil
		end
		reactionStore.clearFeed(p2)
		reactionStore.setFeedRestriction(p2, p3)
	end
	
	local function setReactionCooldown(value)
		-- upvalues: nowMs (ref), reactionStore (ref), parseHttpDateMs (copy), var3 (write), schedule (ref)
		local var12
		local var13 = nowMs()
		local cooldownUntilMs = reactionStore.getCooldownUntilMs(false)
		
		if value == nil then
			var12 = 5000
		else
			local var14 = tonumber(value)
			local var15 = if var14 ~= nil then nil else var14 * 1000
			
			if var15 == nil then
				local var16 = parseHttpDateMs(value)
				var15 = if var16 ~= nil then nil else math.max(0, var16 - var13)
			end
			var12 = if var15 == nil or var15 < 0 or var15 > 60000 then 5000 else var15
		end
		local maxValue = math.max(cooldownUntilMs, var13 + var12)
		reactionStore.setCooldownUntilMs(maxValue)
		
		if var3 ~= nil then
			var3()
		end
		var3 = schedule(math.max(0, maxValue - var13), function()
			-- upvalues: var3 (copy), reactionStore (copy), maxValue (ref)
			var3 = nil
			
			if reactionStore.getCooldownUntilMs(false) == maxValue then
				reactionStore.setCooldownUntilMs(0)
			end
		end)
	end
	
	local _ = function()
		-- upvalues: var6 (write), var5 (ref)
		if var6 ~= nil then
			var6()
			var6 = nil
		end
		var5(0)
	end
	
	local function setPostCooldown(value)
		-- upvalues: nowMs (ref), var4 (ref), parseHttpDateMs (copy), var5 (ref), var6 (write), schedule (ref)
		local var12
		local var13 = nowMs()
		local var14 = var4(false)
		
		if value == nil then
			var12 = 5000
		else
			local var15 = tonumber(value)
			local var16 = if var15 ~= nil then nil else var15 * 1000
			
			if var16 == nil then
				local var17 = parseHttpDateMs(value)
				var16 = if var17 ~= nil then nil else math.max(0, var17 - var13)
			end
			var12 = if var16 == nil or var16 < 0 or var16 > 60000 then 5000 else var16
		end
		local maxValue = math.max(var14, var13 + var12)
		var5(maxValue)
		
		if var6 ~= nil then
			var6()
		end
		var6 = schedule(math.max(0, maxValue - var13), function()
			-- upvalues: var6 (copy), var4 (copy), maxValue (ref), var5 (copy)
			var6 = nil
			
			if var4(false) == maxValue then
				var5(0)
			end
		end)
	end
	
	local _ = function()
		-- upvalues: var4 (ref), nowMs (ref), var6 (write), var5 (ref)
		local var12 = var4(false)
		
		if var12 == 0 then
			return false
		elseif nowMs() < var12 then
			return true
		elseif var6 ~= nil then
			var6()
			var6 = nil
		end
		var5(0)
		
		return false
	end
	
	local function markFeedUnavailable(p4, p5)
		-- upvalues: var1 (write), commentsStore (ref), collectionStore (ref), loadStatus (copy)
		if var1 == nil or var1.feedItemId ~= p4 or var1.ownerGeneration ~= commentsStore.getOwnerGeneration(false) then return end
		local activePageRequest = var1.activePageRequest
		var1.activePageRequest = nil
		
		if activePageRequest ~= nil then
			activePageRequest.cancel()
		end
		collectionStore.failLoad(p4, if collectionStore.getState(p4)(false).initialLoadStatus == loadStatus.Success then "more" else "initial", p5)
	end
	
	local function commitProjectedReaction(p4)
		-- upvalues: reactionStore (ref), commentsStore (ref), signalsExperimentalModule (copy)
		local intent = reactionStore.getIntent(p4.commentId, false)
		
		if intent == nil or intent.generation ~= p4.generation then
			return false
		end
		local var12 = commentsStore.getCachedComment(p4.commentId).data(false)
		
		if var12 == nil then
			return reactionStore.markLocallyConfirmed(p4.commentId, p4.generation)
		end
		local reactions = reactionStore.getProjection(p4.feedItemId, p4.commentId, var12.reactions, false).reactions
		
		if reactions == nil then
			return reactionStore.markLocallyConfirmed(p4.commentId, p4.generation)
		end
		local cloned = table.clone(var12)
		cloned.reactions = reactions
		local var13 = false
		signalsExperimentalModule.batch(function()
			-- upvalues: commentsStore (copy), cloned (ref), p4 (ref), var13 (write), reactionStore (copy), reactions (ref)
			commentsStore.upsertComments({ cloned }, p4.ownerGeneration)
			var13 = reactionStore.confirmAndRebase(p4.commentId, p4.generation, reactions)
		end)
		
		return var13
	end
	
	local _ = function(p4)
		-- upvalues: t_3 (ref), reactionStore (ref), t_5 (ref), schedule (ref), t_6 (ref)
		t_3[p4.commentId] = nil
		p4.cancelRetry = nil
		reactionStore.markUncertain(p4.commentId, p4.generation)
		local commentId = p4.commentId
		local generation = p4.generation
		local var12 = t_5[commentId]
		t_5[commentId] = nil
		
		if var12 ~= nil then
			var12()
		end
		t_5[commentId] = schedule(10000, function()
			-- upvalues: t_5 (copy), commentId (ref), reactionStore (copy), generation (ref), t_6 (copy)
			t_5[commentId] = nil
			
			if reactionStore.expireIntent(commentId, generation) then
				t_6[commentId] = nil
			end
		end)
	end
	
	local function rollbackReaction(p4, p5)
		-- upvalues: t_5 (ref), reactionStore (ref), t_6 (ref), schedule (ref)
		local commentId = p4.commentId
		local var12 = t_5[commentId]
		t_5[commentId] = nil
		
		if var12 ~= nil then
			var12()
		end
		if not reactionStore.rollback(p4.commentId, p4.generation, p5) then return end
		local intent = reactionStore.getIntent(p4.commentId, false)
		
		if intent == nil or intent.status ~= "LocallyConfirmed" then
			t_6[p4.commentId] = nil
			
			return
		end
		t_6[p4.commentId] = p4.feedItemId
		local commentId_1 = p4.commentId
		local generation = intent.generation
		local var13 = t_5[commentId_1]
		t_5[commentId_1] = nil
		
		if var13 ~= nil then
			var13()
		end
		t_5[commentId_1] = schedule(10000, function()
			-- upvalues: t_5 (copy), commentId_1 (ref), reactionStore (copy), generation (ref), t_6 (copy)
			t_5[commentId_1] = nil
			
			if reactionStore.expireIntent(commentId_1, generation) then
				t_6[commentId_1] = nil
			end
		end)
	end
	
	local function applyTerminalFailure(a, b, p4)
		-- upvalues: clearReactionsForFeed (ref), markFeedUnavailable (ref), t (copy), clearReactionState (ref), reactionStore (ref), t_2 (copy), cancelReactionRequest (ref), t_5 (ref), t_6 (ref), rollbackReaction (ref)
		if p4 == "MomentUnavailable" then
			clearReactionsForFeed(a.feedItemId, p4)
			markFeedUnavailable(a.feedItemId, p4)
			
			return
		elseif t[p4] then
			clearReactionState()
			reactionStore.setGlobalRestriction(p4)
			
			return
		elseif t_2[p4] then
			clearReactionsForFeed(a.feedItemId, p4)
			
			return
		elseif p4 == "CommentNotFound" or b == 404 then
			local feedItemId = a.feedItemId
			local commentId = a.commentId
			local generation = a.generation
			cancelReactionRequest(commentId)
			local var12 = t_5[commentId]
			t_5[commentId] = nil
			
			if var12 ~= nil then
				var12()
			end
			t_6[commentId] = nil
			reactionStore.clearComment(commentId)
			
			if p4 == nil then
				return
			else
				reactionStore.setCommentRestriction(feedItemId, commentId, p4, generation)
				
				return
			end
		else
			rollbackReaction(a, p4)
		end
	end
	
	local _ = nil
	
	local var12 = function(p4)
		-- upvalues: var7 (write), t_3 (ref), commentsStore (ref), reactionStore (ref), rollbackReaction (ref), nowMs (ref), schedule (ref), var12 (write), t_5 (ref), t_6 (ref), readRetryAfter (ref), putReaction (ref), deleteReaction (ref), p1 (ref), observeRequest (copy), commitProjectedReaction (ref), readStatusCode (ref), momentsCommentsModule (copy), setReactionCooldown (ref), list (copy), applyTerminalFailure (ref)
		if var7 or t_3[p4.commentId] ~= p4 or (commentsStore.getOwnerGeneration(false) ~= p4.ownerGeneration or reactionStore.getIntent(p4.commentId, false) == nil) then return end
		if not p4.syncIsUncertain and p4.desiredEmoteId == p4.syncedEmoteId then
			t_3[p4.commentId] = nil
			rollbackReaction(p4, nil)
			
			return
		end
		local var13 = nowMs()
		local cooldownUntilMs = reactionStore.getCooldownUntilMs(false)
		
		if var13 < cooldownUntilMs then
			reactionStore.markUncertain(p4.commentId, p4.generation)
			local var14 = cooldownUntilMs - var13
			
			if var13 - p4.startedAtMs + var14 <= 2000 then
				p4.cancelRetry = schedule(var14, function()
					-- upvalues: p4 (ref), var12 (copy)
					p4.cancelRetry = nil
					var12(p4)
				end)
				
				return
			end
			t_3[p4.commentId] = nil
			p4.cancelRetry = nil
			reactionStore.markUncertain(p4.commentId, p4.generation)
			local commentId = p4.commentId
			local generation = p4.generation
			local var15 = t_5[commentId]
			t_5[commentId] = nil
			
			if var15 ~= nil then
				var15()
			end
			t_5[commentId] = schedule(10000, function()
				-- upvalues: t_5 (copy), commentId (ref), reactionStore (copy), generation (ref), t_6 (copy)
				t_5[commentId] = nil
				
				if reactionStore.expireIntent(commentId, generation) then
					t_6[commentId] = nil
				end
			end)
			
			return
		elseif cooldownUntilMs > 0 then
			reactionStore.setCooldownUntilMs(0)
		end
		if p4.attemptGeneration ~= p4.generation then
			p4.attemptGeneration = p4.generation
			p4.attempt = 0
			p4.startedAtMs = var13
		end
		if p4.attempt > 0 and var13 - p4.startedAtMs > 2000 then
			t_3[p4.commentId] = nil
			p4.cancelRetry = nil
			reactionStore.markUncertain(p4.commentId, p4.generation)
			local commentId = p4.commentId
			local generation = p4.generation
			local var16 = t_5[commentId]
			t_5[commentId] = nil
			
			if var16 ~= nil then
				var16()
			end
			t_5[commentId] = schedule(10000, function()
				-- upvalues: t_5 (copy), commentId (ref), reactionStore (copy), generation (ref), t_6 (copy)
				t_5[commentId] = nil
				
				if reactionStore.expireIntent(commentId, generation) then
					t_6[commentId] = nil
				end
			end)
			
			return
		else
			p4.attempt += 1
			
			if reactionStore.markPending(p4.commentId, p4.generation) then
				p4.readyToCommit = false
				local generation = p4.generation
				local desiredEmoteId = p4.desiredEmoteId
				local verb = p4.verb
				local var17 = nil
				local var18 = nil
				p4.cancelRequest = observeRequest((if verb == "PUT" then putReaction else deleteReaction)(p4.feedItemId, p4.commentId, p4.emoteId, p1.network, {
					[429] = {
						function(p5)
							-- upvalues: var17 (write), var18 (write), readRetryAfter (copy)
							var17 = p5.statusCode
							var18 = readRetryAfter(p5)
						end
					}
				}), function(p5)
					-- upvalues: var7 (copy), t_3 (copy), p4 (ref), commentsStore (copy), desiredEmoteId (ref), generation (ref), commitProjectedReaction (copy), t_5 (copy), schedule (copy), reactionStore (copy), t_6 (copy), var12 (copy), readStatusCode (copy), var17 (write), momentsCommentsModule (copy), rollbackReaction (copy), setReactionCooldown (copy), var18 (write), list (copy), nowMs (copy), applyTerminalFailure (copy)
					if var7 or t_3[p4.commentId] ~= p4 or commentsStore.getOwnerGeneration(false) ~= p4.ownerGeneration then return end
					p4.cancelRequest = nil
					
					if p5.status == "succeeded" then
						p4.syncedEmoteId = desiredEmoteId
						p4.syncIsUncertain = false
						
						if p4.generation == generation then
							t_3[p4.commentId] = nil
							
							if commitProjectedReaction(p4) then
								local commentId = p4.commentId
								local var19 = generation
								local var20 = t_5[commentId]
								t_5[commentId] = nil
								
								if var20 ~= nil then
									var20()
								end
								t_5[commentId] = schedule(10000, function()
									-- upvalues: t_5 (copy), commentId (ref), reactionStore (copy), var19 (ref), t_6 (copy)
									t_5[commentId] = nil
									
									if reactionStore.expireIntent(commentId, var19) then
										t_6[commentId] = nil
									end
								end)
							end
							return
						elseif p4.desiredEmoteId == p4.syncedEmoteId then
							t_3[p4.commentId] = nil
							
							if commitProjectedReaction(p4) then
								local commentId = p4.commentId
								local generation_1 = p4.generation
								local var21 = t_5[commentId]
								t_5[commentId] = nil
								
								if var21 ~= nil then
									var21()
								end
								t_5[commentId] = schedule(10000, function()
									-- upvalues: t_5 (copy), commentId (ref), reactionStore (copy), generation_1 (ref), t_6 (copy)
									t_5[commentId] = nil
									
									if reactionStore.expireIntent(commentId, generation_1) then
										t_6[commentId] = nil
									end
								end)
								
								return
							else
								return
							end
						elseif p4.readyToCommit then
							var12(p4)
						end
					else
						local var22 = readStatusCode(p5, var17)
						local var23 = momentsCommentsModule.parseCommentsError(p5.error)
						local var24 = if var23 ~= nil then "CommentsUnavailable" else var23.errorCode
						
						if var22 == 429 then
							t_3[p4.commentId] = nil
							rollbackReaction(p4, nil)
							setReactionCooldown(var18)
							
							return
						elseif not (if var22 ~= nil then if var22 ~= 408 then var22 ~= nil and (var22 >= 500 and var22 <= 599) else true else true) then
							t_3[p4.commentId] = nil
							applyTerminalFailure(p4, var22, var24)
							
							return
						end
						p4.syncIsUncertain = true
						
						if p4.generation == generation then
							reactionStore.markUncertain(p4.commentId, generation)
							local attempt = list[p4.attempt]
							
							if p4.attempt <= 2 and attempt ~= nil and nowMs() - p4.startedAtMs + attempt <= 2000 then
								p4.cancelRetry = schedule(attempt, function()
									-- upvalues: p4 (copy), t_3 (copy), commentsStore (copy), var12 (copy)
									p4.cancelRetry = nil
									
									if t_3[p4.commentId] == p4 and commentsStore.getOwnerGeneration(false) == p4.ownerGeneration then
										var12(p4)
									end
								end)
								
								return
							end
							local var25 = p4
							t_3[var25.commentId] = nil
							var25.cancelRetry = nil
							reactionStore.markUncertain(var25.commentId, var25.generation)
							local commentId = var25.commentId
							local generation_1 = var25.generation
							local var26 = t_5[commentId]
							t_5[commentId] = nil
							
							if var26 ~= nil then
								var26()
							end
							t_5[commentId] = schedule(10000, function()
								-- upvalues: t_5 (copy), commentId (ref), reactionStore (copy), generation_1 (ref), t_6 (copy)
								t_5[commentId] = nil
								
								if reactionStore.expireIntent(commentId, generation_1) then
									t_6[commentId] = nil
								end
							end)
							
							return
						elseif p4.readyToCommit then
							var12(p4)
						end
					end
				end)
				
				return
			end
			t_3[p4.commentId] = nil
		end
	end
	
	local function scheduleReactionCommit(p4)
		-- upvalues: reactionDebounceMs (ref), var12 (write), schedule (ref), var7 (write), t_3 (ref)
		if p4.cancelDebounce ~= nil then
			p4.cancelDebounce()
			p4.cancelDebounce = nil
		end
		p4.readyToCommit = false
		
		if reactionDebounceMs > 0 then
			p4.cancelDebounce = schedule(reactionDebounceMs, function()
				-- upvalues: p4 (ref), var7 (copy), t_3 (copy), var12 (copy)
				p4.cancelDebounce = nil
				
				if var7 or t_3[p4.commentId] ~= p4 then return end
				p4.readyToCommit = true
				
				if p4.cancelRequest == nil and p4.cancelRetry == nil then
					var12(p4)
				end
			end)
			
			return
		end
		p4.readyToCommit = true
		
		if p4.cancelRequest == nil and p4.cancelRetry == nil then
			var12(p4)
		end
	end
	
	local function beginReactionMutation(p4, p5, p6, p7, p8, p9, p10)
		-- upvalues: var7 (write), reactionStore (ref), nowMs (ref), t_5 (ref), t_3 (ref), commentsStore (ref), t_6 (ref), scheduleReactionCommit (ref)
		if var7 or reactionStore.getRestriction(p4, p5, false) ~= nil then
			return false
		end
		local var13 = nowMs()
		local cooldownUntilMs = reactionStore.getCooldownUntilMs(false)
		
		if var13 < cooldownUntilMs then
			return false
		elseif cooldownUntilMs > 0 then
			reactionStore.setCooldownUntilMs(0)
		end
		local var14 = t_5[p5]
		t_5[p5] = nil
		
		if var14 ~= nil then
			var14()
		end
		local var15 = reactionStore.beginIntent(p4, p5, p7, p8)
		local var16 = t_3[p5]
		
		if var16 == nil then
			var16 = {
				attempt = 0,
				syncIsUncertain = false,
				readyToCommit = false,
				cancelRequest = nil,
				cancelRetry = nil,
				cancelDebounce = nil,
				feedItemId = p4,
				commentId = p5,
				emoteId = p6,
				verb = p9,
				generation = var15,
				ownerGeneration = commentsStore.getOwnerGeneration(false),
				startedAtMs = var13,
				attemptGeneration = var15,
				desiredEmoteId = p8,
				syncedEmoteId = p10
			}
			t_3[p5] = var16
		else
			var16.verb = p9
			var16.generation = var15
			var16.desiredEmoteId = p8
			
			if var16.cancelRetry ~= nil then
				var16.cancelRetry()
				var16.cancelRetry = nil
				var16.syncIsUncertain = true
			end
		end
		t_6[p5] = p4
		scheduleReactionCommit(var16)
		
		return true
	end
	
	local function ensureReactionPresent(p4, p5, p6, p7)
		-- upvalues: reactionStore (ref), beginReactionMutation (ref)
		if p7 == nil then
			return false
		end
		local reactions = reactionStore.getProjection(p4, p5, p7, false).reactions
		
		if reactions ~= nil then
			return (if reactions == nil or reactions.userReaction == nil then nil else reactions.userReaction.emoteId) == nil and beginReactionMutation(p4, p5, p6, p7, p6, "PUT", nil)
		end
	end
	
	local function ensureReactionAbsent(value, p4, p5, p6)
		-- upvalues: reactionStore (ref), beginReactionMutation (ref)
		if p6 == nil then
			return false
		end
		local reactions = reactionStore.getProjection(value, p4, p6, false).reactions
		
		if reactions ~= nil then
			return (if reactions == nil or reactions.userReaction == nil then nil else reactions.userReaction.emoteId) == p5 and beginReactionMutation(value, p4, p5, p6, nil, "DELETE", p5)
		end
	end
	
	local var13 = nil
	
	local function failInvalidContinuation(p4)
		-- upvalues: collectionStore (ref)
		local var14 = collectionStore.getState(p4)(false)
		
		if #var14.orderedCommentIds > 0 or var14.pendingSubmission ~= nil then
			collectionStore.failLoad(p4, "more", "CommentsUnavailable")
			
			return
		end
		collectionStore.failLoad(p4, "initial", "CommentsUnavailable")
	end
	
	local function continueAfterMerge(p4, p5, p6, p7)
		-- upvalues: var1 (write), var7 (write), commentsStore (ref), failInvalidContinuation (ref), var13 (write)
		if not p6.hasMore then return end
		local var14 = if var7 or var1 == nil or (var1.feedItemId ~= p4 or var1.sessionId ~= p5) or (var1.ownerGeneration ~= commentsStore.getOwnerGeneration(false) or var1.refCount == 0) then nil else var1
		
		if var14 == nil then return end
		local nextCursor = p6.nextCursor
		
		if nextCursor == nil or var14.requestedCursors[nextCursor or "<initial>"] == true then
			failInvalidContinuation(p4)
			
			return
		elseif p7 then
			var13(p4, p5, "more", nextCursor)
		end
	end
	
	local function commentsForUpsert(p4, p5)
		-- upvalues: reactionStore (ref), commentsStore (ref)
		local list = table.create(#p4)
		
		for i, v in p4 do
			local var14 = v
			local intent = reactionStore.getIntent(v.commentId, false)
			local var15 = false
			
			if v.reactions ~= nil then
				var15 = false
				
				if intent ~= nil then
					local reactions = v.reactions
					var15 = (if reactions == nil or reactions.userReaction == nil then nil else reactions.userReaction.emoteId) == intent.desiredEmoteId
				end
			end
			if intent ~= nil and p5 < intent.generation and not var15 then
				local var16 = commentsStore.getCachedComment(v.commentId).data(false)
				
				if var16 ~= nil then
					var14 = table.clone(v)
					var14.reactions = var16.reactions
				end
			end
			table.insert(list, var14)
		end
		return list
	end
	
	var13 = function(p6, p7, p8, p9)
		-- upvalues: var1 (write), var7 (write), commentsStore (ref), fFlagMomentsComments (copy), reactionStore (ref), failInvalidContinuation (ref), collectionStore (ref), p1 (ref), eventNames (copy), fetchPage (ref), observeRequest (copy), getCommentsFailureReasonModule (copy), momentsCommentsModule (copy), readStatusCode (ref), commentsForUpsert (ref), cancelReactionRequest (ref), t_5 (ref), t_6 (ref), continueAfterMerge (ref), clearReactionsForFeed (ref), var13 (write)
		local var17 = var1
		local var18 = if var7 or var17 == nil or (var17.feedItemId ~= p6 or var17.sessionId ~= p7) or (var17.ownerGeneration ~= commentsStore.getOwnerGeneration(false) or var17.refCount == 0) then nil else var17
		
		if var18 == nil or var18.activePageRequest ~= nil then
			return false
		end
		var17 = commentsStore.getOwnerGeneration(false)
		local var19 = if fFlagMomentsComments then reactionStore.getGeneration(false) else 0
		
		if p8 == "more" then
			if p9 == nil or var18.requestedCursors[p9 or "<initial>"] == true then
				failInvalidContinuation(p6)
				
				return false
			end
			var18.requestedCursors[p9 or "<initial>"] = true
		end
		if p8 == "initial" then
			collectionStore.beginInitialLoad(p6)
		else
			collectionStore.beginLoadMore(p6)
		end
		local analyticsSession = nil
		local var20 = if p8 == "more" then "pagination" else var18.initialLoadType
		
		if fFlagMomentsComments and p1.getAnalyticsSession ~= nil then
			analyticsSession = p1.getAnalyticsSession(p6, p7)
			
			if analyticsSession ~= nil then
				analyticsSession.logEvent(eventNames.MomentCommentsListLoadAttempted, { loadType = var20 })
			end
		end
		local var21 = fetchPage({ sort = "newest", feedItemId = p6, cursor = p9 }, p1.network)
		local t = { cancel = function() end }
		var18.activePageRequest = t
		t.cancel = observeRequest(var21, function(p10)
			-- upvalues: var18 (ref), p6 (ref), p7 (ref), var17 (ref), var7 (copy), var1 (copy), commentsStore (copy), t (ref), fFlagMomentsComments (copy), analyticsSession (write), eventNames (copy), var20 (ref), getCommentsFailureReasonModule (copy), momentsCommentsModule (copy), readStatusCode (copy), commentsForUpsert (copy), var19 (ref), reactionStore (copy), cancelReactionRequest (copy), t_5 (copy), t_6 (copy), p8 (ref), collectionStore (copy), continueAfterMerge (copy), clearReactionsForFeed (copy), var13 (copy), p9 (ref)
			local var22 = var18
			local var23 = var17
			
			if var7 or not (var1 == var22 and (var22.feedItemId == p6 and (var22.sessionId == p7 and (var22.ownerGeneration == var23 and commentsStore.getOwnerGeneration(false) == var23)))) or var18.activePageRequest ~= t then return end
			var18.activePageRequest = nil
			
			if fFlagMomentsComments and analyticsSession ~= nil then
				if p10.status == "succeeded" and p10.result ~= nil then
					analyticsSession.logEvent(eventNames.MomentCommentsListLoadSucceeded, { loadType = var20 })
				else
					local logEvent = analyticsSession.logEvent
					var22 = eventNames.MomentCommentsListLoadFailed
					local t_1 = { loadType = var20 }
					local var24 = momentsCommentsModule.parseCommentsError(p10.error)
					t_1.failureReason = getCommentsFailureReasonModule(if var24 ~= nil then "CommentsUnavailable" else var24.errorCode, readStatusCode(p10, nil))
					logEvent(var22, t_1)
				end
			end
			if p10.status == "succeeded" and p10.result ~= nil then
				if fFlagMomentsComments then
					commentsStore.upsertComments(commentsForUpsert(p10.result.comments, var19), var17)
					
					for i, var23 in p10.result.comments do
						if reactionStore.reconcile(p6, var23.commentId, var23.reactions, var19) then
							cancelReactionRequest(var23.commentId)
							local commentId = var23.commentId
							local var25 = t_5[commentId]
							t_5[commentId] = nil
							
							if var25 ~= nil then
								var25()
							end
							t_6[var23.commentId] = nil
						end
					end
				else
					commentsStore.upsertComments(p10.result.comments, var17)
				end
				continueAfterMerge(p6, p7, p10.result, (if p8 == "initial" then collectionStore.completeInitialLoad(p6, p10.result) else collectionStore.completeLoadMore(p6, p10.result)).shouldContinuePaging)
				
				return
			else
				var22 = momentsCommentsModule.parseCommentsError(p10.error)
				local var26 = if var22 ~= nil then "CommentsUnavailable" else var22.errorCode
				
				if fFlagMomentsComments and var26 == "MomentUnavailable" then
					clearReactionsForFeed(p6, var26)
				end
				if p8 == "more" and var26 == "InvalidCursor" then
					if fFlagMomentsComments then
						var18.initialLoadType = "refresh"
					end
					collectionStore.resetListSession(p6)
					table.clear(var18.requestedCursors)
					var13(p6, p7, "initial", nil)
					
					return
				elseif p8 == "more" and p9 ~= nil then
					var18.requestedCursors[p9 or "<initial>"] = nil
				end
				collectionStore.failLoad(p6, p8, var26)
			end
		end)
		
		if not var7 and (var1 == var18 and (var18.feedItemId == p6 and (var18.sessionId == p7 and (var18.ownerGeneration == var17 and commentsStore.getOwnerGeneration(false) == var17)))) then
			return true
		elseif var18.activePageRequest == t then
			var18.activePageRequest = nil
		end
		t.cancel()
		
		return false
	end
	
	local function revokeViewerWrite(p10, p11)
		-- upvalues: commentsStore (ref), markFeedUnavailable (ref)
		local var22 = commentsStore.getCachedMomentComments(p10).data(false)
		
		if var22 == nil then
			markFeedUnavailable(p10, "ViewerNotEligibleToWrite")
			
			return
		end
		local cloned = table.clone(var22)
		cloned.viewerCanWrite = false
		commentsStore.upsertMomentComments({ [p10] = cloned }, p11)
	end
	
	local function incrementMomentCommentCount(p10, p11)
		-- upvalues: commentsStore (ref)
		local var22 = commentsStore.getCachedMomentComments(p10).data(false)
		
		if var22 == nil or var22.count == nil or var22.countIsCapped == true then
			return
		end
		local cloned = table.clone(var22)
		cloned.count = var22.count + 1
		commentsStore.upsertMomentComments({ [p10] = cloned }, p11)
	end
	
	local function startPendingPost(p10, p11, p12, p13, p14)
		-- upvalues: var2 (write), commentsStore (ref), fFlagMomentsComments (copy), readRetryAfter (ref), var9 (write), eventNames (copy), postComment (ref), p1 (ref), observeRequest (copy), var7 (write), var1 (write), collectionStore (ref), incrementMomentCommentCount (ref), var8 (write), fFlagMomentsCommentRecommendationTextModule (copy), readStatusCode (ref), momentsCommentsModule (copy), setPostCooldown (ref), getCommentsFailureReasonModule (copy), t_1 (copy), markFeedUnavailable (ref), revokeViewerWrite (ref)
		if var2 ~= nil then
			return false
		end
		local ownerGeneration = commentsStore.getOwnerGeneration(false)
		local var22 = nil
		local var23 = nil
		local var24 = if fFlagMomentsComments then {
			[429] = {
				function(p15)
					-- upvalues: var22 (write), var23 (write), readRetryAfter (copy)
					var22 = p15.statusCode
					var23 = readRetryAfter(p15)
				end
			}
		} else nil
		
		if fFlagMomentsComments and var9 ~= nil then
			var9.logEvent(eventNames.MomentCommentPostAttempted)
		end
		local var25 = postComment(p11, { text = p13.text, clientRequestId = p13.clientRequestId }, p1.network, var24)
		local t = {
			analyticsSession = var9,
			clientRequestId = p13.clientRequestId,
			feedItemId = p11,
			sessionId = p12,
			ownerGeneration = ownerGeneration,
			cancel = function() end
		}
		var2 = t
		t.cancel = observeRequest(var25, function(p15)
			-- upvalues: var2 (copy), t (ref), p11 (ref), p12 (ref), ownerGeneration (ref), p10 (ref), var7 (copy), var1 (copy), commentsStore (copy), collectionStore (copy), incrementMomentCommentCount (copy), fFlagMomentsComments (copy), var9 (ref), eventNames (copy), var8 (copy), fFlagMomentsCommentRecommendationTextModule (copy), readStatusCode (copy), var22 (write), momentsCommentsModule (copy), p14 (ref), setPostCooldown (copy), var23 (write), getCommentsFailureReasonModule (copy), t_1 (copy), markFeedUnavailable (copy), revokeViewerWrite (copy)
			if var2 == t and t.feedItemId == p11 and (t.sessionId == p12 and t.ownerGeneration == ownerGeneration) then
				local var26 = p10
				local var27 = ownerGeneration
				
				if var7 or not (var1 == var26 and (var26.feedItemId == p11 and (var26.sessionId == p12 and (var26.ownerGeneration == var27 and commentsStore.getOwnerGeneration(false) == var27)))) then return end
				local var28
				var2 = nil
				local pendingSubmission = collectionStore.getPendingSubmission(p11)
				
				if pendingSubmission == nil or pendingSubmission.clientRequestId ~= t.clientRequestId then return end
				if p15.status == "succeeded" and p15.result ~= nil then
					commentsStore.upsertComments({ p15.result }, ownerGeneration)
					collectionStore.resolvePendingSubmission(p11, p15.result)
					incrementMomentCommentCount(p11, ownerGeneration)
					
					if fFlagMomentsComments and var9 ~= nil then
						var9.logEvent(eventNames.MomentCommentPostResult, { outcome = "success", commentId = p15.result.commentId })
					end
					if fFlagMomentsComments then
						local var29 = var8
						var8 = nil
						
						if var29 ~= nil then
							var29(if fFlagMomentsCommentRecommendationTextModule then p15.result.text else nil)
						end
					end
					return
				elseif fFlagMomentsComments then
					var28 = readStatusCode(p15, var22)
					local var30 = momentsCommentsModule.parseCommentsError(p15.error)
					local var31 = if var30 ~= nil then nil else var30.errorCode
					local var32 = if var31 == "CommentsUnavailable" then nil elseif var31 ~= nil then if var28 == nil or var28 == 408 or (var28 < 400 or var28 >= 500) then nil elseif var28 == 429 then "RateLimited" elseif var28 == 401 then "AuthenticationRequired" else "PostRejected" else var31
					
					if p14 and var32 ~= nil and (var28 == 429 or var30 == nil) then
						var32 = nil
					end
					if var28 == 429 then
						setPostCooldown(var23)
					end
					if var9 ~= nil then
						var9.logEvent(eventNames.MomentCommentPostResult, {
							outcome = if var32 ~= nil then "unknown" else "rejected",
							failureReason = getCommentsFailureReasonModule(if var30 ~= nil then nil else var30.errorCode, var28)
						})
					end
					if var32 == nil then
						collectionStore.markPendingOutcomeUnknown(p11)
					else
						collectionStore.rejectPendingSubmission(p11, var32)
						
						if t_1[var32] then
							markFeedUnavailable(p11, var32)
							
							return
						elseif var32 == "ViewerNotEligibleToWrite" then
							revokeViewerWrite(p11, ownerGeneration)
							
							return
						end
					end
					return
				else
					var28 = momentsCommentsModule.parseCommentsError(p15.error)
					
					if var28 == nil or var28.errorCode ~= "TextFilterRejected" and var28.errorCode ~= "RateLimited" then
						collectionStore.markPendingOutcomeUnknown(p11)
					else
						collectionStore.rejectPendingSubmission(p11, var28.errorCode)
						
						if fFlagMomentsComments then
							var8 = nil
							
							return
						end
					end
					return
				end
			end
		end)
		
		if not var7 and (var1 == p10 and (p10.feedItemId == p11 and (p10.sessionId == p12 and (p10.ownerGeneration == ownerGeneration and commentsStore.getOwnerGeneration(false) == ownerGeneration)))) then
			return true
		elseif var2 == t then
			var2 = nil
		end
		t.cancel()
		
		return false
	end
	
	local function submitComment(p10, p11, p12)
		-- upvalues: var1 (write), var7 (write), commentsStore (ref), var2 (write), collectionStore (ref), fFlagMomentsComments (copy), var4 (ref), nowMs (ref), var6 (write), var5 (ref), p1 (ref), var9 (write), var8 (write), startPendingPost (ref)
		local var22 = var1
		local var23 = if var7 or var22 == nil or (var22.feedItemId ~= p10 or var22.sessionId ~= p11) or (var22.ownerGeneration ~= commentsStore.getOwnerGeneration(false) or var22.refCount == 0) then nil else var22
		
		if var23 == nil or var2 ~= nil or collectionStore.getPendingSubmission(p10) ~= nil then
			return false
		elseif fFlagMomentsComments then
			local var24 = var4(false)
			
			if var24 == 0 then
				var22 = false
			elseif nowMs() < var24 then
				var22 = true
			elseif var6 ~= nil then
				var6()
				var6 = nil
			end
			var5(0)
			var22 = false
			if var22 then
				return false
			end
		end
		var22 = collectionStore.beginPendingSubmission(p10, p12)
		local pendingSubmission = collectionStore.getPendingSubmission(p10)
		
		if pendingSubmission == nil or pendingSubmission.clientRequestId ~= var22 then
			return false
		elseif fFlagMomentsComments and p1.getAnalyticsSession ~= nil then
			var9 = p1.getAnalyticsSession(p10, p11)
		end
		if fFlagMomentsComments and p1.getCommentPostedCallback ~= nil then
			var8 = p1.getCommentPostedCallback(p10, p11)
		end
		return startPendingPost(var23, p10, p11, pendingSubmission)
	end
	
	local function retryPendingSubmission(p10, p11)
		-- upvalues: var1 (write), var7 (write), commentsStore (ref), var2 (write), collectionStore (ref), fFlagMomentsComments (copy), var4 (ref), nowMs (ref), var6 (write), var5 (ref), startPendingPost (ref)
		local var22 = var1
		local var23 = if var7 or var22 == nil or (var22.feedItemId ~= p10 or var22.sessionId ~= p11) or (var22.ownerGeneration ~= commentsStore.getOwnerGeneration(false) or var22.refCount == 0) then nil else var22
		
		if var23 == nil or var2 ~= nil then
			return false
		end
		var22 = collectionStore.getPendingSubmission(p10)
		
		if var22 == nil or var22.status ~= "OutcomeUnknown" then
			return false
		elseif fFlagMomentsComments then
			local var24
			local var25 = var4(false)
			
			if var25 == 0 then
				var24 = false
			elseif nowMs() < var25 then
				var24 = true
			elseif var6 ~= nil then
				var6()
				var6 = nil
			end
			var5(0)
			var24 = false
			if var24 then
				return false
			end
		end
		collectionStore.markPendingSending(p10)
		local pendingSubmission = collectionStore.getPendingSubmission(p10)
		
		return if pendingSubmission == nil or pendingSubmission.clientRequestId ~= var22.clientRequestId then false else startPendingPost(var23, p10, p11, pendingSubmission, true)
	end
	
	local function editPendingSubmission(p10, p11)
		-- upvalues: var1 (write), var7 (write), commentsStore (ref), var2 (write), collectionStore (ref)
		local var22 = var1
		
		if (if var7 or var22 == nil or (var22.feedItemId ~= p10 or var22.sessionId ~= p11) or (var22.ownerGeneration ~= commentsStore.getOwnerGeneration(false) or var22.refCount == 0) then nil else var22) == nil or var2 ~= nil then
			return false
		end
		var22 = collectionStore.getPendingSubmission(p10)
		
		if var22 == nil or var22.status ~= "OutcomeUnknown" then
			return false
		end
		collectionStore.rejectPendingSubmission(p10, "SubmissionOutcomeUnknown")
		
		return true
	end
	
	local function decrementMomentCommentCount(p10, p11)
		-- upvalues: commentsStore (ref)
		local var22 = commentsStore.getCachedMomentComments(p10).data(false)
		
		if var22 == nil or var22.count == nil or (var22.countIsCapped == true or var22.count <= 0) then
			return
		end
		local cloned = table.clone(var22)
		cloned.count = var22.count - 1
		commentsStore.upsertMomentComments({ [p10] = cloned }, p11)
	end
	
	local function removeDeletedComment(p10, p11, p12)
		-- upvalues: sessionFilters (ref), collectionStore (ref), fFlagMomentsComments (copy), cancelReactionRequest (ref), t_5 (ref), t_6 (ref), reactionStore (ref), decrementMomentCommentCount (ref)
		if sessionFilters ~= nil then
			sessionFilters.hideCommentForSession(p11)
		end
		local var22 = collectionStore.getState(p10)(false)
		
		if table.find(var22.orderedCommentIds, p11) ~= nil or table.find(var22.stickyPostedCommentIds, p11) ~= nil then
			collectionStore.removeCommentId(p10, p11)
		end
		if fFlagMomentsComments then
			cancelReactionRequest(p11)
			local var23 = t_5[p11]
			t_5[p11] = nil
			
			if var23 ~= nil then
				var23()
			end
			t_6[p11] = nil
			reactionStore.clearComment(p11)
		end
		decrementMomentCommentCount(p10, p12)
	end
	
	local function deleteComment_1(p10, p11, p12, p13)
		-- upvalues: var7 (write), t_4 (write), commentsStore (ref), fFlagMomentsComments (copy), p1 (ref), var1 (write), deleteComment (ref), observeRequest (copy), momentsCommentsModule (copy), readStatusCode (ref), removeDeletedComment (ref)
		if var7 or t_4[p11] ~= nil then
			return false
		end
		local ownerGeneration = commentsStore.getOwnerGeneration(false)
		local commentDeletedCallback = nil
		
		if fFlagMomentsComments and p1.getCommentDeletedCallback ~= nil then
			local var22 = var1
			
			if var22 ~= nil and var22.feedItemId == p10 then
				commentDeletedCallback = p1.getCommentDeletedCallback(p10, var22.sessionId)
			end
		end
		local var23 = deleteComment(p10, p11, p1.network)
		local t = { cancel = function() end }
		t_4[p11] = t
		t.cancel = observeRequest(var23, function(p14)
			-- upvalues: t_4 (copy), p11 (ref), t (ref), var7 (copy), commentsStore (copy), ownerGeneration (ref), momentsCommentsModule (copy), readStatusCode (copy), removeDeletedComment (copy), p10 (ref), fFlagMomentsComments (copy), p13 (ref), p12 (ref), commentDeletedCallback (write)
			if t_4[p11] ~= t then return end
			t_4[p11] = nil
			
			if var7 or commentsStore.getOwnerGeneration(false) ~= ownerGeneration then return end
			local var24 = momentsCommentsModule.parseCommentsError(p14.error)
			
			if p14.status == "succeeded" or (if readStatusCode(p14, nil) ~= 404 then var24 ~= nil and var24.errorCode == "CommentNotFound" else true) then
				removeDeletedComment(p10, p11, ownerGeneration)
				
				if fFlagMomentsComments and p14.status == "succeeded" and p13 ~= nil then
					p13()
				end
			elseif p12 ~= nil then
				p12()
			end
			if fFlagMomentsComments and p14.status == "succeeded" and commentDeletedCallback ~= nil then
				commentDeletedCallback()
			end
		end)
		
		return true
	end
	
	local _ = function()
		-- upvalues: t_4 (write)
		t_4 = {}
		
		for i, v in t_4 do
			v.cancel()
		end
	end
	
	local function cancelActivePost(p10)
		-- upvalues: var2 (write), fFlagMomentsComments (copy), commentsStore (ref), eventNames (copy), collectionStore (ref)
		var2 = nil
		
		if var2 == nil then return end
		if fFlagMomentsComments and var2.analyticsSession ~= nil and var2.ownerGeneration == commentsStore.getOwnerGeneration(false) then
			var2.analyticsSession.logEvent(eventNames.MomentCommentPostResult, { outcome = "cancelled", failureReason = "cancelled" })
		end
		var2.cancel()
		
		if p10 then
			local pendingSubmission = collectionStore.getPendingSubmission(var2.feedItemId)
			
			if pendingSubmission ~= nil and pendingSubmission.clientRequestId == var2.clientRequestId then
				collectionStore.markPendingOutcomeUnknown(var2.feedItemId)
			end
		end
	end
	
	local _ = function(p10)
		-- upvalues: fFlagMomentsComments (copy), var8 (write), var1 (write), cancelActivePost (ref), var9 (write)
		if fFlagMomentsComments and not p10 then
			var8 = nil
		end
		var1 = nil
		
		if var1 ~= nil then
			local activePageRequest = var1.activePageRequest
			var1.activePageRequest = nil
			
			if activePageRequest ~= nil then
				activePageRequest.cancel()
			end
		end
		cancelActivePost(p10)
		
		if fFlagMomentsComments and not p10 then
			var9 = nil
		end
	end
	
	local function acquireSession(p10, p11)
		-- upvalues: var7 (write), fFlagMomentsComments (copy), catalogStore (ref), commentsStore (ref), var1 (write), collectionStore (ref), var8 (write), cancelActivePost (ref), var9 (write)
		if var7 then
			return function() end
		elseif fFlagMomentsComments and catalogStore ~= nil and catalogStore.getAndFetchEmojiSets ~= nil then
			catalogStore.getAndFetchEmojiSets()
		end
		local ownerGeneration = commentsStore.getOwnerGeneration(false)
		local var22 = var1
		
		if var22 == nil or var22.feedItemId ~= p10 or (var22.sessionId ~= p11 or var22.ownerGeneration ~= ownerGeneration) then
			local var23 = var22 ~= nil and (var22.feedItemId == p10 and var22.ownerGeneration == ownerGeneration)
			
			if fFlagMomentsComments and not var23 then
				var8 = nil
			end
			local var24 = var1
			var1 = nil
			
			if var24 ~= nil then
				local activePageRequest = var24.activePageRequest
				var24.activePageRequest = nil
				
				if activePageRequest ~= nil then
					activePageRequest.cancel()
				end
			end
			cancelActivePost(var23)
			
			if fFlagMomentsComments and not var23 then
				var9 = nil
			end
			collectionStore.selectFeed(p10, ownerGeneration)
			var22 = {
				refCount = 0,
				activePageRequest = nil,
				initialLoadType = "initial",
				feedItemId = p10,
				sessionId = p11,
				ownerGeneration = ownerGeneration,
				requestedCursors = {}
			}
			var1 = var22
			collectionStore.beginListSession(p10)
		elseif var22.refCount == 0 then
			collectionStore.resetListSession(p10)
		end
		var22.refCount += 1
		local var25 = false
		
		return function()
			-- upvalues: var25 (write), var1 (copy), var22 (ref)
			if var25 then return end
			var25 = true
			
			if var1 == nil or var1 ~= var22 then return end
			var1.refCount = math.max(0, var1.refCount - 1)
			
			if var1.refCount == 0 then
				local activePageRequest = var1.activePageRequest
				var1.activePageRequest = nil
				
				if activePageRequest ~= nil then
					activePageRequest.cancel()
				end
			end
		end
	end
	
	local function ensureInitialLoad(p10, p11)
		-- upvalues: var1 (write), var7 (write), commentsStore (ref), collectionStore (ref), loadStatus (copy), var13 (write)
		local var22 = var1
		
		if (if var7 or var22 == nil or (var22.feedItemId ~= p10 or var22.sessionId ~= p11) or (var22.ownerGeneration ~= commentsStore.getOwnerGeneration(false) or var22.refCount == 0) then nil else var22) == nil then
			return false
		end
		var22 = collectionStore.getState(p10)(false)
		
		return var22.initialLoadStatus == loadStatus.Idle and var22.loadMoreStatus ~= loadStatus.Loading and var13(p10, p11, "initial", nil)
	end
	
	local function loadMore(p10, p11)
		-- upvalues: collectionStore (ref), loadStatus (copy), var13 (write)
		local var22 = collectionStore.getState(p10)(false)
		
		return var22.hasMore == true and var22.initialLoadStatus ~= loadStatus.Loading and (var22.loadMoreStatus ~= loadStatus.Loading and var22.loadMoreStatus ~= loadStatus.Failed) and var13(p10, p11, "more", var22.nextCursor)
	end
	
	local function retryInitial(p10, p11)
		-- upvalues: var1 (write), var7 (write), commentsStore (ref), fFlagMomentsComments (copy), collectionStore (ref), loadStatus (copy), ensureInitialLoad (ref)
		local var22 = var1
		local var23 = if var7 or var22 == nil or (var22.feedItemId ~= p10 or var22.sessionId ~= p11) or (var22.ownerGeneration ~= commentsStore.getOwnerGeneration(false) or var22.refCount == 0) then nil else var22
		
		if var23 == nil then
			return false
		elseif fFlagMomentsComments and collectionStore.getState(p10)(false).initialLoadStatus == loadStatus.Success then
			var23.initialLoadType = "refresh"
		end
		var22 = var23.activePageRequest
		var23.activePageRequest = nil
		
		if var22 ~= nil then
			var22.cancel()
		end
		table.clear(var23.requestedCursors)
		collectionStore.resetListSession(p10)
		
		return ensureInitialLoad(p10, p11)
	end
	
	local var22 = signalsModule.createEffect(function(p10)
		-- upvalues: commentsStore (ref), ownerGeneration (write), fFlagMomentsComments (copy), var8 (write), var1 (write), var2 (write), eventNames (copy), var9 (write), t_4 (write), clearReactionState (ref), var6 (write), var5 (ref), collectionStore (ref)
		local ownerGeneration_1 = commentsStore.getOwnerGeneration(p10)
		
		if ownerGeneration_1 == ownerGeneration then return end
		ownerGeneration = ownerGeneration_1
		
		if fFlagMomentsComments then
			var8 = nil
		end
		var1 = nil
		
		if var1 ~= nil then
			local activePageRequest = var1.activePageRequest
			var1.activePageRequest = nil
			
			if activePageRequest ~= nil then
				activePageRequest.cancel()
			end
		end
		var2 = nil
		
		if var2 ~= nil then
			if fFlagMomentsComments and var2.analyticsSession ~= nil and var2.ownerGeneration == commentsStore.getOwnerGeneration(false) then
				var2.analyticsSession.logEvent(eventNames.MomentCommentPostResult, { outcome = "cancelled", failureReason = "cancelled" })
			end
			var2.cancel()
		end
		if fFlagMomentsComments then
			var9 = nil
		end
		t_4 = {}
		
		for i, v in t_4 do
			v.cancel()
		end
		if fFlagMomentsComments then
			clearReactionState()
		end
		if fFlagMomentsComments then
			if var6 ~= nil then
				var6()
				var6 = nil
			end
			var5(0)
		end
		collectionStore.clear()
	end)
	
	return {
		acquireSession = acquireSession,
		ensureInitialLoad = ensureInitialLoad,
		loadMore = loadMore,
		retryInitial = retryInitial,
		retryLoadMore = function(p11, p12)
			-- upvalues: var1 (write), var7 (write), commentsStore (ref), collectionStore (ref), loadStatus (copy), retryInitial (ref), var13 (write)
			local var23 = var1
			local var24 = if var7 or var23 == nil or (var23.feedItemId ~= p11 or var23.sessionId ~= p12) or (var23.ownerGeneration ~= commentsStore.getOwnerGeneration(false) or var23.refCount == 0) then nil else var23
			
			if var24 == nil then
				return false
			end
			var23 = collectionStore.getState(p11)(false)
			
			return not (var23.hasMore ~= true or var23.initialLoadStatus == loadStatus.Loading or var23.loadMoreStatus == loadStatus.Loading) and (if var23.nextCursor == nil or var24.requestedCursors[var23.nextCursor or "<initial>"] == true then retryInitial(p11, p12) else var13(p11, p12, "more", var23.nextCursor))
		end,
		submitComment = submitComment,
		retryPendingSubmission = retryPendingSubmission,
		editPendingSubmission = editPendingSubmission,
		getPostCooldownUntilMs = var4,
		ensureReactionPresent = if fFlagMomentsComments then ensureReactionPresent else rejectReactionMutation,
		ensureReactionAbsent = if fFlagMomentsComments then ensureReactionAbsent else rejectReactionMutation,
		clearReactionState = if fFlagMomentsComments then clearReactionState else noOp,
		deleteComment = deleteComment_1,
		dispose = function()
			-- upvalues: var7 (write), var22 (ref), fFlagMomentsComments (copy), var8 (write), var1 (write), var2 (write), commentsStore (ref), eventNames (copy), var9 (write), t_4 (write), clearReactionState (ref), var6 (write), var5 (ref), collectionStore (ref)
			if var7 then return end
			var7 = true
			var22()
			
			if fFlagMomentsComments then
				var8 = nil
			end
			var1 = nil
			
			if var1 ~= nil then
				local activePageRequest = var1.activePageRequest
				var1.activePageRequest = nil
				
				if activePageRequest ~= nil then
					activePageRequest.cancel()
				end
			end
			var2 = nil
			
			if var2 ~= nil then
				if fFlagMomentsComments and var2.analyticsSession ~= nil and var2.ownerGeneration == commentsStore.getOwnerGeneration(false) then
					var2.analyticsSession.logEvent(eventNames.MomentCommentPostResult, { outcome = "cancelled", failureReason = "cancelled" })
				end
				var2.cancel()
			end
			if fFlagMomentsComments then
				var9 = nil
			end
			t_4 = {}
			
			for i, v in t_4 do
				v.cancel()
			end
			if fFlagMomentsComments then
				clearReactionState()
			end
			if fFlagMomentsComments then
				if var6 ~= nil then
					var6()
					var6 = nil
				end
				var5(0)
			end
			collectionStore.clear()
		end
	}
end