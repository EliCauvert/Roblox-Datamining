local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local GetFFlagMomentsAnalyticsSchemaIdentityFunction = require(Parent.MomentsCommon).Flags.GetFFlagMomentsAnalyticsSchemaIdentity
local MomentContextModule = require(script.Parent.Parent.MomentContext)
local ReactionTruthTableModule = require(script.Parent.reactionTruthTable)
local SignalActionTypeModule = require(Moments.Enums.SignalActionType)
local UseFeedOptionalFunction = require(Moments.Components.Feed.FeedContext).useFeedOptional
local UseReactionEffectsFunction = require(script.Parent.ReactionEffectsContext).useReactionEffects

return function()
	-- upvalues: MomentContextModule (copy), UseReactionEffectsFunction (copy), UseFeedOptionalFunction (copy), ReactModule (copy), ReactionTruthTableModule (copy), GetFFlagMomentsAnalyticsSchemaIdentityFunction (copy), SignalActionTypeModule (copy)
	local Store = MomentContextModule.useMoment().store
	local UseReactionEffectsResult = UseReactionEffectsFunction()
	local UseFeedOptionalResult = UseFeedOptionalFunction()
	
	return ReactModule.useCallback(function(p1, p2, p3)
		-- upvalues: Store (copy), ReactionTruthTableModule (upval), UseFeedOptionalResult (copy), GetFFlagMomentsAnalyticsSchemaIdentityFunction (upval), SignalActionTypeModule (upval), UseReactionEffectsResult (copy)
		local DecideResult = ReactionTruthTableModule.decide(Store.getSelectedReaction(false), p1, p3)
		
		if DecideResult.action == "commit" and DecideResult.reaction ~= nil then
			Store.commitReaction(DecideResult.reaction)
		elseif DecideResult.action == "clear" then
			Store.clearReaction()
		end
		if UseFeedOptionalResult ~= nil and DecideResult.action ~= "none" then
			local Data = Store.getData(false)
			local FeedItemIdRaw = if GetFFlagMomentsAnalyticsSchemaIdentityFunction() then Data.feedItemIdRaw else Data.feedItemId
			
			if FeedItemIdRaw ~= nil and FeedItemIdRaw ~= "" then
				local config = { itemId = FeedItemIdRaw, tracingId = Data.feedSessionId }
				local Success, Result = pcall(function()
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
	end, { Store, UseReactionEffectsResult, UseFeedOptionalResult })
end