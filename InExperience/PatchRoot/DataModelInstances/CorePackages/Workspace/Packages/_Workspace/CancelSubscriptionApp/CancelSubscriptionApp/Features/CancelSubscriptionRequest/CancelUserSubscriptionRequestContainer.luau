local ReactModule = require(script:FindFirstAncestor("CancelSubscriptionApp").Parent.React)
local CancelUserSubscriptionRequestPromptModule = require(script.Parent.CancelUserSubscriptionRequestPrompt)
local UseCancelUserSubscriptionRequestPromptPropsModule = require(script.Parent.useCancelUserSubscriptionRequestPromptProps)

return function()
	-- upvalues: UseCancelUserSubscriptionRequestPromptPropsModule (copy), ReactModule (copy), CancelUserSubscriptionRequestPromptModule (copy)
	return ReactModule.createElement(CancelUserSubscriptionRequestPromptModule, (UseCancelUserSubscriptionRequestPromptPropsModule()))
end