local jest = require(script:FindFirstAncestor("AvatarSwitcher").Parent.Dev.JestGlobals).jest

return function() --[[ line: 7 | named "createAnalyticsMock" ]]
	-- upvalues: jest (ref)
	local var0 = jest.fn()
	
	return {
		addUnifiedEventLogging = var0,
		sendAXCounterV2 = jest.fn(),
		useUnifiedEventListener = { useUnifiedEventListenerInExperience = jest.fn() },
		UnifiedEventLogEnums = {
			MarketplaceUnifiedAction = { UI_ELEMENT_CLICK = "UI_ELEMENT_CLICK" }
		}
	}, var0
end