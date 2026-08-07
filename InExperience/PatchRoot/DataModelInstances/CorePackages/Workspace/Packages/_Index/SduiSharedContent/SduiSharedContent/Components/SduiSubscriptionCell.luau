local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View

return reactModule.memo(function(p0) --[[ line: 49 | named "SduiSubscriptionCell" ]]
	-- upvalues: reactModule (ref), view (ref), foundationModule (ref)
	return reactModule.createElement(view, {
		tag = if p0.tag then p0.tag else "col size-full-0 auto-y gap-medium padding-medium bg-surface-100 radius-medium",
		LayoutOrder = p0.layoutOrder,
		Position = p0.position,
		ZIndex = p0.zIndex,
		Active = p0.onActivated ~= nil,
		onActivated = p0.onActivated,
		selection = { Selectable = false },
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		testId = p0.testId
	}, {
		ContentRowSlot = if p0.contentRowComponent then reactModule.createElement(view, {
			LayoutOrder = 1,
			tag = if p0.contentRowSlotTag then p0.contentRowSlotTag else "size-full-0 auto-y"
		}, p0.contentRowComponent) else nil,
		ButtonSlot = if p0.buttonComponent then reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = if p0.buttonSlotTag then p0.buttonSlotTag else "size-full-0 auto-y"
		}, p0.buttonComponent) else nil
	})
end)