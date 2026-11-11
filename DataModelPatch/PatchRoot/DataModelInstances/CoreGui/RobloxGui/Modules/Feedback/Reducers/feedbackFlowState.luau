local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local Parent = script.Parent.Parent

return require(CorePackages.Packages.Rodux).createReducer({
	feedbackReason = 0,
	feedbackFlowState = require(Parent.Resources.Constants).State.Default
}, {
	[require(Parent.Actions.SetFeedbackFlowState).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { feedbackFlowState = p2.feedbackFlowState })
	end,
	[require(Parent.Actions.SetFeedbackReason).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { feedbackReason = p2.feedbackReason })
	end
})