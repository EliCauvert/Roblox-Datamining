local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View

return function(p1) --[[ Line: 14 | Named "ItemCardIndicatorStack" ]]
	-- upvalues: ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		tag = "row align-x-right align-y-center gap-xsmall auto-xy",
		testId = "item-card-indicator-stack"
	}, {
		ItemCardIndicatorStackStatus = if p1.statusSlot then ReactModule.cloneElement(p1.statusSlot, { LayoutOrder = 1 }) else nil,
		ItemCardIndicatorStackItemType = if p1.itemTypeSlot then ReactModule.cloneElement(p1.itemTypeSlot, { LayoutOrder = 2 }) else nil
	})
end