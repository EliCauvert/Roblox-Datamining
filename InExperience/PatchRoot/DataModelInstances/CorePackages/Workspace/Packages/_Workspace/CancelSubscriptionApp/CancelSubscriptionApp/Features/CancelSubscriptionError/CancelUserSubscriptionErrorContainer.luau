local reactModule = require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.React)
local cancelUserSubscriptionErrorPromptModule = require(script.Parent.CancelUserSubscriptionErrorPrompt)
local useCancelUserSubscriptionErrorPromptPropsModule = require(script.Parent.useCancelUserSubscriptionErrorPromptProps)

return function() --[[ line: 8 | named "CancelUserSubscriptionErrorContainer" ]]
	-- upvalues: useCancelUserSubscriptionErrorPromptPropsModule (ref), reactModule (ref), cancelUserSubscriptionErrorPromptModule (ref)
	return reactModule.createElement(cancelUserSubscriptionErrorPromptModule, useCancelUserSubscriptionErrorPromptPropsModule())
end