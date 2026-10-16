local SduiCapabilities = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.SduiSharedUtilities).SduiCapabilities

return function() --[[ Line: 8 | Named "isPinShortcutAvailable" ]]
	-- upvalues: SduiCapabilities (copy)
	return SduiCapabilities.isEnabled("CAPABILITY_SUPPORTS_PIN_SHORTCUT_ACTION")
end