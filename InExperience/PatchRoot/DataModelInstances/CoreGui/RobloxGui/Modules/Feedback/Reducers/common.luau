local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent

return require(corePackagesService.Packages.Rodux).createReducer({
	numFeedbackSubmissionAttempts = nil,
	showHelpModal = false,
	showOnboardingModal = true,
	sourceLanguageName = ""
}, {
	[require(parent.Actions.IncrementFeedbackSubmissionAttempts).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, {
			numFeedbackSubmissionAttempts = p2.numFeedbackSubmissionAttempts
		})
	end,
	[require(parent.Actions.ShowHelpModal).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { showHelpModal = p2.helpModalVisible })
	end,
	[require(parent.Actions.ShowOnboardingModal).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { showOnboardingModal = p2.onboardingModalVisible })
	end,
	[require(parent.Actions.SetSourceLanguageName).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { sourceLanguageName = p2.sourceLanguageName })
	end
})