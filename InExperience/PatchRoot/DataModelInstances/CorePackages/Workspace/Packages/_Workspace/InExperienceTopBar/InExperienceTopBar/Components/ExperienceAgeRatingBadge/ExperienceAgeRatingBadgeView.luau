local Parent = script:FindFirstAncestor("InExperienceTopBar").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Badge = FoundationModule.Badge
local BadgeVariant = FoundationModule.Enums.BadgeVariant
local BadgeShape = FoundationModule.Enums.BadgeShape
local BadgeSize = FoundationModule.Enums.BadgeSize
local View = FoundationModule.View

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), Badge (copy), BadgeVariant (copy), BadgeShape (copy), BadgeSize (copy)
	return ReactModule.createElement(View, {
		tag = "row align-x-center align-y-center auto-xy",
		LayoutOrder = p1.layoutOrder,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = p1.onAbsolutePositionChanged
	}, {
		Rating = ReactModule.createElement(Badge, {
			text = `<b>{p1.text}</b>`,
			variant = BadgeVariant.Contrast,
			shape = BadgeShape.Pill,
			size = BadgeSize.Small
		})
	})
end