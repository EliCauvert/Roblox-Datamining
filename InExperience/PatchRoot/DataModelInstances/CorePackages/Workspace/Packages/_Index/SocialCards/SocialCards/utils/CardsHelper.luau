local SocialCards = script:FindFirstAncestor("SocialCards")
local CreateLazyComponentFunction = require(SocialCards.Parent.RoactUtils).Components.createLazyComponent

return {
	CardComponent = {
		scheduled_group_up = CreateLazyComponentFunction(function() --[[ Line: 9 ]]
			-- upvalues: SocialCards (copy)
			return require(SocialCards.Components).ScheduledSquadCard
		end),
		group_up = CreateLazyComponentFunction(function() --[[ Line: 12 ]]
			-- upvalues: SocialCards (copy)
			return require(SocialCards.Components).SquadCard.SquadCard
		end)
	}
}