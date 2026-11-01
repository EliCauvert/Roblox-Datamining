local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local UserCtaAction = require(Parent.UserCtaCommon).Enums.UserCtaAction
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagJoinabilityCTARefactor = SharedFlagsModule.FFlagJoinabilityCTARefactor

return {
	[UserCtaAction.JoinExperience] = "Feature.Profile.Action.JoinGame",
	[UserCtaAction.PlayExperience] = if SharedFlagsModule.FFlagJoinabilityCTAContextCopy then "Feature.ExperienceDetails.PlayButtonText.Play" elseif FFlagJoinabilityCTARefactor then "Feature.Profile.Action.JoinGame" else nil,
	[UserCtaAction.Chat] = "Feature.Profile.Action.Chat",
	[UserCtaAction.ViewProfile] = "Feature.Profile.Action.ViewProfile",
	[UserCtaAction.UnlockExperience] = "Feature.ExperienceDetails.PlayButtonText.Unlock"
}