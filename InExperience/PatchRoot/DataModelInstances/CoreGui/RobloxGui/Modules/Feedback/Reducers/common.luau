local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Parent = script.Parent.Parent

return require(CorePackages.Packages.Rodux).createReducer({
	numFeedbackSubmissionAttempts = nil,
	showHelpModal = false,
	showOnboardingModal = true,
	sourceLanguageName = ""
}, {
	[require(Parent.Actions.IncrementFeedbackSubmissionAttempts).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, {
			numFeedbackSubmissionAttempts = p2.numFeedbackSubmissionAttempts
		})
	end,
	[require(Parent.Actions.ShowHelpModal).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { showHelpModal = p2.helpModalVisible })
	end,
	[require(Parent.Actions.ShowOnboardingModal).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { showOnboardingModal = p2.onboardingModalVisible })
	end,
	[require(Parent.Actions.SetSourceLanguageName).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { sourceLanguageName = p2.sourceLanguageName })
	end
})