local SocialCards = script:FindFirstAncestor("SocialCards")
local FFlagEnableCallCardModule = require(SocialCards.Flags.FFlagEnableCallCard)
local CreateLazyComponentFunction = require(SocialCards.Parent.RoactUtils).Components.createLazyComponent
local CardComponent = {
	scheduled_group_up = CreateLazyComponentFunction(function()
		-- upvalues: SocialCards (copy)
		return require(SocialCards.Components).ScheduledSquadCard
	end),
	group_up = CreateLazyComponentFunction(function()
		-- upvalues: SocialCards (copy)
		return require(SocialCards.Components).SquadCard.SquadCard
	end)
}

if FFlagEnableCallCardModule then
	CardComponent.call = CreateLazyComponentFunction(function()
		-- upvalues: SocialCards (copy)
		return require(SocialCards.Components.CallCard)
	end)
end
return { CardComponent = CardComponent }