local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagMomentsReactFeatureGate = require(Parent.SharedFlags).FFlagMomentsReactFeatureGate
local MomentContextModule = require(script.Parent.Parent.MomentContext)
local ReactionTruthTableModule = require(script.Parent.reactionTruthTable)
local SignalActionTypeModule = require(Moments.Enums.SignalActionType)
local UseFeedOptionalFunction = require(Moments.Components.Feed.FeedContext).useFeedOptional
local FFlagMomentsUseSharedReactionsModule = require(Moments.Flags.FFlagMomentsUseSharedReactions)
local ApplyReactionTriggerModule = if FFlagMomentsUseSharedReactionsModule then require(Parent.Reactions.applyReactionTrigger) else nil
local ReactionTriggerModule = if FFlagMomentsUseSharedReactionsModule then require(Parent.Reactions.ReactionTrigger) else nil
local GetMomentsCapabilitiesFunction = require(Parent.MomentsCommon).Stores.GetMomentsCapabilities
local UseReactionEffectsFunction = require(script.Parent.ReactionEffectsContext).useReactionEffects

local function decideWithSharedRules(SelectedReaction, p1, p2)
	-- upvalues: ApplyReactionTriggerModule (copy), ReactionTriggerModule (copy)
	assert(ApplyReactionTriggerModule ~= nil and ReactionTriggerModule ~= nil, "expected the shared Reactions rules")
	local SelectedReactions = {}
	
	if SelectedReaction ~= nil then
		SelectedReactions[SelectedReaction] = true
	end
	local ApplyReactionTriggerModuleResult = ApplyReactionTriggerModule({
		selectedReactions = SelectedReactions,
		reactionCounts = {}
	}, if p1 == "tapButton" then ReactionTriggerModule.ButtonTap elseif p1 == "doubleTap" then ReactionTriggerModule.DoubleTap else ReactionTriggerModule.PickerSelect, p2)
	
	return {
		action = if ApplyReactionTriggerModuleResult.added == nil then if ApplyReactionTriggerModuleResult.removed == nil then "none" else "clear" else "commit",
		reaction = ApplyReactionTriggerModuleResult.added,
		effectReaction = ApplyReactionTriggerModuleResult.celebratedReaction
	}
end

return function()
	-- upvalues: MomentContextModule (copy), UseReactionEffectsFunction (copy), UseFeedOptionalFunction (copy), FFlagMomentsReactFeatureGate (copy), SignalsReactModule (copy), GetMomentsCapabilitiesFunction (copy), ReactModule (copy), FFlagMomentsUseSharedReactionsModule (copy), decideWithSharedRules (copy), ReactionTruthTableModule (copy), SignalActionTypeModule (copy)
	local Store = MomentContextModule.useMoment().store
	local UseReactionEffectsResult = UseReactionEffectsFunction()
	local UseFeedOptionalResult = UseFeedOptionalFunction()
	local NoFFlagMomentsReactFeatureGate = not FFlagMomentsReactFeatureGate or SignalsReactModule.useSignalState(GetMomentsCapabilitiesFunction(false).getCanReactToMoments)
	
	return ReactModule.useCallback(function(p1, p2, p3)
		-- upvalues: FFlagMomentsReactFeatureGate (upval), NoFFlagMomentsReactFeatureGate (copy), Store (copy), FFlagMomentsUseSharedReactionsModule (upval), decideWithSharedRules (upval), ReactionTruthTableModule (upval), UseFeedOptionalResult (copy), SignalActionTypeModule (upval), UseReactionEffectsResult (copy)
		if FFlagMomentsReactFeatureGate and not NoFFlagMomentsReactFeatureGate then return end
		local SelectedReaction = Store.getSelectedReaction(false)
		local DecideWithSharedRulesResult = if FFlagMomentsUseSharedReactionsModule then decideWithSharedRules(SelectedReaction, p1, p3) else ReactionTruthTableModule.decide(SelectedReaction, p1, p3)
		
		if DecideWithSharedRulesResult.action == "commit" and DecideWithSharedRulesResult.reaction ~= nil then
			Store.commitReaction(DecideWithSharedRulesResult.reaction)
		elseif DecideWithSharedRulesResult.action == "clear" then
			Store.clearReaction()
		end
		if UseFeedOptionalResult ~= nil and DecideWithSharedRulesResult.action ~= "none" then
			local Data = Store.getData(false)
			local FeedItemId = Data.feedItemId
			
			if FeedItemId ~= nil and FeedItemId ~= "" then
				local config = {
					itemId = FeedItemId,
					tracingId = Data.feedSessionId,
					contentType = Data.contentType
				}
				local Success, Result = pcall(function()
					-- upvalues: DecideWithSharedRulesResult (copy), UseFeedOptionalResult (upval), SignalActionTypeModule (upval), config (copy)
					if DecideWithSharedRulesResult.action == "commit" and DecideWithSharedRulesResult.reaction ~= nil then
						UseFeedOptionalResult.logAction(SignalActionTypeModule.AddReaction, config, { reactionType = DecideWithSharedRulesResult.reaction })
						
						return
					end
					if DecideWithSharedRulesResult.action == "clear" then
						UseFeedOptionalResult.logAction(SignalActionTypeModule.RemoveReaction, config, {})
					end
				end)
				
				if not Success then
					warn("Failed to log reaction action event", Result)
				end
			end
		end
		if UseReactionEffectsResult ~= nil and DecideWithSharedRulesResult.effectReaction ~= nil then
			UseReactionEffectsResult.spawnExplosion(DecideWithSharedRulesResult.effectReaction, p2)
		end
	end, {
		Store,
		UseReactionEffectsResult,
		UseFeedOptionalResult,
		NoFFlagMomentsReactFeatureGate
	})
end