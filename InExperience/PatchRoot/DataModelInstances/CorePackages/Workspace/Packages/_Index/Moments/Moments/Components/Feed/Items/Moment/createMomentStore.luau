local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.MomentsCommon)
local _ = require(parent.DataHydration.MomentsStoreTypes)
local _ = require(parent.MomentsTypes)
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local getReactionsStoreModule = require(moments.Stores.GetReactionsStore)
local getShareCountsStoreModule = require(moments.Stores.GetShareCountsStore)
local _ = require(moments.Stores.GetReactionsStore.createReactionsStore)
local _ = require(moments.Stores.GetShareCountsStore.createShareCountsStore)
local reactionActionModule = require(moments.Enums.ReactionAction)
local fFlagMomentsReactToFeedItemV2Module = require(moments.Flags.FFlagMomentsReactToFeedItemV2)
local var1 = if sharedFlagsModule.FFlagMomentsComments then require(parent.DataHydration.MomentsGetMomentsCommentsStore) else nil
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

return function(p1, p2)
	-- upvalues: createSignal (ref), getReactionsStoreModule (ref), getShareCountsStoreModule (ref), var1 (ref), createComputed (ref), fFlagMomentsReactToFeedItemV2Module (ref), reactionActionModule (ref)
	local var2 = createSignal(p1)
	local momentId = p1.momentId
	p2 = p2 or {}
	local var3 = if p2.reactionsStore ~= nil then getReactionsStoreModule(false) else p2.reactionsStore
	local var4 = if p2.shareCountsStore ~= nil then getShareCountsStoreModule(false) else p2.shareCountsStore
	local var5, var6 = createSignal(if p1.kind == "experience" then p1.commentCount else nil)
	local var7 = if p2.commentsStore ~= nil then if var1 ~= nil then nil else var1(false) else p2.commentsStore
	local feedItemId = p1.feedItemId
	
	if var7 ~= nil and p1.kind == "experience" and (feedItemId ~= nil and feedItemId ~= "") then
		local var8 = var5
		local data = var7.getCachedMomentComments(feedItemId).data
		var5 = createComputed(function(p3)
			-- upvalues: data (ref), var8 (ref)
			local var9 = data(p3)
			
			return if var9 == nil or var9.count == nil then var8(p3) else var9.count
		end)
	end
	local var9, var10 = createSignal(p1.isModerated == true)
	local userReactionForMoment = var3.getUserReactionForMoment(momentId)
	local var11 = createComputed(function(p3)
		-- upvalues: userReactionForMoment (ref)
		return userReactionForMoment(p3) ~= nil
	end)
	local totalReactionCountForMoment = var3.getTotalReactionCountForMoment(momentId)
	local var12 = createComputed(function(p3)
		-- upvalues: totalReactionCountForMoment (ref)
		local var13 = totalReactionCountForMoment(p3)
		
		return if var13 > 0 then var13 else nil
	end)
	local individualReactionCountsForMoment = var3.getIndividualReactionCountsForMoment(momentId)
	local shareInfo = var4.getShareInfo(momentId)
	local var13 = createComputed(function(p3)
		-- upvalues: shareInfo (ref)
		local shareCount = shareInfo(p3).shareCount
		
		return if shareCount > 0 then shareCount else nil
	end)
	
	local function setShareCount(value)
		-- upvalues: shareInfo (ref), var4 (ref), momentId (ref)
		var4.setShareCount(momentId, value or 0, shareInfo(false).hasShared)
	end
	
	local function commitReaction(p3)
		-- upvalues: var3 (ref), p1 (ref), momentId (ref)
		local var14 = var3.reactToFeedItem({
			entityType = "userCreatedMoment",
			feedItemId = p1.feedItemId or momentId,
			entityId = momentId,
			reactionType = p3,
			feedSessionId = p1.feedSessionId
		})
		
		if type(var14) == "table" and var14.catch ~= nil then
			var14:catch(function() end)
		end
	end
	
	local function clearReaction()
		-- upvalues: fFlagMomentsReactToFeedItemV2Module (copy), userReactionForMoment (ref), var3 (ref), p1 (ref), momentId (ref), reactionActionModule (copy)
		if fFlagMomentsReactToFeedItemV2Module then
			local var14 = userReactionForMoment(false)
			
			if var14 == nil then
				var3.updateReaction({
					action = reactionActionModule.Unreact,
					momentId = momentId
				})
				
				return
			end
			local var15 = var3.removeFeedItemReaction({
				entityType = "userCreatedMoment",
				feedItemId = p1.feedItemId or momentId,
				entityId = momentId,
				reactionType = var14,
				feedSessionId = p1.feedSessionId
			})
			
			if type(var15) == "table" and var15.catch ~= nil then
				var15:catch(function() end)
			end
		end
	end
	
	local var14, var15 = createSignal(nil)
	local var16 = createComputed(function(p3)
		-- upvalues: var14 (ref)
		return var14(p3) ~= nil
	end)
	local var17, var18 = createSignal(false)
	
	return {
		getData = var2,
		getReactionCount = var12,
		getIndividualReactionCounts = individualReactionCountsForMoment,
		getCommentCount = var5,
		setCommentCount = var6,
		getShareCount = var13,
		setShareCount = setShareCount,
		getSelectedReaction = userReactionForMoment,
		getIsReacted = var11,
		commitReaction = commitReaction,
		clearReaction = clearReaction,
		getIsModerated = var9,
		setIsModerated = var10,
		getIsScrubbing = var16,
		getScrubPosition = var14,
		setScrubPosition = var15,
		getIsReactionPickerOpen = var17,
		setReactionPickerOpen = var18
	}
end