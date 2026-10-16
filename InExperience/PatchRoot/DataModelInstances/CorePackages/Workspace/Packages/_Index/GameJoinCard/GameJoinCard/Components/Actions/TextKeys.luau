local UserCtaAction = require(script:FindFirstAncestor("GameJoinCard").Parent.UserCtaCommon).Enums.UserCtaAction

return {
	[UserCtaAction.JoinExperience] = "Feature.Profile.Action.JoinGame",
	[UserCtaAction.PlayExperience] = "Feature.ExperienceDetails.PlayButtonText.Play",
	[UserCtaAction.Chat] = "Feature.Profile.Action.Chat",
	[UserCtaAction.ViewProfile] = "Feature.Profile.Action.ViewProfile",
	[UserCtaAction.UnlockExperience] = "Feature.ExperienceDetails.PlayButtonText.Unlock"
}