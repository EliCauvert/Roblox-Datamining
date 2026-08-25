local reactModule = require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.React)
local cancelUserSubscriptionRequestPromptModule = require(script.Parent.CancelUserSubscriptionRequestPrompt)
local useCancelUserSubscriptionRequestPromptPropsModule = require(script.Parent.useCancelUserSubscriptionRequestPromptProps)

return function()
	-- upvalues: useCancelUserSubscriptionRequestPromptPropsModule (ref), reactModule (ref), cancelUserSubscriptionRequestPromptModule (ref)
	return reactModule.createElement(cancelUserSubscriptionRequestPromptModule, useCancelUserSubscriptionRequestPromptPropsModule())
end