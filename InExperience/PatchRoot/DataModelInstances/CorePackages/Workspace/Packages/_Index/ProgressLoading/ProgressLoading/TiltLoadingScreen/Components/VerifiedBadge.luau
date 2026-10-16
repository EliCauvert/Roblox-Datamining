local Parent = script:FindFirstAncestor("TiltLoadingScreen").Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local Enums = FoundationModule.Enums

return function(Frame) --[[ Line: 22 | Named "VerifiedBadge" ]]
	-- upvalues: ReactModule (copy), View (copy), Icon (copy), Enums (copy)
	return ReactModule.createElement(View, {
		tag = "auto-xy",
		testId = "tilt-verified-badge",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Backplate = ReactModule.createElement(Icon, {
			name = "verified-backplate",
			ZIndex = 1,
			variant = Enums.IconVariant.Filled,
			size = Enums.IconSize.Small,
			style = Frame.backplateStyle
		}),
		Check = ReactModule.createElement(Icon, {
			name = "verified-check",
			ZIndex = 2,
			variant = Enums.IconVariant.Filled,
			size = Enums.IconSize.Small,
			style = Frame.checkStyle
		})
	})
end