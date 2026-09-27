local userCtaAction = require(script:FindFirstAncestor("GameJoinCard").Parent.UserCtaCommon).Enums.UserCtaAction

return {
	[userCtaAction.JoinExperience] = "Feature.Profile.Action.JoinGame",
	[userCtaAction.PlayExperience] = "Feature.ExperienceDetails.PlayButtonText.Play",
	[userCtaAction.Chat] = "Feature.Profile.Action.Chat",
	[userCtaAction.ViewProfile] = "Feature.Profile.Action.ViewProfile",
	[userCtaAction.UnlockExperience] = "Feature.ExperienceDetails.PlayButtonText.Unlock"
}