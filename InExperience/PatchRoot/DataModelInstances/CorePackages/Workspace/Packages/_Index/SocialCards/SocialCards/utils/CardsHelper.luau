local socialCards = script:FindFirstAncestor("SocialCards")
local createLazyComponent = require(socialCards.Parent.RoactUtils).Components.createLazyComponent

return {
	CardComponent = {
		scheduled_group_up = createLazyComponent(function()
			-- upvalues: socialCards (ref)
			return require(socialCards.Components).ScheduledSquadCard
		end),
		group_up = createLazyComponent(function()
			-- upvalues: socialCards (ref)
			return require(socialCards.Components).SquadCard.SquadCard
		end)
	}
}