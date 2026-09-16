local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local useImpressionsTagger = require(parent.Impressions).useImpressionsTagger
local fFlagAppPageShellScrollToTopFocus = require(parent.SharedFlags).FFlagAppPageShellScrollToTopFocus
local fFlagLuaAppsDefaultSelection = require(parent.SharedFlags).FFlagLuaAppsDefaultSelection

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), fFlagAppPageShellScrollToTopFocus (ref), fFlagLuaAppsDefaultSelection (ref), useImpressionsTagger (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = if fFlagAppPageShellScrollToTopFocus then reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), fFlagLuaAppsDefaultSelection (copy), p1 (ref)
		var1.current = p2
		
		if not fFlagLuaAppsDefaultSelection then return end
		if type(p1.defaultFocusRef) == "function" then
			p1.defaultFocusRef(p2)
			
			return
		elseif type(p1.defaultFocusRef) == "table" then
			p1.defaultFocusRef.current = p2
		end
	end, { p1.defaultFocusRef }) else nil
	useImpressionsTagger(var1, p1.impressionsTag, p1.index)
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		SelectionGroup = true,
		ref = if fFlagAppPageShellScrollToTopFocus and fFlagLuaAppsDefaultSelection then var2 else var1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		SelectionBehaviorLeft = p1.selectionBehaviorLeft,
		SelectionBehaviorRight = p1.selectionBehaviorRight,
		LayoutOrder = p1.layoutOrder,
		ZIndex = p1.zIndex
	}, p1.children)
end)