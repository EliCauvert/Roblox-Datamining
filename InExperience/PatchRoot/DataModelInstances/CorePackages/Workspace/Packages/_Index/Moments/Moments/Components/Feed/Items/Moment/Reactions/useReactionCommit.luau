local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local _ = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local momentContextModule = require(script.Parent.Parent.MomentContext)
local reactionEffectsContextModule = require(script.Parent.ReactionEffectsContext)
local reactionTruthTableModule = require(script.Parent.reactionTruthTable)
local signalActionTypeModule = require(moments.Enums.SignalActionType)
local useFeedOptional = require(moments.Components.Feed.FeedContext).useFeedOptional
local useReactionEffects = reactionEffectsContextModule.useReactionEffects

return function()
	-- upvalues: momentContextModule (ref), useReactionEffects (ref), useFeedOptional (ref), reactModule (ref), reactionTruthTableModule (ref), signalActionTypeModule (ref)
	local store = momentContextModule.useMoment().store
	local var1 = useReactionEffects()
	local var2 = useFeedOptional()
	
	return reactModule.useCallback(function(p1, p2, p3)
		-- upvalues: store (ref), reactionTruthTableModule (copy), var2 (ref), signalActionTypeModule (copy), var1 (ref)
		local var3 = reactionTruthTableModule.decide(store.getSelectedReaction(false), p1, p3)
		
		if var3.action == "commit" and var3.reaction ~= nil then
			store.commitReaction(var3.reaction)
		elseif var3.action == "clear" then
			store.clearReaction()
		end
		if var2 ~= nil and var3.action ~= "none" then
			local data = store.getData(false)
			local feedItemId = data.feedItemId
			
			if feedItemId ~= nil and feedItemId ~= "" then
				local t = { itemId = feedItemId, tracingId = data.feedSessionId }
				local ok, status = pcall(function()
					-- upvalues: var3 (ref), var2 (copy), signalActionTypeModule (copy), t (ref)
					if var3.action == "commit" and var3.reaction ~= nil then
						var2.logAction(signalActionTypeModule.AddReaction, t, { reactionType = var3.reaction })
						
						return
					elseif var3.action == "clear" then
						var2.logAction(signalActionTypeModule.RemoveReaction, t, {})
					end
				end)
				
				if not ok then
					warn("Failed to log reaction action event", status)
				end
			end
		end
		if var1 ~= nil and var3.effectReaction ~= nil then
			var1.spawnExplosion(var3.effectReaction, p2)
		end
	end, { store, var1, var2 })
end