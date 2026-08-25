local corePackagesService = game:GetService("CorePackages")
local cryoModule = require(corePackagesService.Packages.Cryo)
local parent = script.Parent.Parent

return require(corePackagesService.Packages.Rodux).createReducer({
	feedbackReason = 0,
	feedbackFlowState = require(parent.Resources.Constants).State.Default
}, {
	[require(parent.Actions.SetFeedbackFlowState).name] = function(p0, p1)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p0, { feedbackFlowState = p1.feedbackFlowState })
	end,
	[require(parent.Actions.SetFeedbackReason).name] = function(p2, p3)
		-- upvalues: cryoModule (ref)
		return cryoModule.Dictionary.join(p2, { feedbackReason = p3.feedbackReason })
	end
})