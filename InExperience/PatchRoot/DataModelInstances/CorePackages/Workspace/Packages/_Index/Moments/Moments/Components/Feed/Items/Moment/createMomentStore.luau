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
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

return function(p0, p1) --[[ line: 153 | named "createMomentStore" ]]
	-- upvalues: createSignal (ref), getReactionsStoreModule (ref), getShareCountsStoreModule (ref), createComputed (ref), reactionActionModule (ref)
	local var5 = createSignal(p0)
	local momentId = p0.momentId
	p1 = p1 or {}
	local var7 = if p1.reactionsStore ~= nil then getReactionsStoreModule(false) else p1.reactionsStore
	local var8 = if p1.shareCountsStore ~= nil then getShareCountsStoreModule(false) else p1.shareCountsStore
	local var9, var10 = createSignal(if p0.kind == "experience" then p0.commentCount else nil)
	local var11, var12 = createSignal(p0.isModerated == true)
	local userReactionForMoment = var7.getUserReactionForMoment(momentId)
	local var14 = createComputed(function(p2) --[[ line: 178 ]]
		-- upvalues: userReactionForMoment (ref)
		return userReactionForMoment(p2) ~= nil
	end)
	local totalReactionCountForMoment = var7.getTotalReactionCountForMoment(momentId)
	local var16 = createComputed(function(p3) --[[ line: 182 ]]
		-- upvalues: totalReactionCountForMoment (ref)
		local var28 = totalReactionCountForMoment(p3)
		
		return if var28 > 0 then var28 else nil
	end)
	local individualReactionCountsForMoment = var7.getIndividualReactionCountsForMoment(momentId)
	local shareInfo = var8.getShareInfo(momentId)
	local var19 = createComputed(function(p4) --[[ line: 192 ]]
		-- upvalues: shareInfo (ref)
		local shareCount = shareInfo(p4).shareCount
		
		return if shareCount > 0 then shareCount else nil
	end)
	
	local function setShareCount(value) --[[ line: 196 ]]
		-- upvalues: shareInfo (ref), var8 (ref), momentId (ref)
		var8.setShareCount(momentId, value or 0, shareInfo(false).hasShared)
	end
	
	local function commitReaction(p5) --[[ line: 203 ]]
		-- upvalues: var7 (ref), p0 (ref), momentId (ref)
		local var29 = var7.reactToFeedItem({
			entityType = "userCreatedMoment",
			feedItemId = p0.feedItemId or momentId,
			entityId = momentId,
			reactionType = p5,
			feedSessionId = p0.feedSessionId
		})
		
		if type(var29) == "table" and var29.catch ~= nil then
			var29:catch(function() --[[ line: 217 ]] end)
		end
	end
	
	local function clearReaction() --[[ line: 220 ]]
		-- upvalues: var7 (ref), reactionActionModule (copy), momentId (ref)
		var7.updateReaction({
			action = reactionActionModule.Unreact,
			momentId = momentId
		})
	end
	
	local var23, var24 = createSignal(nil)
	local var25 = createComputed(function(p6) --[[ line: 228 ]]
		-- upvalues: var23 (ref)
		return var23(p6) ~= nil
	end)
	local var26, var27 = createSignal(false)
	
	return {
		getData = var5,
		getReactionCount = var16,
		getIndividualReactionCounts = individualReactionCountsForMoment,
		getCommentCount = var9,
		setCommentCount = var10,
		getShareCount = var19,
		setShareCount = setShareCount,
		getSelectedReaction = userReactionForMoment,
		getIsReacted = var14,
		commitReaction = commitReaction,
		clearReaction = clearReaction,
		getIsModerated = var11,
		setIsModerated = var12,
		getIsScrubbing = var25,
		getScrubPosition = var23,
		setScrubPosition = var24,
		getIsReactionPickerOpen = var26,
		setReactionPickerOpen = var27
	}
end