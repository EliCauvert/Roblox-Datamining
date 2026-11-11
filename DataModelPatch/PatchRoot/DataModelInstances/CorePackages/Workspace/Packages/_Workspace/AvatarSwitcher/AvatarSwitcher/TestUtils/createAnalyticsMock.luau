local Jest = require(script:FindFirstAncestor("AvatarSwitcher").Parent.Dev.JestGlobals).jest

return function()
	-- upvalues: Jest (copy)
	local FnResult = Jest.fn()
	
	return {
		addUnifiedEventLogging = FnResult,
		sendAXCounterV2 = Jest.fn(),
		useUnifiedEventListener = { useUnifiedEventListenerInExperience = Jest.fn() },
		UnifiedEventLogEnums = {
			MarketplaceUnifiedAction = { UI_ELEMENT_CLICK = "UI_ELEMENT_CLICK" }
		}
	}, FnResult
end