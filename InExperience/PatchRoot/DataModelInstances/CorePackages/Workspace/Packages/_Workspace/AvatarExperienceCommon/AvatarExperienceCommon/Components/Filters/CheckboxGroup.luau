local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local CryoModule = require(Parent.Cryo)
local View = require(Parent.Foundation).View
local RoactGamepadModule = require(Parent.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local _ = require(Parent.Dash)
local CheckboxButtonItemModule = require(script.Parent.CheckboxButtonItem)

local function CheckboxGroup(Gui) --[[ Line: 65 ]]
	-- upvalues: RoactGamepadModule (copy), ReactModule (copy), Focusable (copy), CheckboxButtonItemModule (copy), View (copy)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseRefCacheResult1 = RoactGamepadModule.useRefCache()
	local UseResult = ReactModule.useCallback(function() --[[ Line: 71 ]]
		-- upvalues: Gui (copy), UseRefCacheResult1 (copy), UseBindingResult2 (copy)
		local Total = 0
		
		for _, item in Gui.items do
			Total += UseRefCacheResult1[item.id].current or 0
		end
		UseBindingResult2(Total)
		
		if Gui.onHeightChanged then
			Gui.onHeightChanged(Total)
		end
	end, {
		Gui.items,
		UseRefCacheResult1,
		UseBindingResult2,
		Gui.onHeightChanged
	})
	local config = {
		layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 1)
		})
	}
	
	for LayoutOrder, item in Gui.items do
		local HasFoundIndex: boolean = if Gui.selectedValue then table.find(Gui.selectedValue, item.id) ~= nil else false
		local UseRefCacheResultEntry = UseRefCacheResult["defaultChild-" .. LayoutOrder]
		config["checkboxItem" .. item.id] = ReactModule.createElement(Focusable[CheckboxButtonItemModule], {
			id = item.id,
			text = item.text,
			onActivated = Gui.onActivated,
			isSelected = HasFoundIndex,
			isDisabled = item.isDisabled,
			layoutOrder = LayoutOrder,
			itemHeight = Gui.itemHeight,
			customView = item.customView,
			expandedView = item.expandedView,
			expandedViewHeight = item.expandedViewHeight,
			useDefaultControlState = Gui.useDefaultControlState,
			hideDivider = Gui.hideDividers or LayoutOrder == #Gui.items,
			ref = UseRefCacheResult[LayoutOrder],
			defaultChildRef = UseRefCacheResultEntry,
			defaultChild = UseRefCacheResultEntry,
			restorePreviousChildFocus = HasFoundIndex,
			NextSelectionUp = if LayoutOrder > 1 then UseRefCacheResult[LayoutOrder - 1] else nil,
			NextSelectionDown = if LayoutOrder < #Gui.items then UseRefCacheResult[LayoutOrder + 1] else nil,
			onHeightChanged = ReactModule.useCallback(function(Current) --[[ Line: 116 ]]
				-- upvalues: UseRefCacheResult1 (copy), item (copy), UseResult (copy)
				UseRefCacheResult1[item.id].current = Current
				UseResult()
			end, { item.id, UseRefCacheResult1, UseResult })
		})
	end
	local v1: boolean = Gui.items and #Gui.items > 0
	
	return ReactModule.createElement(v1 and Focusable[View] or View, {
		BackgroundTransparency = 1,
		defaultChild = v1 and UseRefCacheResult[1] or nil,
		Size = UseBindingResult:map(function(YOffset): UDim2 --[[ Line: 127 ]]
			return UDim2.new(1, 0, 0, YOffset)
		end),
		LayoutOrder = Gui.layoutOrder,
		NextSelectionLeft = Gui.NextSelectionLeft,
		NextSelectionRight = Gui.NextSelectionRight,
		NextSelectionDown = Gui.NextSelectionDown,
		NextSelectionUp = Gui.NextSelectionUp,
		restorePreviousChildFocus = v1 or nil,
		ref = Gui.frameRef
	}, config)
end

return ReactModule.forwardRef(function(p1, FrameRef) --[[ Line: 141 ]]
	-- upvalues: ReactModule (copy), CheckboxGroup (copy), CryoModule (copy)
	return ReactModule.createElement(CheckboxGroup, CryoModule.Dictionary.join(p1, { frameRef = FrameRef }))
end)