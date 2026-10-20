local SocialCards = script:FindFirstAncestor("SocialCards")
local Parent = SocialCards.Parent
local CreateLazyComponentFunction = require(Parent.RoactUtils).Components.createLazyComponent

return {
	CardComponent = {
		scheduled_group_up = if require(Parent.SharedFlags).FFlagEnableScheduledSquads then CreateLazyComponentFunction(function()
			-- upvalues: SocialCards (copy)
			return require(SocialCards.Components).ScheduledSquadCard
		end) else nil,
		group_up = CreateLazyComponentFunction(function()
			-- upvalues: SocialCards (copy)
			return require(SocialCards.Components).SquadCard.SquadCard
		end)
	}
}