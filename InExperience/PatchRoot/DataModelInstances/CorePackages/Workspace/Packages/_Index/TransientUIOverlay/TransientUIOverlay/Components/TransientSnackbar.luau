local TransientUIOverlay = script:FindFirstAncestor("TransientUIOverlay")
local Parent = TransientUIOverlay.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local FoundationProvider = FoundationModule.FoundationProvider
local Snackbar = FoundationModule.Snackbar
local View = FoundationModule.View
local UsePreferencesFunction = FoundationModule.Hooks.usePreferences
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = require(TransientUIOverlay.Types)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UsePreferencesFunction (copy), ReactModule (copy), Snackbar (copy), View (copy), FoundationProvider (copy)
	local UseTokensResult = UseTokensFunction()
	local UsePreferencesResult = UsePreferencesFunction()
	local Element = ReactModule.createElement(View, {
		tag = "anchor-bottom-center auto-xy",
		testId = "transient-snackbar-anchor",
		Position = UDim2.new(0.5, 0, 1, -UseTokensResult.Padding.XLarge)
	}, {
		Snackbar = ReactModule.createElement(Snackbar, {
			LayoutOrder = 1,
			testId = "transient-snackbar",
			title = p1.title,
			icon = p1.icon,
			action = if p1.actionText then {
				text = p1.actionText,
				onActivated = p1.onAction or function() end
			} else nil
		})
	})
	
	return if p1.colorMode == nil then Element else ReactModule.createElement("Folder", nil, {
		Provider = ReactModule.createElement(FoundationProvider, {
			colorMode = p1.colorMode,
			device = p1.device,
			preferences = {
				preferredTextSize = UsePreferencesResult.preferredTextSize,
				preferredTransparency = UsePreferencesResult.preferredTransparency,
				reducedMotion = UsePreferencesResult.reducedMotion
			}
		}, { Anchor = Element })
	})
end