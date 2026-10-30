local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local ReactModule = require(Parent.React)
local ReactionsModule = require(Parent.Reactions)
local _ = require(SduiSharedContent.Stores.ContentReactionsStoreTypes)
local AddReactionButtonModule = require(SduiSharedContent.Components.AddReactionButton)
local UseOptimisticReactionsModule = require(SduiSharedContent.Components.useOptimisticReactions)
local GetLocalPlayerUserIdFunction = require(Parent.DataHydration).DataHydrationUtils.getLocalPlayerUserId
local View = require(Parent.Foundation).View

local function findReaction(AvailableByTypeEntry, List)
	local ReactionType = AvailableByTypeEntry.reactionType
	local v1 = nil
	
	for _, value in List do
		if value.reactionType == ReactionType then
			if value.hasUserAppliedReaction then
				return value
			end
			v1 = v1 or value
		end
	end
	return if v1 then v1 else {
		hasUserAppliedReaction = false,
		emoteId = AvailableByTypeEntry.emoteId,
		reactionType = ReactionType
	}
end

return function(p1)
	-- upvalues: GetLocalPlayerUserIdFunction (copy), UseOptimisticReactionsModule (copy), ReactModule (copy), ReactionsModule (copy), findReaction (copy), AddReactionButtonModule (copy), View (copy)
	local OnReactionActivated = p1.onReactionActivated
	local NoIsDisabled: boolean = OnReactionActivated ~= nil and (GetLocalPlayerUserIdFunction() ~= nil and not p1.isDisabled)
	local UseOptimisticReactionsModuleResult, UseOptimisticReactionsModuleResult2 = UseOptimisticReactionsModule(p1.id, p1.reactions, OnReactionActivated)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ReactionsModule (upval)
		local ReactionTypes = {}
		local AvailableByType = {}
		local AvailableReactions = p1.availableReactions or {}
		for _, availableReaction in AvailableReactions do
			local ReactionType = availableReaction.reactionType
			
			if ReactionsModule.Constants.ReactionIconMappings[ReactionType] then
				AvailableByType[ReactionType] = availableReaction
				table.insert(ReactionTypes, ReactionType)
			end
		end
		return {
			reactionTypes = ReactionTypes,
			availableByType = AvailableByType
		}
	end, { p1.availableReactions })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseOptimisticReactionsModuleResult (copy)
		local t = {}
		
		for _, value in UseOptimisticReactionsModuleResult do
			if value.hasUserAppliedReaction then
				t[value.reactionType] = true
			end
		end
		return t
	end, { UseOptimisticReactionsModuleResult })
	
	local function selectReaction(p2)
		-- upvalues: UseOptimisticReactionsModuleResult2 (copy), findReaction (upval), UseMemoResult (copy), UseOptimisticReactionsModuleResult (copy)
		UseOptimisticReactionsModuleResult2((findReaction(UseMemoResult.availableByType[p2], UseOptimisticReactionsModuleResult)))
	end
	
	local Elements = {}
	local LayoutOrder = 0
	local v2 = false
	
	for _, value in UseOptimisticReactionsModuleResult do
		if ReactionsModule.Constants.ReactionIconMappings[value.reactionType] then
			local ReactionCount = if p1.areReactionCountsVisible then value.reactionCount or 0 else nil
			LayoutOrder += 1
			v2 = v2 or ReactionCount ~= 0
			Elements[`Reaction_{value.emoteId}`] = ReactModule.createElement(ReactionsModule.ReactionPill, {
				reactionType = value.reactionType,
				count = ReactionCount,
				isSelected = value.hasUserAppliedReaction,
				onActivated = if NoIsDisabled then function()
					-- upvalues: UseOptimisticReactionsModuleResult2 (copy), value (copy)
					UseOptimisticReactionsModuleResult2(value)
				end else nil,
				layoutOrder = LayoutOrder,
				testId = `reaction-{value.emoteId}`
			})
		end
	end
	if NoIsDisabled and #UseMemoResult.reactionTypes > 0 then
		Elements.AddReaction = ReactModule.createElement(AddReactionButtonModule, {
			layoutOrder = 0,
			reactions = UseMemoResult.reactionTypes,
			selectedReactions = UseMemoResult1,
			onReactionSelected = selectReaction
		})
	elseif not v2 then
		return nil
	end
	return ReactModule.createElement(View, {
		testId = "reactions",
		tag = "row wrap align-y-center gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, Elements)
end