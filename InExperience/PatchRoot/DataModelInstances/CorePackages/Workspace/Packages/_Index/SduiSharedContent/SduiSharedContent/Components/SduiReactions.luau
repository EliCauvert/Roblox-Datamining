local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local ReactionsModule = require(Parent.Reactions)
local View = require(Parent.Foundation).View

return function(p1)
	-- upvalues: ReactionsModule (copy), ReactModule (copy), View (copy)
	local Elements = {}
	local LayoutOrder = 0
	local v1 = false
	local Reactions = p1.reactions or {}
	for _, reaction in Reactions do
		if ReactionsModule.Constants.ReactionIconMappings[reaction.reactionType] then
			local ReactionCount = if p1.areReactionCountsVisible then reaction.reactionCount or 0 else nil
			LayoutOrder += 1
			v1 = v1 or ReactionCount ~= 0
			Elements[`Reaction_{reaction.emoteId}`] = ReactModule.createElement(ReactionsModule.ReactionPill, {
				reactionType = reaction.reactionType,
				count = ReactionCount,
				isSelected = reaction.hasUserAppliedReaction,
				layoutOrder = LayoutOrder,
				testId = `reaction-{reaction.emoteId}`
			})
		end
	end
	return if v1 then ReactModule.createElement(View, {
		tag = "row wrap align-y-center gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, Elements) else nil
end