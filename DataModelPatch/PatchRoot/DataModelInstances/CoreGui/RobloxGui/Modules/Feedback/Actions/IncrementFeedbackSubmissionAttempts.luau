return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(NumFeedbackSubmissionAttempts)
	return {
		numFeedbackSubmissionAttempts = NumFeedbackSubmissionAttempts
	}
end)