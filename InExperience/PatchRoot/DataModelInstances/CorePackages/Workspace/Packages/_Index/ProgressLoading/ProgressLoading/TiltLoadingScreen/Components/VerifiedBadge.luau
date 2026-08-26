local parent = script:FindFirstAncestor("TiltLoadingScreen").Parent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local icon = foundationModule.Icon
local enums = foundationModule.Enums

return function(p1)
	-- upvalues: reactModule (ref), view (ref), icon (ref), enums (ref)
	return reactModule.createElement(view, {
		tag = "auto-xy",
		testId = "tilt-verified-badge",
		LayoutOrder = p1.LayoutOrder
	}, {
		Backplate = reactModule.createElement(icon, {
			name = "verified-backplate",
			ZIndex = 1,
			variant = enums.IconVariant.Filled,
			size = enums.IconSize.Small,
			style = p1.backplateStyle
		}),
		Check = reactModule.createElement(icon, {
			name = "verified-check",
			ZIndex = 2,
			variant = enums.IconVariant.Filled,
			size = enums.IconSize.Small,
			style = p1.checkStyle
		})
	})
end