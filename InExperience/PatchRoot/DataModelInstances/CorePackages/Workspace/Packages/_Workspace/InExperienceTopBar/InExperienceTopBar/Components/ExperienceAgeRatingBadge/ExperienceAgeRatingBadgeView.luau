local parent = script:FindFirstAncestor("InExperienceTopBar").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local badge = foundationModule.Badge
local badgeVariant = foundationModule.Enums.BadgeVariant
local badgeShape = foundationModule.Enums.BadgeShape
local badgeSize = foundationModule.Enums.BadgeSize
local view = foundationModule.View

return function(p1)
	-- upvalues: reactModule (ref), view (ref), badge (ref), badgeVariant (ref), badgeShape (ref), badgeSize (ref)
	return reactModule.createElement(view, {
		tag = "row align-x-center align-y-center auto-xy",
		LayoutOrder = p1.layoutOrder,
		onAbsoluteSizeChanged = p1.onAbsoluteSizeChanged,
		onAbsolutePositionChanged = p1.onAbsolutePositionChanged
	}, {
		Rating = reactModule.createElement(badge, {
			text = `<b>{p1.text}</b>`,
			variant = badgeVariant.Contrast,
			shape = badgeShape.Pill,
			size = badgeSize.Small
		})
	})
end