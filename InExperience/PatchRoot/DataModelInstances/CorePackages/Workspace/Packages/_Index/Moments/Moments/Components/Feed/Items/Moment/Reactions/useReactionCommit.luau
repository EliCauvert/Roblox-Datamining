local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagMomentsReactFeatureGate = require(Parent.SharedFlags).FFlagMomentsReactFeatureGate
local MomentContextModule = require(script.Parent.Parent.MomentContext)
local ReactionTruthTableModule = require(script.Parent.reactionTruthTable)
local SignalActionTypeModule = require(Moments.Enums.SignalActionType)
local UseFeedOptionalFunction = require(Moments.Components.Feed.FeedContext).useFeedOptional
local GetMomentsCapabilitiesFunction = require(Parent.MomentsCommon).Stores.GetMomentsCapabilities
local UseReactionEffectsFunction = require(script.Parent.ReactionEffectsContext).useReactionEffects

return function() --[[ Line: 34 | Named "useReactionCommit" ]]
	-- upvalues: MomentContextModule (copy), UseReactionEffectsFunction (copy), UseFeedOptionalFunction (copy), FFlagMomentsReactFeatureGate (copy), SignalsReactModule (copy), GetMomentsCapabilitiesFunction (copy), ReactModule (copy), ReactionTruthTableModule (copy), SignalActionTypeModule (copy)
	local Store = MomentContextModule.useMoment().store
	local UseReactionEffectsResult = UseReactionEffectsFunction()
	local UseFeedOptionalResult = UseFeedOptionalFunction()
	local NoFFlagMomentsReactFeatureGate = not FFlagMomentsReactFeatureGate or SignalsReactModule.useSignalState(GetMomentsCapabilitiesFunction(false).getCanReactToMoments)
	
	return ReactModule.useCallback(function(p1, p2, p3) --[[ Line: 47 ]]
		-- upvalues: FFlagMomentsReactFeatureGate (upval), NoFFlagMomentsReactFeatureGate (copy), Store (copy), ReactionTruthTableModule (upval), UseFeedOptionalResult (copy), SignalActionTypeModule (upval), UseReactionEffectsResult (copy)
		if FFlagMomentsReactFeatureGate and not NoFFlagMomentsReactFeatureGate then return end
		local DecideResult = ReactionTruthTableModule.decide(Store.getSelectedReaction(false), p1, p3)
		
		if DecideResult.action == "commit" and DecideResult.reaction ~= nil then
			Store.commitReaction(DecideResult.reaction)
		elseif DecideResult.action == "clear" then
			Store.clearReaction()
		end
		if UseFeedOptionalResult ~= nil and DecideResult.action ~= "none" then
			local Data = Store.getData(false)
			local FeedItemId = Data.feedItemId
			
			if FeedItemId ~= nil and FeedItemId ~= "" then
				local config = { itemId = FeedItemId, tracingId = Data.feedSessionId }
				local Success, Result = pcall(function() --[[ Line: 75 ]]
					-- upvalues: DecideResult (copy), UseFeedOptionalResult (upval), SignalActionTypeModule (upval), config (copy)
					if DecideResult.action == "commit" and DecideResult.reaction ~= nil then
						UseFeedOptionalResult.logAction(SignalActionTypeModule.AddReaction, config, { reactionType = DecideResult.reaction })
						
						return
					end
					if DecideResult.action == "clear" then
						UseFeedOptionalResult.logAction(SignalActionTypeModule.RemoveReaction, config, {})
					end
				end)
				
				if not Success then
					warn("Failed to log reaction action event", Result)
				end
			end
		end
		if UseReactionEffectsResult ~= nil and DecideResult.effectReaction ~= nil then
			UseReactionEffectsResult.spawnExplosion(DecideResult.effectReaction, p2)
		end
	end, {
		Store,
		UseReactionEffectsResult,
		UseFeedOptionalResult,
		NoFFlagMomentsReactFeatureGate
	})
end