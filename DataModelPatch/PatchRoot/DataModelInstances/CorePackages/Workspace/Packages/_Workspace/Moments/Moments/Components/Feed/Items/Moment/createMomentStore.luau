local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local _ = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local SignalsModule = require(Parent.Signals)
local GetReactionsStoreModule = require(Moments.Stores.GetReactionsStore)
local GetShareCountsStoreModule = require(Moments.Stores.GetShareCountsStore)
local _ = require(Moments.Stores.GetReactionsStore.createReactionsStore)
local _ = require(Moments.Stores.GetShareCountsStore.createShareCountsStore)
local ReactionActionModule = require(Moments.Enums.ReactionAction)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed

return function(p1, p2)
	-- upvalues: CreateSignalFunction (copy), GetReactionsStoreModule (copy), GetShareCountsStoreModule (copy), CreateComputedFunction (copy), ReactionActionModule (copy)
	local Signal = CreateSignalFunction(p1)
	local MomentId = p1.momentId
	local P1 = p2 or {}
	local ReactionsStoreModule = if P1.reactionsStore == nil then GetReactionsStoreModule(false) else P1.reactionsStore
	local ShareCountsStoreModule = if P1.shareCountsStore == nil then GetShareCountsStoreModule(false) else P1.shareCountsStore
	local Signal1, Signal2 = CreateSignalFunction(if p1.kind == "experience" then p1.commentCount else nil)
	local Signal3, Signal2_1 = CreateSignalFunction(p1.isModerated == true)
	local UserReactionForMoment = ReactionsStoreModule.getUserReactionForMoment(MomentId)
	local Computed = CreateComputedFunction(function(p3): boolean
		-- upvalues: UserReactionForMoment (copy)
		return UserReactionForMoment(p3) ~= nil
	end)
	local TotalReactionCountForMoment = ReactionsStoreModule.getTotalReactionCountForMoment(MomentId)
	local Computed1 = CreateComputedFunction(function(p3)
		-- upvalues: TotalReactionCountForMoment (copy)
		local TalReactionCountForMoment: number = TotalReactionCountForMoment(p3)
		
		return if TalReactionCountForMoment > 0 then TalReactionCountForMoment else nil
	end)
	local IndividualReactionCountsForMoment = ReactionsStoreModule.getIndividualReactionCountsForMoment(MomentId)
	local ShareInfo = ShareCountsStoreModule.getShareInfo(MomentId)
	local Computed2 = CreateComputedFunction(function(p3)
		-- upvalues: ShareInfo (copy)
		local ShareCount: number = ShareInfo(p3).shareCount
		
		return if ShareCount > 0 then ShareCount else nil
	end)
	
	local function setShareCount(p3)
		-- upvalues: ShareInfo (copy), ShareCountsStoreModule (copy), MomentId (copy)
		ShareCountsStoreModule.setShareCount(MomentId, p3 or 0, ShareInfo(false).hasShared)
	end
	
	local function commitReaction(ReactionType)
		-- upvalues: ReactionsStoreModule (copy), p1 (copy), MomentId (copy)
		local ReactToFeedItemResult = ReactionsStoreModule.reactToFeedItem({
			entityType = "userCreatedMoment",
			feedItemId = p1.feedItemId or MomentId,
			entityId = MomentId,
			reactionType = ReactionType,
			feedSessionId = p1.feedSessionId
		})
		
		if type(ReactToFeedItemResult) == "table" and ReactToFeedItemResult.catch ~= nil then
			ReactToFeedItemResult:catch(function() end)
		end
	end
	
	local function clearReaction()
		-- upvalues: ReactionsStoreModule (copy), ReactionActionModule (upval), MomentId (copy)
		ReactionsStoreModule.updateReaction({
			action = ReactionActionModule.Unreact,
			momentId = MomentId
		})
	end
	
	local Signal4, Signal2_2 = CreateSignalFunction(nil)
	local Computed3 = CreateComputedFunction(function(p3): boolean
		-- upvalues: Signal4 (copy)
		return Signal4(p3) ~= nil
	end)
	local Signal5, Signal2_3 = CreateSignalFunction(false)
	
	return {
		getData = Signal,
		getReactionCount = Computed1,
		getIndividualReactionCounts = IndividualReactionCountsForMoment,
		getCommentCount = Signal1,
		setCommentCount = Signal2,
		getShareCount = Computed2,
		setShareCount = setShareCount,
		getSelectedReaction = UserReactionForMoment,
		getIsReacted = Computed,
		commitReaction = commitReaction,
		clearReaction = clearReaction,
		getIsModerated = Signal3,
		setIsModerated = Signal2_1,
		getIsScrubbing = Computed3,
		getScrubPosition = Signal4,
		setScrubPosition = Signal2_2,
		getIsReactionPickerOpen = Signal5,
		setReactionPickerOpen = Signal2_3
	}
end