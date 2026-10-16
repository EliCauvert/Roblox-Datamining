local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ColorModeModule = require(Foundation.Enums.ColorMode)
local FoundationModule = require(Foundation.Providers.Foundation)
local _ = require(Foundation.Providers.Preferences.PreferencesProvider)
local ViewModule = require(Foundation.Components.View)

return function(p1, Preferences, p2) --[[ Line: 12 ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy), ColorModeModule (copy), ViewModule (copy)
	return ReactModule.createElement(FoundationModule, {
		colorMode = p2 or ColorModeModule.Dark,
		preferences = Preferences
	}, {
		Content = ReactModule.createElement(ViewModule, { Size = UDim2.fromScale(1, 1) }, p1)
	})
end