local reactModule = require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.React)
local cancelUserSubscriptionRequestPromptModule = require(script.Parent.CancelUserSubscriptionRequestPrompt)
local useCancelUserSubscriptionRequestPromptPropsModule = require(script.Parent.useCancelUserSubscriptionRequestPromptProps)

return function() --[[ line: 8 | named "CancelUserSubscriptionRequestContainer" ]]
	-- upvalues: useCancelUserSubscriptionRequestPromptPropsModule (ref), reactModule (ref), cancelUserSubscriptionRequestPromptModule (ref)
	return reactModule.createElement(cancelUserSubscriptionRequestPromptModule, useCancelUserSubscriptionRequestPromptPropsModule())
end