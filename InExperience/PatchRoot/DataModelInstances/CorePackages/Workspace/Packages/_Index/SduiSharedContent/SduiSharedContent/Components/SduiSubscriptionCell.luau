local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), foundationModule (ref)
	return reactModule.createElement(view, {
		tag = if p1.tag then p1.tag else "col size-full-0 auto-y gap-medium padding-medium bg-surface-100 radius-medium",
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		ZIndex = p1.zIndex,
		Active = p1.onActivated ~= nil,
		onActivated = p1.onActivated,
		selection = { Selectable = false },
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		testId = p1.testId
	}, {
		ContentRowSlot = if p1.contentRowComponent then reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = if p1.contentRowSlotTag then p1.contentRowSlotTag else "size-full-0 auto-y"
		}, p1.contentRowComponent) else nil,
		ButtonSlot = if p1.buttonComponent then reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = if p1.buttonSlotTag then p1.buttonSlotTag else "size-full-0 auto-y"
		}, p1.buttonComponent) else nil
	})
end)