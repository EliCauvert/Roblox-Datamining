local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local view = require(parent.Foundation).View
local roactGamepadModule = require(parent.RoactGamepad)
local focusable = roactGamepadModule.Focusable
local _ = require(parent.Dash)
local checkboxButtonItemModule = require(script.Parent.CheckboxButtonItem)

local function CheckboxGroup(p0) --[[ line: 65 ]]
	-- upvalues: roactGamepadModule (ref), reactModule (ref), focusable (ref), checkboxButtonItemModule (ref), view (ref)
	local var5 = roactGamepadModule.useRefCache()
	local var6, var7 = reactModule.useBinding(0)
	local var8 = roactGamepadModule.useRefCache()
	local var9 = reactModule.useCallback(function() --[[ line: 71 ]]
		-- upvalues: p0 (ref), var8 (ref), var7 (ref)
		local var14 = 0
		
		for i, v in p0.items do
			var14 += var8[v.id].current or 0
		end
		var7(var14)
		
		if p0.onHeightChanged then
			p0.onHeightChanged(var14)
		end
	end, { p0.items, var8, var7, p0.onHeightChanged })
	local t = {
		layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 1)
		})
	}
	
	for i, v in p0.items do
		local var12 = if p0.selectedValue then table.find(p0.selectedValue, v.id) ~= nil else false
		local var13 = var5["defaultChild-" .. i]
		t["checkboxItem" .. v.id] = reactModule.createElement(focusable[checkboxButtonItemModule], {
			id = v.id,
			text = v.text,
			onActivated = p0.onActivated,
			isSelected = var12,
			isDisabled = v.isDisabled,
			layoutOrder = i,
			itemHeight = p0.itemHeight,
			customView = v.customView,
			expandedView = v.expandedView,
			expandedViewHeight = v.expandedViewHeight,
			useDefaultControlState = p0.useDefaultControlState,
			hideDivider = p0.hideDividers or i == #p0.items,
			ref = var5[i],
			defaultChildRef = var13,
			defaultChild = var13,
			restorePreviousChildFocus = var12,
			NextSelectionUp = if i > 1 then var5[i - 1] else nil,
			NextSelectionDown = if i < #p0.items then var5[i + 1] else nil,
			onHeightChanged = reactModule.useCallback(function(p1) --[[ line: 116 ]]
				-- upvalues: var8 (ref), v (ref), var9 (ref)
				var8[v.id].current = p1
				var9()
			end, { v.id, var8, var9 })
		})
	end
	local var11 = p0.items and #p0.items > 0
	
	return reactModule.createElement(if var11 then focusable[view] else view, {
		BackgroundTransparency = 1,
		defaultChild = if var11 then var5[1] else nil,
		Size = var6:map(function(p2) --[[ line: 127 ]]
			return UDim2.new(1, 0, 0, p2)
		end),
		LayoutOrder = p0.layoutOrder,
		NextSelectionLeft = p0.NextSelectionLeft,
		NextSelectionRight = p0.NextSelectionRight,
		NextSelectionDown = p0.NextSelectionDown,
		NextSelectionUp = p0.NextSelectionUp,
		restorePreviousChildFocus = var11 or nil,
		ref = p0.frameRef
	}, t)
end

return reactModule.forwardRef(function(p3, p4) --[[ line: 141 ]]
	-- upvalues: reactModule (ref), CheckboxGroup (ref), cryoModule (ref)
	return reactModule.createElement(CheckboxGroup, cryoModule.Dictionary.join(p3, { frameRef = p4 }))
end)