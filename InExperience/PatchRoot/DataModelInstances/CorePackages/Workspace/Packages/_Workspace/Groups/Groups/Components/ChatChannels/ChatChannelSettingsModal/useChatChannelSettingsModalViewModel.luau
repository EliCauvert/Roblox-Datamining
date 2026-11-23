local Parent = script:FindFirstAncestor("Groups").Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ReactUtilsModule = require(Parent.ReactUtils)
local _ = require(script.Parent.Parent.ChatChannelSettingsFlow.ChatChannelSettingsFlowLayout)
local _ = require(script.Parent.ChatChannelSettingsModalView)

return function(Tbl)
	-- upvalues: FocusNavigationUtilsModule (copy), ReactUtilsModule (copy)
	local Copy = table.clone(Tbl)
	Copy.containerRef = ReactUtilsModule.useComposedRef(FocusNavigationUtilsModule.useFocusRoot({
		isAutoFocusRoot = true,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum.CentralOverlay
	}), Tbl.containerRef)
	
	return Copy
end