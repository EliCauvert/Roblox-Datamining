local SduiSharedContent = script:FindFirstAncestor("SduiSharedContent")
local Parent = SduiSharedContent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local _ = require(Parent.SduiCompat)
local FFlagSduiContentRowStateLayerModule = require(SduiSharedContent.Flags.FFlagSduiContentRowStateLayer)
local FFlagSDUIContentRowSelectableModule = require(SduiSharedContent.Flags.FFlagSDUIContentRowSelectable)
local FFlagSduiContentRowTrailingHover = require(Parent.SharedFlags).FFlagSduiContentRowTrailingHover
local View = FoundationModule.View
local ControlState = FoundationModule.Enums.ControlState
local CursorType = FoundationModule.Enums.CursorType
local UseCursorFunction = FoundationModule.Hooks.useCursor

return ReactModule.memo(function(p1)
	-- upvalues: FFlagSduiContentRowTrailingHover (copy), ReactModule (copy), ControlState (copy), FFlagSDUIContentRowSelectableModule (copy), UseCursorFunction (copy), CursorType (copy), View (copy), FFlagSduiContentRowStateLayerModule (copy), FoundationModule (copy)
	local UseResult = nil
	local Trailing = nil
	
	if FFlagSduiContentRowTrailingHover then
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		UseResult = ReactModule.useCallback(function(Hover)
			-- upvalues: UseStateResult2 (copy), ControlState (upval)
			UseStateResult2(Hover == ControlState.Hover or Hover == ControlState.Pressed)
		end, {})
		Trailing = if p1.trailingHover == nil or not UseStateResult then p1.trailing else p1.trailingHover
	end
	local IsSelectable: boolean = FFlagSDUIContentRowSelectableModule and p1.selectable == true
	local UseCursorResult = if FFlagSDUIContentRowSelectableModule then UseCursorFunction(CursorType.RoundedRect) else nil
	
	return ReactModule.createElement(View, {
		tag = if p1.tag then p1.tag else "row auto-y gap-large",
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		ZIndex = p1.zIndex,
		Active = p1.onActivated ~= nil,
		onActivated = p1.onActivated,
		onStateChanged = if FFlagSduiContentRowTrailingHover and p1.trailingHover ~= nil then UseResult else nil,
		selection = {
			Selectable = IsSelectable,
			SelectionImageObject = if IsSelectable then UseCursorResult else nil
		},
		stateLayer = {
			affordance = FFlagSduiContentRowStateLayerModule and p1.stateLayerAffordance or FoundationModule.Enums.StateLayerAffordance.None
		},
		testId = p1.testId
	}, {
		LeadingColumn = if p1.leading then ReactModule.createElement(View, { LayoutOrder = 1, tag = p1.leadingTag or "col auto-xy" }, p1.leading) else nil,
		ContentColumn = if p1.content then ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = p1.contentTag or "col fill gap-small auto-xy"
		}, p1.content) else nil,
		TrailingColumn = if if FFlagSduiContentRowTrailingHover then Trailing else p1.trailing then ReactModule.createElement(View, { LayoutOrder = 3, tag = p1.trailingTag or "col auto-xy" }, if FFlagSduiContentRowTrailingHover then Trailing else p1.trailing) else nil
	})
end)