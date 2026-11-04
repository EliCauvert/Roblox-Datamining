local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local UseImpressionsTaggerFunction = require(Parent.Impressions).useImpressionsTagger
local FFlagAppPageShellScrollToTopFocus = require(Parent.SharedFlags).FFlagAppPageShellScrollToTopFocus

return ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), FFlagAppPageShellScrollToTopFocus (copy), UseImpressionsTaggerFunction (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = if FFlagAppPageShellScrollToTopFocus then ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), p1 (copy)
		UseRefResult.current = Current
		
		if type(p1.defaultFocusRef) == "function" then
			p1.defaultFocusRef(Current)
			
			return
		end
		if type(p1.defaultFocusRef) == "table" then
			p1.defaultFocusRef.current = Current
		end
	end, { p1.defaultFocusRef }) else nil
	UseImpressionsTaggerFunction(UseRefResult, p1.impressionsTag, p1.index)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		SelectionGroup = true,
		ref = if FFlagAppPageShellScrollToTopFocus then UseResult else UseRefResult,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		SelectionBehaviorLeft = p1.selectionBehaviorLeft,
		SelectionBehaviorRight = p1.selectionBehaviorRight,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex
	}, p1.children)
end)