local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local colorModeModule = require(foundation.Enums.ColorMode)
local foundationModule = require(foundation.Providers.Foundation)
local _ = require(foundation.Providers.Preferences.PreferencesProvider)
local viewModule = require(foundation.Components.View)

return function(p0, p1, p2)
	-- upvalues: reactModule (ref), foundationModule (ref), colorModeModule (ref), viewModule (ref)
	return reactModule.createElement(foundationModule, { colorMode = p2 or colorModeModule.Dark, preferences = p1 }, {
		Content = reactModule.createElement(viewModule, { Size = UDim2.fromScale(1, 1) }, p0)
	})
end