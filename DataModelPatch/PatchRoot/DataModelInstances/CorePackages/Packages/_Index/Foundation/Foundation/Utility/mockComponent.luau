local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ThemeModule = require(Foundation.Enums.Theme)
local FoundationModule = require(Foundation.Providers.Foundation)
local _ = require(Foundation.Providers.Preferences.PreferencesProvider)
local ViewModule = require(Foundation.Components.View)

return function(p1, Preferences, p2)
	-- upvalues: ReactModule (copy), FoundationModule (copy), ThemeModule (copy), ViewModule (copy)
	return ReactModule.createElement(FoundationModule, {
		theme = p2 or ThemeModule.Dark,
		preferences = Preferences
	}, {
		Content = ReactModule.createElement(ViewModule, { Size = UDim2.fromScale(1, 1) }, p1)
	})
end