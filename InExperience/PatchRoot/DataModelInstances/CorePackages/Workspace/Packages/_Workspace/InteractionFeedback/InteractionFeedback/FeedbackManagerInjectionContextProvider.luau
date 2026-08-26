local parent = script:FindFirstAncestor("InteractionFeedback").Parent
local feedbackManagerInjectionContext = require(parent.UIBlox).Core.Control.FeedbackManagerInjectionContext
local reactModule = require(parent.React)
local useTriggerFeedbackModule = require(script.Parent.useTriggerFeedback)

return function(p1)
	-- upvalues: useTriggerFeedbackModule (ref), reactModule (ref), feedbackManagerInjectionContext (ref)
	return reactModule.createElement(feedbackManagerInjectionContext.Provider, { value = useTriggerFeedbackModule() }, p1.children)
end