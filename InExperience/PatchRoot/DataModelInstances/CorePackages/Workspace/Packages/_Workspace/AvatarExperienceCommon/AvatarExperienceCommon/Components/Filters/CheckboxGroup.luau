local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local view = require(parent.Foundation).View
local roactGamepadModule = require(parent.RoactGamepad)
local focusable = roactGamepadModule.Focusable
local _ = require(parent.Dash)
local checkboxButtonItemModule = require(script.Parent.CheckboxButtonItem)

local function CheckboxGroup(p1)
	-- upvalues: roactGamepadModule (ref), reactModule (ref), focusable (ref), checkboxButtonItemModule (ref), view (ref)
	local var1 = roactGamepadModule.useRefCache()
	local var2, var3 = reactModule.useBinding(0)
	local var4 = roactGamepadModule.useRefCache()
	local var5 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var4 (ref), var3 (ref)
		local var6 = 0
		
		for i, v in p1.items do
			var6 += var4[v.id].current or 0
		end
		var3(var6)
		
		if p1.onHeightChanged then
			p1.onHeightChanged(var6)
		end
	end, { p1.items, var4, var3, p1.onHeightChanged })
	local t = {
		layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 1)
		})
	}
	
	for i, v in p1.items do
		local var7 = if p1.selectedValue then table.find(p1.selectedValue, v.id) ~= nil else false
		local var8 = var1["defaultChild-" .. i]
		t["checkboxItem" .. v.id] = reactModule.createElement(focusable[checkboxButtonItemModule], {
			id = v.id,
			text = v.text,
			onActivated = p1.onActivated,
			isSelected = var7,
			isDisabled = v.isDisabled,
			layoutOrder = i,
			itemHeight = p1.itemHeight,
			customView = v.customView,
			expandedView = v.expandedView,
			expandedViewHeight = v.expandedViewHeight,
			useDefaultControlState = p1.useDefaultControlState,
			hideDivider = p1.hideDividers or i == #p1.items,
			ref = var1[i],
			defaultChildRef = var8,
			defaultChild = var8,
			restorePreviousChildFocus = var7,
			NextSelectionUp = if i > 1 then var1[i - 1] else nil,
			NextSelectionDown = if i < #p1.items then var1[i + 1] else nil,
			onHeightChanged = reactModule.useCallback(function(p2)
				-- upvalues: var4 (ref), v (ref), var5 (ref)
				var4[v.id].current = p2
				var5()
			end, { v.id, var4, var5 })
		})
	end
	local var9 = p1.items and #p1.items > 0
	
	return reactModule.createElement(if var9 then focusable[view] else view, {
		BackgroundTransparency = 1,
		defaultChild = if var9 then var1[1] else nil,
		Size = var2:map(function(p2)
			return UDim2.new(1, 0, 0, p2)
		end),
		LayoutOrder = p1.layoutOrder,
		NextSelectionLeft = p1.NextSelectionLeft,
		NextSelectionRight = p1.NextSelectionRight,
		NextSelectionDown = p1.NextSelectionDown,
		NextSelectionUp = p1.NextSelectionUp,
		restorePreviousChildFocus = var9 or nil,
		ref = p1.frameRef
	}, t)
end

return reactModule.forwardRef(function(p2, p3)
	-- upvalues: reactModule (ref), CheckboxGroup (ref), cryoModule (ref)
	return reactModule.createElement(CheckboxGroup, cryoModule.Dictionary.join(p2, { frameRef = p3 }))
end)