local sduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local parent = sduiSharedContent.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local _ = require(parent.SduiCompat)
local fFlagSduiContentRowStateLayerModule = require(sduiSharedContent.Flags.FFlagSduiContentRowStateLayer)
local fFlagSduiContentRowTrailingHover = require(parent.SharedFlags).FFlagSduiContentRowTrailingHover
local view = foundationModule.View
local controlState = foundationModule.Enums.ControlState

return reactModule.memo(function(p1)
	-- upvalues: fFlagSduiContentRowTrailingHover (ref), reactModule (ref), controlState (ref), view (ref), fFlagSduiContentRowStateLayerModule (ref), foundationModule (ref)
	local var1 = nil
	local var2 = nil
	
	if fFlagSduiContentRowTrailingHover then
		local var3, var4 = reactModule.useState(false)
		var1 = reactModule.useCallback(function(p2)
			-- upvalues: var4 (ref), controlState (copy)
			var4(if p2 ~= controlState.Hover then p2 == controlState.Pressed else true)
		end, {})
		var2 = if p1.trailingHover == nil or not var3 then p1.trailing else p1.trailingHover
	end
	return reactModule.createElement(view, {
		tag = if p1.tag then p1.tag else "row auto-y gap-large",
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		ZIndex = p1.zIndex,
		Active = p1.onActivated ~= nil,
		onActivated = p1.onActivated,
		onStateChanged = if fFlagSduiContentRowTrailingHover and p1.trailingHover ~= nil then var1 else nil,
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
		TrailingColumn = if if fFlagSduiContentRowTrailingHover then var2 else p1.trailing then reactModule.createElement(view, { LayoutOrder = 3, tag = p1.trailingTag or "col auto-xy" }, if fFlagSduiContentRowTrailingHover then var2 else p1.trailing) else nil
	})
end)