local sduiCapabilities = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.SduiSharedUtilities).SduiCapabilities

return function() --[[ line: 8 | named "isPinShortcutAvailable" ]]
	-- upvalues: sduiCapabilities (ref)
	return sduiCapabilities.isEnabled("CAPABILITY_SUPPORTS_PIN_SHORTCUT_ACTION")
end