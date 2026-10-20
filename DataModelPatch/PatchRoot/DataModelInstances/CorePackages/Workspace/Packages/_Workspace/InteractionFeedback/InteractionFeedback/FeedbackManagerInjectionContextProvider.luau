local Parent = script:FindFirstAncestor("InteractionFeedback").Parent
local FeedbackManagerInjectionContext = require(Parent.UIBlox).Core.Control.FeedbackManagerInjectionContext
local ReactModule = require(Parent.React)
local UseTriggerFeedbackModule = require(script.Parent.useTriggerFeedback)

return function(p1)
	-- upvalues: UseTriggerFeedbackModule (copy), ReactModule (copy), FeedbackManagerInjectionContext (copy)
	return ReactModule.createElement(FeedbackManagerInjectionContext.Provider, { value = UseTriggerFeedbackModule() }, p1.children)
end