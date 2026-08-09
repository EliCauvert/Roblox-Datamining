local socialCards = script:FindFirstAncestor("SocialCards")
local parent = socialCards.Parent
local createLazyComponent = require(parent.RoactUtils).Components.createLazyComponent

return {
	CardComponent = {
		scheduled_group_up = if require(parent.SharedFlags).FFlagEnableScheduledSquads then createLazyComponent(function() --[[ line: 12 ]]
			-- upvalues: socialCards (ref)
			return require(socialCards.Components).ScheduledSquadCard
		end) else nil,
		group_up = createLazyComponent(function() --[[ line: 16 ]]
			-- upvalues: socialCards (ref)
			return require(socialCards.Components).SquadCard.SquadCard
		end)
	}
}