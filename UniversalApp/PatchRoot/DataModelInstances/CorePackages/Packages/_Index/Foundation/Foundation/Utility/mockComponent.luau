local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local colorModeModule = require(foundation.Enums.ColorMode)
local foundationModule = require(foundation.Providers.Foundation)
local _ = require(foundation.Providers.Preferences.PreferencesProvider)
local viewModule = require(foundation.Components.View)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), foundationModule (ref), colorModeModule (ref), viewModule (ref)
	return reactModule.createElement(foundationModule, { colorMode = p3 or colorModeModule.Dark, preferences = p2 }, {
		Content = reactModule.createElement(viewModule, { Size = UDim2.fromScale(1, 1) }, p1)
	})
end