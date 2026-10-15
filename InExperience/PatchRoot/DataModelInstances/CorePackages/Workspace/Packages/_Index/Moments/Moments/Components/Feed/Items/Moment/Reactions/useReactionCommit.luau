local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local fFlagMomentsReactFeatureGate = require(parent.SharedFlags).FFlagMomentsReactFeatureGate
local momentContextModule = require(script.Parent.Parent.MomentContext)
local reactionEffectsContextModule = require(script.Parent.ReactionEffectsContext)
local reactionTruthTableModule = require(script.Parent.reactionTruthTable)
local signalActionTypeModule = require(moments.Enums.SignalActionType)
local useFeedOptional = require(moments.Components.Feed.FeedContext).useFeedOptional
local getMomentsCapabilities = momentsCommonModule.Stores.GetMomentsCapabilities
local useReactionEffects = reactionEffectsContextModule.useReactionEffects

return function()
	-- upvalues: momentContextModule (ref), useReactionEffects (ref), useFeedOptional (ref), fFlagMomentsReactFeatureGate (ref), signalsReactModule (ref), getMomentsCapabilities (ref), reactModule (ref), reactionTruthTableModule (ref), signalActionTypeModule (ref)
	local store = momentContextModule.useMoment().store
	local var1 = useReactionEffects()
	local var2 = useFeedOptional()
	local var3 = if fFlagMomentsReactFeatureGate then signalsReactModule.useSignalState(getMomentsCapabilities(false).getCanReactToMoments) else true
	
	return reactModule.useCallback(function(p1, p2, p3)
		-- upvalues: fFlagMomentsReactFeatureGate (copy), var3 (ref), store (ref), reactionTruthTableModule (copy), var2 (ref), signalActionTypeModule (copy), var1 (ref)
		if fFlagMomentsReactFeatureGate and not var3 then return end
		local var4 = reactionTruthTableModule.decide(store.getSelectedReaction(false), p1, p3)
		
		if var4.action == "commit" and var4.reaction ~= nil then
			store.commitReaction(var4.reaction)
		elseif var4.action == "clear" then
			store.clearReaction()
		end
		if var2 ~= nil and var4.action ~= "none" then
			local data = store.getData(false)
			local feedItemId = data.feedItemId
			
			if feedItemId ~= nil and feedItemId ~= "" then
				local t = { itemId = feedItemId, tracingId = data.feedSessionId }
				local ok, status = pcall(function()
					-- upvalues: var4 (ref), var2 (copy), signalActionTypeModule (copy), t (ref)
					if var4.action == "commit" and var4.reaction ~= nil then
						var2.logAction(signalActionTypeModule.AddReaction, t, { reactionType = var4.reaction })
						
						return
					elseif var4.action == "clear" then
						var2.logAction(signalActionTypeModule.RemoveReaction, t, {})
					end
				end)
				
				if not ok then
					warn("Failed to log reaction action event", status)
				end
			end
		end
		if var1 ~= nil and var4.effectReaction ~= nil then
			var1.spawnExplosion(var4.effectReaction, p2)
		end
	end, { store, var1, var2, var3 })
end