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

return function() --[[ line: 31 | named "useReactionCommit" ]]
	-- upvalues: momentContextModule (ref), useReactionEffects (ref), useFeedOptional (ref), reactModule (ref), reactionTruthTableModule (ref), signalActionTypeModule (ref)
	local store = momentContextModule.useMoment().store
	local var6 = useReactionEffects()
	local var7 = useFeedOptional()
	
	return reactModule.useCallback(function(p0, p1, p2) --[[ line: 40 ]]
		-- upvalues: store (ref), reactionTruthTableModule (copy), var7 (ref), signalActionTypeModule (copy), var6 (ref)
		local var8 = reactionTruthTableModule.decide(store.getSelectedReaction(false), p0, p2)
		
		if var8.action == "commit" and var8.reaction ~= nil then
			store.commitReaction(var8.reaction)
		elseif var8.action == "clear" then
			store.clearReaction()
		end
		if var7 ~= nil and var8.action ~= "none" then
			local data = store.getData(false)
			local feedItemId = data.feedItemId
			
			if feedItemId ~= nil and feedItemId ~= "" then
				local t = { itemId = feedItemId, tracingId = data.feedSessionId }
				local ok, status = pcall(function() --[[ line: 62 ]]
					-- upvalues: var8 (ref), var7 (copy), signalActionTypeModule (copy), t (ref)
					if var8.action == "commit" and var8.reaction ~= nil then
						var7.logAction(signalActionTypeModule.AddReaction, t, { reactionType = var8.reaction })
						
						return
					elseif var8.action == "clear" then
						var7.logAction(signalActionTypeModule.RemoveReaction, t, {})
					end
				end)
				
				if not ok then
					warn("Failed to log reaction action event", status)
				end
			end
		end
		if var6 ~= nil and var8.effectReaction ~= nil then
			var6.spawnExplosion(var8.effectReaction, p1)
		end
	end, { store, var6, var7 })
end