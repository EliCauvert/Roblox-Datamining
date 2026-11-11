local ReactionType = require(script:FindFirstAncestor("AppChat").Parent.Reactions).Enums.ReactionType

return {
	PICKER_REACTION_ORDER = {
		ReactionType.ThumbsUp, ReactionType.Heart, ReactionType.LaughJoy,
		ReactionType.Wow, ReactionType.Cry, ReactionType.Fire, ReactionType.Skull
	}
}