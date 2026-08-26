local thumbsUp = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon).Enums.ReactionType.ThumbsUp

return {
	DEFAULT_REACTION = thumbsUp,
	decide = function(p1, p2, p3)
		-- upvalues: thumbsUp (ref)
		local var1 = p1 ~= nil
		
		if p2 == "tapButton" then
			return if var1 then { action = "clear", reaction = nil, effectReaction = nil } else {
				action = "commit",
				reaction = thumbsUp,
				effectReaction = thumbsUp
			}
		elseif p2 == "doubleTap" then
			return if var1 then { action = "none", reaction = nil, effectReaction = p1 } else {
				action = "commit",
				reaction = thumbsUp,
				effectReaction = thumbsUp
			}
		end
		p3 = p3 or thumbsUp
		
		return if var1 and p3 == p1 then { action = "clear", reaction = nil, effectReaction = nil } else { action = "commit", reaction = p3, effectReaction = p3 }
	end
}