local ThumbsUp = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon).Enums.ReactionType.ThumbsUp

return {
	DEFAULT_REACTION = ThumbsUp,
	decide = function(EffectReaction, p1, p2) --[[ Line: 40 ]]
		-- upvalues: ThumbsUp (copy)
		local HasEffectReaction = EffectReaction ~= nil
		
		if p1 == "tapButton" then
			return if HasEffectReaction then { action = "clear", reaction = nil, effectReaction = nil } else {
				action = "commit",
				reaction = ThumbsUp,
				effectReaction = ThumbsUp
			}
		elseif p1 == "doubleTap" then
			return if HasEffectReaction then {
				action = "none",
				reaction = nil,
				effectReaction = EffectReaction
			} else {
				action = "commit",
				reaction = ThumbsUp,
				effectReaction = ThumbsUp
			}
		else
			local P2 = p2 or ThumbsUp
			
			return if HasEffectReaction and P2 == EffectReaction then { action = "clear", reaction = nil, effectReaction = nil } else { action = "commit", reaction = P2, effectReaction = P2 }
		end
	end
}