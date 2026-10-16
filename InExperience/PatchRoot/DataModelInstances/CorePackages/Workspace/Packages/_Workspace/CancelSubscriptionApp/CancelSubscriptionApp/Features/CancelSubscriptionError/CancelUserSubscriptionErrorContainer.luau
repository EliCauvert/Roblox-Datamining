local ReactModule = require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.React)
local CancelUserSubscriptionErrorPromptModule = require(script.Parent.CancelUserSubscriptionErrorPrompt)
local UseCancelUserSubscriptionErrorPromptPropsModule = require(script.Parent.useCancelUserSubscriptionErrorPromptProps)

return function() --[[ Line: 8 | Named "CancelUserSubscriptionErrorContainer" ]]
	-- upvalues: UseCancelUserSubscriptionErrorPromptPropsModule (copy), ReactModule (copy), CancelUserSubscriptionErrorPromptModule (copy)
	return ReactModule.createElement(CancelUserSubscriptionErrorPromptModule, (UseCancelUserSubscriptionErrorPromptPropsModule()))
end