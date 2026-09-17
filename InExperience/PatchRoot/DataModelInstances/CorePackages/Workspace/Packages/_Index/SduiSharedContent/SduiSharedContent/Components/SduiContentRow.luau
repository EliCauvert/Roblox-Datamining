local sduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local parent = sduiSharedContent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)
local fFlagSduiContentRowStateLayerModule = require(sduiSharedContent.Flags.FFlagSduiContentRowStateLayer)
local view = foundationModule.View

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), view (ref), fFlagSduiContentRowStateLayerModule (ref), foundationModule (ref)
	return reactModule.createElement(view, {
		tag = if p1.tag then p1.tag else "row auto-y gap-large",
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		ZIndex = p1.zIndex,
		Active = p1.onActivated ~= nil,
		onActivated = p1.onActivated,
		selection = { Selectable = false },
		stateLayer = {
			affordance = if fFlagSduiContentRowStateLayerModule then p1.stateLayerAffordance or foundationModule.Enums.StateLayerAffordance.None else foundationModule.Enums.StateLayerAffordance.None
		},
		testId = p1.testId
	}, {
		LeadingColumn = if p1.leading then reactModule.createElement(view, { LayoutOrder = 1, tag = p1.leadingTag or "col auto-xy" }, p1.leading) else nil,
		ContentColumn = if p1.content then reactModule.createElement(view, {
			LayoutOrder = 2,
			tag = p1.contentTag or "col fill gap-small auto-xy"
		}, p1.content) else nil,
		TrailingColumn = if p1.trailing then reactModule.createElement(view, { LayoutOrder = 3, tag = p1.trailingTag or "col auto-xy" }, p1.trailing) else nil
	})
end)