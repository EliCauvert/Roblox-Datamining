return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(FeedbackFlowState)
	return { feedbackFlowState = FeedbackFlowState }
end)