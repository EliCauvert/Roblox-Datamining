local UseLocalizationFunction = require(script:FindFirstAncestor("Moments").Parent.Localization).Hooks.useLocalization
local config = {
	postingSnackbar = "Feature.Moments.Label.PostFeedbackPostingSnackbar",
	postingTitle = "Feature.Moments.Label.PostFeedbackPostingTitle",
	postingBody = "Feature.Moments.Label.PostFeedbackPostingBody",
	postingBadge = "Feature.Moments.Label.PostFeedbackPostingBadge",
	moderatedBadge = "Feature.Moments.Label.PostFeedbackModeratedBadge",
	liveTitle = "Notifications.Moments.Title.MomentPostSuccess",
	liveBody = "Notifications.Moments.Body.MomentPostSuccess",
	failedTitle = "Notifications.Moments.Title.MomentPostFailed",
	failedBody = "Notifications.Moments.Body.MomentPostFailed",
	moderatedTitle = "Notifications.Moments.Title.MomentPostModerated",
	moderatedBody = "Notifications.Moments.Body.MomentPostModerated",
	share = "Feature.SocialShare.Action.Share",
	dismiss = "CommonUI.Messages.Action.Dismiss"
}

return function()
	-- upvalues: UseLocalizationFunction (copy), config (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	
	return {
		postingSnackbar = UseLocalizationResult.postingSnackbar,
		postingTitle = UseLocalizationResult.postingTitle,
		postingBody = UseLocalizationResult.postingBody,
		moderatedTitle = UseLocalizationResult.moderatedTitle,
		moderatedBody = UseLocalizationResult.moderatedBody,
		postingBadge = UseLocalizationResult.postingBadge,
		moderatedBadge = UseLocalizationResult.moderatedBadge,
		liveTitle = UseLocalizationResult.liveTitle,
		liveBody = UseLocalizationResult.liveBody,
		failedTitle = UseLocalizationResult.failedTitle,
		failedBody = UseLocalizationResult.failedBody,
		share = UseLocalizationResult.share,
		dismiss = UseLocalizationResult.dismiss
	}
end