local parent = script.Parent.Parent
local roactModule = require(parent.Parent.Roact)
local appStyleProviderModule = require(parent.App.Style.AppStyleProvider)
local foundationProvider = require(parent.Parent.Foundation).FoundationProvider
local _ = require(parent.App.Style.StyleTypes)

return function(p0, p1)
	-- upvalues: roactModule (ref), foundationProvider (ref), appStyleProviderModule (ref)
	return roactModule.createElement(foundationProvider, {
		theme = "Dark",
		preferences = if p1 then {
			reducedMotion = p1.reducedMotion,
			preferredTransparency = p1.preferredTransparency
		} else nil
	}, roactModule.createElement(appStyleProviderModule, {
		style = { themeName = "Dark", fontName = "Gotham", settings = p1 }
	}, {
		Content = roactModule.createElement("Frame", { Size = UDim2.new(1, 0, 1, 0) }, p0)
	}))
end