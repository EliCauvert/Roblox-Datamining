local sduiCapabilities = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.SduiSharedUtilities).SduiCapabilities

return function()
	-- upvalues: sduiCapabilities (ref)
	return sduiCapabilities.isEnabled("CAPABILITY_SUPPORTS_PIN_SHORTCUT_ACTION")
end