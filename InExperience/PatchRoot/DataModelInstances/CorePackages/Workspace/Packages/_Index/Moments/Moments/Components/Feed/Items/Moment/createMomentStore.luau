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

return function(p1, p2)
	-- upvalues: createSignal (ref), getReactionsStoreModule (ref), getShareCountsStoreModule (ref), createComputed (ref), fFlagMomentsReactToFeedItemV2Module (ref), reactionActionModule (ref)
	local var1 = createSignal(p1)
	local momentId = p1.momentId
	p2 = p2 or {}
	local var2 = if p2.reactionsStore ~= nil then getReactionsStoreModule(false) else p2.reactionsStore
	local var3 = if p2.shareCountsStore ~= nil then getShareCountsStoreModule(false) else p2.shareCountsStore
	local var4, var5 = createSignal(if p1.kind == "experience" then p1.commentCount else nil)
	local var6, var7 = createSignal(p1.isModerated == true)
	local userReactionForMoment = var2.getUserReactionForMoment(momentId)
	local var8 = createComputed(function(p3)
		-- upvalues: userReactionForMoment (ref)
		return userReactionForMoment(p3) ~= nil
	end)
	local totalReactionCountForMoment = var2.getTotalReactionCountForMoment(momentId)
	local var9 = createComputed(function(p3)
		-- upvalues: totalReactionCountForMoment (ref)
		local var10 = totalReactionCountForMoment(p3)
		
		return if var10 > 0 then var10 else nil
	end)
	local individualReactionCountsForMoment = var2.getIndividualReactionCountsForMoment(momentId)
	local shareInfo = var3.getShareInfo(momentId)
	local var10 = createComputed(function(p3)
		-- upvalues: shareInfo (ref)
		local shareCount = shareInfo(p3).shareCount
		
		return if shareCount > 0 then shareCount else nil
	end)
	
	local function setShareCount(value)
		-- upvalues: shareInfo (ref), var3 (ref), momentId (ref)
		var3.setShareCount(momentId, value or 0, shareInfo(false).hasShared)
	end
	
	local function commitReaction(p3)
		-- upvalues: var2 (ref), p1 (ref), momentId (ref)
		local var11 = var2.reactToFeedItem({
			entityType = "userCreatedMoment",
			feedItemId = p1.feedItemId or momentId,
			entityId = momentId,
			reactionType = p3,
			feedSessionId = p1.feedSessionId
		})
		
		if type(var11) == "table" and var11.catch ~= nil then
			var11:catch(function() end)
		end
	end
	
	local function clearReaction()
		-- upvalues: fFlagMomentsReactToFeedItemV2Module (copy), userReactionForMoment (ref), var2 (ref), p1 (ref), momentId (ref), reactionActionModule (copy)
		if fFlagMomentsReactToFeedItemV2Module then
			local var11 = userReactionForMoment(false)
			
			if var11 == nil then
				var2.updateReaction({
					action = reactionActionModule.Unreact,
					momentId = momentId
				})
				
				return
			end
			local var12 = var2.removeFeedItemReaction({
				entityType = "userCreatedMoment",
				feedItemId = p1.feedItemId or momentId,
				entityId = momentId,
				reactionType = var11,
				feedSessionId = p1.feedSessionId
			})
			
			if type(var12) == "table" and var12.catch ~= nil then
				var12:catch(function() end)
			end
		end
	end
	
	local var11, var12 = createSignal(nil)
	local var13 = createComputed(function(p3)
		-- upvalues: var11 (ref)
		return var11(p3) ~= nil
	end)
	local var14, var15 = createSignal(false)
	
	return {
		getData = var1,
		getReactionCount = var9,
		getIndividualReactionCounts = individualReactionCountsForMoment,
		getCommentCount = var4,
		setCommentCount = var5,
		getShareCount = var10,
		setShareCount = setShareCount,
		getSelectedReaction = userReactionForMoment,
		getIsReacted = var8,
		commitReaction = commitReaction,
		clearReaction = clearReaction,
		getIsModerated = var6,
		setIsModerated = var7,
		getIsScrubbing = var13,
		getScrubPosition = var11,
		setScrubPosition = var12,
		getIsReactionPickerOpen = var14,
		setReactionPickerOpen = var15
	}
end