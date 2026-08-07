local reactModule = require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.React)
local cancelUserSubscriptionSuccessPromptModule = require(script.Parent.CancelUserSubscriptionSuccessPrompt)
local useCancelUserSubscriptionSuccessPromptPropsModule = require(script.Parent.useCancelUserSubscriptionSuccessPromptProps)

return function() --[[ line: 8 | named "CancelUserSubscriptionSuccessContainer" ]]
	-- upvalues: useCancelUserSubscriptionSuccessPromptPropsModule (ref), reactModule (ref), cancelUserSubscriptionSuccessPromptModule (ref)
	return reactModule.createElement(cancelUserSubscriptionSuccessPromptModule, useCancelUserSubscriptionSuccessPromptPropsModule())
end