local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), View (copy), FoundationModule (copy)
	return ReactModule.createElement(View, {
		tag = if p1.tag then p1.tag else "row auto-y gap-large",
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		ZIndex = p1.zIndex,
		Active = p1.onActivated ~= nil,
		onActivated = p1.onActivated,
		selection = { Selectable = false },
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		},
		testId = p1.testId
	}, {
		LeadingColumn = if p1.leading then ReactModule.createElement(View, { LayoutOrder = 1, tag = p1.leadingTag or "col auto-xy" }, p1.leading) else nil,
		ContentColumn = if p1.content then ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = p1.contentTag or "col fill gap-small auto-xy"
		}, p1.content) else nil,
		TrailingColumn = if p1.trailing then ReactModule.createElement(View, { LayoutOrder = 3, tag = p1.trailingTag or "col auto-xy" }, p1.trailing) else nil
	})
end)