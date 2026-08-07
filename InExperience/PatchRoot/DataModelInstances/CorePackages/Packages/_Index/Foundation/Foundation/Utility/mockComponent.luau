local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local themeModule = require(foundation.Enums.Theme)
local foundationModule = require(foundation.Providers.Foundation)
local _ = require(foundation.Providers.Preferences.PreferencesProvider)
local viewModule = require(foundation.Components.View)

return function(p0, p1, p2) --[[ line: 12 ]]
	-- upvalues: reactModule (ref), foundationModule (ref), themeModule (ref), viewModule (ref)
	return reactModule.createElement(foundationModule, { theme = p2 or themeModule.Dark, preferences = p1 }, {
		Content = reactModule.createElement(viewModule, { Size = UDim2.fromScale(1, 1) }, p0)
	})
end