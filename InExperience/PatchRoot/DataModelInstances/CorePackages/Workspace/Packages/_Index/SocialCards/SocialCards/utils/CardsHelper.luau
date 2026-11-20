local SocialCards = script:FindFirstAncestor("SocialCards")
local Parent = SocialCards.Parent
local FFlagEnableCallCardModule = require(SocialCards.Flags.FFlagEnableCallCard)
local FFlagEnableExperienceInviteCard = require(Parent.SharedFlags).FFlagEnableExperienceInviteCard
local CreateLazyComponentFunction = require(Parent.RoactUtils).Components.createLazyComponent
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
if FFlagEnableExperienceInviteCard then
	CardComponent.experience_invite = CreateLazyComponentFunction(function()
		-- upvalues: SocialCards (copy)
		return require(SocialCards.Components.ExperienceInviteCard)
	end)
end
return { CardComponent = CardComponent }