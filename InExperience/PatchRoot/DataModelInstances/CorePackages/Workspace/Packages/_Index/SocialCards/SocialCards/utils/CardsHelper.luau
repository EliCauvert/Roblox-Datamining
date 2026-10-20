local SocialCards = script:FindFirstAncestor("SocialCards")
local CreateLazyComponentFunction = require(SocialCards.Parent.RoactUtils).Components.createLazyComponent

return {
	CardComponent = {
		scheduled_group_up = CreateLazyComponentFunction(function()
			-- upvalues: SocialCards (copy)
			return require(SocialCards.Components).ScheduledSquadCard
		end),
		group_up = CreateLazyComponentFunction(function()
			-- upvalues: SocialCards (copy)
			return require(SocialCards.Components).SquadCard.SquadCard
		end)
	}
}