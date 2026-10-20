local ReactModule = require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.React)
local CancelUserSubscriptionSuccessPromptModule = require(script.Parent.CancelUserSubscriptionSuccessPrompt)
local UseCancelUserSubscriptionSuccessPromptPropsModule = require(script.Parent.useCancelUserSubscriptionSuccessPromptProps)

return function()
	-- upvalues: UseCancelUserSubscriptionSuccessPromptPropsModule (copy), ReactModule (copy), CancelUserSubscriptionSuccessPromptModule (copy)
	return ReactModule.createElement(CancelUserSubscriptionSuccessPromptModule, (UseCancelUserSubscriptionSuccessPromptPropsModule()))
end