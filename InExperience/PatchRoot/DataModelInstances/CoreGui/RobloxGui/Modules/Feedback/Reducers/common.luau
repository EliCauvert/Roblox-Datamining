local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent

return require(corePackagesService.Packages.Rodux).createReducer({
	numFeedbackSubmissionAttempts = nil,
	showHelpModal = false,
	showOnboardingModal = true,
	sourceLanguageName = ""
}, {
	[require(parent.Actions.IncrementFeedbackSubmissionAttempts).name] = function(p0, p1) --[[ line: 22 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, {
			numFeedbackSubmissionAttempts = p1.numFeedbackSubmissionAttempts
		})
	end,
	[require(parent.Actions.ShowHelpModal).name] = function(p2, p3) --[[ line: 27 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { showHelpModal = p3.helpModalVisible })
	end,
	[require(parent.Actions.ShowOnboardingModal).name] = function(p4, p5) --[[ line: 32 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p4, { showOnboardingModal = p5.onboardingModalVisible })
	end,
	[require(parent.Actions.SetSourceLanguageName).name] = function(p6, p7) --[[ line: 37 ]]
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p6, { sourceLanguageName = p7.sourceLanguageName })
	end
})