local Parent = script.Parent.Parent
local RoactModule = require(Parent.Parent.Roact)
local AppStyleProviderModule = require(Parent.App.Style.AppStyleProvider)
local FoundationProvider = require(Parent.Parent.Foundation).FoundationProvider
local _ = require(Parent.App.Style.StyleTypes)

return function(p1, Settings)
	-- upvalues: RoactModule (copy), FoundationProvider (copy), AppStyleProviderModule (copy)
	return RoactModule.createElement(FoundationProvider, {
		theme = "Dark",
		preferences = if Settings then {
			reducedMotion = Settings.reducedMotion,
			preferredTransparency = Settings.preferredTransparency
		} else nil
	}, RoactModule.createElement(AppStyleProviderModule, {
		style = {
			themeName = "Dark",
			fontName = "Gotham",
			settings = Settings
		}
	}, {
		Content = RoactModule.createElement("Frame", { Size = UDim2.new(1, 0, 1, 0) }, p1)
	}))
end