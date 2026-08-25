local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View

return reactModule.memo(function(p0)
	-- upvalues: reactModule (ref), view (ref), foundationModule (ref)
	return reactModule.createElement(view, {
		tag = if p0.tag then p0.tag else "row auto-y gap-large",
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
		LeadingColumn = if p0.leading then reactModule.createElement(view, { LayoutOrder = 1, tag = p0.leadingTag or "col auto-xy" }, p0.leading) else nil,
		ContentColumn = if p0.content then reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = p0.contentTag or "col fill gap-small auto-xy"
		}, p0.content) else nil,
		TrailingColumn = if p0.trailing then reactModule.createElement(view, { LayoutOrder = 3, tag = p0.trailingTag or "col auto-xy" }, p0.trailing) else nil
	})
end)