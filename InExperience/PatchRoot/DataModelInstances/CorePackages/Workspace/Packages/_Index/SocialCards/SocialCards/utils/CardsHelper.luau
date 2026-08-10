local socialCards = script:FindFirstAncestor("SocialCards")
local createLazyComponent = require(socialCards.Parent.RoactUtils).Components.createLazyComponent

return {
	CardComponent = {
		scheduled_group_up = createLazyComponent(function() --[[ line: 9 ]]
			-- upvalues: socialCards (ref)
			return require(socialCards.Components).ScheduledSquadCard
		end),
		group_up = createLazyComponent(function() --[[ line: 12 ]]
			-- upvalues: socialCards (ref)
			return require(socialCards.Components).SquadCard.SquadCard
		end)
	}
}