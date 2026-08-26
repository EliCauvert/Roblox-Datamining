local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent

return require(corePackagesService.Packages.Rodux).createReducer({
	feedbackReason = 0,
	feedbackFlowState = require(parent.Resources.Constants).State.Default
}, {
	[require(parent.Actions.SetFeedbackFlowState).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { feedbackFlowState = p2.feedbackFlowState })
	end,
	[require(parent.Actions.SetFeedbackReason).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p1, { feedbackReason = p2.feedbackReason })
	end
})