local jest = require(script:FindFirstAncestor("AvatarSwitcher").Parent.Dev.JestGlobals).jest

return function()
	-- upvalues: jest (ref)
	local var1 = jest.fn()
	
	return {
		addUnifiedEventLogging = var1,
		sendAXCounterV2 = jest.fn(),
		useUnifiedEventListener = { useUnifiedEventListenerInExperience = jest.fn() },
		UnifiedEventLogEnums = {
			MarketplaceUnifiedAction = { UI_ELEMENT_CLICK = "UI_ELEMENT_CLICK" }
		}
	}, var1
end