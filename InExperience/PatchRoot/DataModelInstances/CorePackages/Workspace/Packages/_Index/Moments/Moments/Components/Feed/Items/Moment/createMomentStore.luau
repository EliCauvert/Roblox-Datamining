local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local signalsModule = require(parent.Signals)
local getReactionsStoreModule = require(moments.Stores.GetReactionsStore)
local getShareCountsStoreModule = require(moments.Stores.GetShareCountsStore)
local _ = require(moments.Stores.GetReactionsStore.createReactionsStore)
local _ = require(moments.Stores.GetShareCountsStore.createShareCountsStore)
local reactionActionModule = require(moments.Enums.ReactionAction)
local fFlagMomentsReactToFeedItemV2Module = require(moments.Flags.FFlagMomentsReactToFeedItemV2)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

return function(p0, p1)
	-- upvalues: createSignal (ref), getReactionsStoreModule (ref), getShareCountsStoreModule (ref), createComputed (ref), fFlagMomentsReactToFeedItemV2Module (ref), reactionActionModule (ref)
	local var6 = createSignal(p0)
	local momentId = p0.momentId
	p1 = p1 or {}
	local var8 = if p1.reactionsStore ~= nil then getReactionsStoreModule(false) else p1.reactionsStore
	local var9 = if p1.shareCountsStore ~= nil then getShareCountsStoreModule(false) else p1.shareCountsStore
	local var10, var11 = createSignal(if p0.kind == "experience" then p0.commentCount else nil)
	local var12, var13 = createSignal(p0.isModerated == true)
	local userReactionForMoment = var8.getUserReactionForMoment(momentId)
	local var15 = createComputed(function(p2)
		-- upvalues: userReactionForMoment (ref)
		return userReactionForMoment(p2) ~= nil
	end)
	local totalReactionCountForMoment = var8.getTotalReactionCountForMoment(momentId)
	local var17 = createComputed(function(p3)
		-- upvalues: totalReactionCountForMoment (ref)
		local var29 = totalReactionCountForMoment(p3)
		
		return if var29 > 0 then var29 else nil
	end)
	local individualReactionCountsForMoment = var8.getIndividualReactionCountsForMoment(momentId)
	local shareInfo = var9.getShareInfo(momentId)
	local var20 = createComputed(function(p4)
		-- upvalues: shareInfo (ref)
		local shareCount = shareInfo(p4).shareCount
		
		return if shareCount > 0 then shareCount else nil
	end)
	
	local function setShareCount(value)
		-- upvalues: shareInfo (ref), var9 (ref), momentId (ref)
		var9.setShareCount(momentId, value or 0, shareInfo(false).hasShared)
	end
	
	local function commitReaction(p5)
		-- upvalues: var8 (ref), p0 (ref), momentId (ref)
		local var30 = var8.reactToFeedItem({
			entityType = "userCreatedMoment",
			feedItemId = p0.feedItemId or momentId,
			entityId = momentId,
			reactionType = p5,
			feedSessionId = p0.feedSessionId
		})
		
		if type(var30) == "table" and var30.catch ~= nil then
			var30:catch(function() end)
		end
	end
	
	local function clearReaction()
		-- upvalues: fFlagMomentsReactToFeedItemV2Module (copy), userReactionForMoment (ref), var8 (ref), p0 (ref), momentId (ref), reactionActionModule (copy)
		if fFlagMomentsReactToFeedItemV2Module then
			local var31 = userReactionForMoment(false)
			
			if var31 == nil then
				var8.updateReaction({
					action = reactionActionModule.Unreact,
					momentId = momentId
				})
				
				return
			end
			local var32 = var8.removeFeedItemReaction({
				entityType = "userCreatedMoment",
				feedItemId = p0.feedItemId or momentId,
				entityId = momentId,
				reactionType = var31,
				feedSessionId = p0.feedSessionId
			})
			
			if type(var32) == "table" and var32.catch ~= nil then
				var32:catch(function() end)
			end
		end
	end
	
	local var24, var25 = createSignal(nil)
	local var26 = createComputed(function(p6)
		-- upvalues: var24 (ref)
		return var24(p6) ~= nil
	end)
	local var27, var28 = createSignal(false)
	
	return {
		getData = var6,
		getReactionCount = var17,
		getIndividualReactionCounts = individualReactionCountsForMoment,
		getCommentCount = var10,
		setCommentCount = var11,
		getShareCount = var20,
		setShareCount = setShareCount,
		getSelectedReaction = userReactionForMoment,
		getIsReacted = var15,
		commitReaction = commitReaction,
		clearReaction = clearReaction,
		getIsModerated = var12,
		setIsModerated = var13,
		getIsScrubbing = var26,
		getScrubPosition = var24,
		setScrubPosition = var25,
		getIsReactionPickerOpen = var27,
		setReactionPickerOpen = var28
	}
end