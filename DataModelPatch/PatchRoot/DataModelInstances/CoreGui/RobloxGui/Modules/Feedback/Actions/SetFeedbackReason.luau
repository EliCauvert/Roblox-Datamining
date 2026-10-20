return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(FeedbackReason)
	return { feedbackReason = FeedbackReason }
end)