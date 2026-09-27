local parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View

return function(p1)
	-- upvalues: reactModule (ref), view (ref)
	return reactModule.createElement(view, {
		tag = "row align-x-right align-y-center gap-xsmall auto-xy",
		testId = "item-card-indicator-stack"
	}, {
		ItemCardIndicatorStackStatus = if p1.statusSlot then reactModule.cloneElement(p1.statusSlot, { LayoutOrder = 1 }) else nil,
		ItemCardIndicatorStackItemType = if p1.itemTypeSlot then reactModule.cloneElement(p1.itemTypeSlot, { LayoutOrder = 2 }) else nil
	})
end