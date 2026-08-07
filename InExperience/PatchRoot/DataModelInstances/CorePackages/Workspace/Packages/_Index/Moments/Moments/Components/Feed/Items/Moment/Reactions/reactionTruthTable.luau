local thumbsUp = require(script:FindFirstAncestor("Moments").Parent.MomentsCommon).Enums.ReactionType.ThumbsUp

return {
	DEFAULT_REACTION = thumbsUp,
	decide = function(p0, p1, p2) --[[ line: 40 ]]
		-- upvalues: thumbsUp (ref)
		local var0 = p0 ~= nil
		
		if p1 == "tapButton" then
			return if var0 then { action = "clear", reaction = nil, effectReaction = nil } else {
				action = "commit",
				reaction = thumbsUp,
				effectReaction = thumbsUp
			}
		elseif p1 == "doubleTap" then
			return if var0 then { action = "none", reaction = nil, effectReaction = p0 } else {
				action = "commit",
				reaction = thumbsUp,
				effectReaction = thumbsUp
			}
		end
		p2 = p2 or thumbsUp
		
		return if var0 and p2 == p0 then { action = "clear", reaction = nil, effectReaction = nil } else { action = "commit", reaction = p2, effectReaction = p2 }
	end
}