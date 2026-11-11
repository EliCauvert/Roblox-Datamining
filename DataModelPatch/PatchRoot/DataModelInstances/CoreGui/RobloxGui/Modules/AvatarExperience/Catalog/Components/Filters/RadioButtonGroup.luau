local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local Focusable = RoactGamepadModule.Focusable
local _ = require(CorePackages.Packages.Dash)
local FilterUtilsModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Catalog.Components.Filters.FilterUtils)
local RadioButtonItemModule = require(script.Parent.RadioButtonItem)

local function RadioButtonGroup(Gui)
	-- upvalues: RoactGamepadModule (copy), UseSelectionCursorFunction (copy), CursorKind (copy), ReactModule (copy), Focusable (copy), RadioButtonItemModule (copy), FilterUtilsModule (copy)
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.Square)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseRefCacheResult1 = RoactGamepadModule.useRefCache()
	
	local function updateTotalHeight()
		-- upvalues: Gui (copy), UseRefCacheResult1 (copy), UseBindingResult2 (copy)
		local Current = 0
		
		for _, item in Gui.items do
			Current += UseRefCacheResult1[item.id].current or 0
		end
		UseBindingResult2(Current)
		
		if Gui.onHeightChanged then
			Gui.onHeightChanged(Current)
		end
	end
	
	local config = {
		layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 1)
		})
	}
	
	for LayoutOrder, item in Gui.items do
		local IsSelectedValueMatch = Gui.selectedValue == item.id
		local UseRefCacheResultEntry = UseRefCacheResult["defaultChild-" .. LayoutOrder]
		config["radioButtonItem" .. item.id] = ReactModule.createElement(Focusable[RadioButtonItemModule], {
			id = item.id,
			text = item.text,
			onActivated = Gui.onActivated,
			isSelected = IsSelectedValueMatch,
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
			restorePreviousChildFocus = IsSelectedValueMatch,
			NextSelectionUp = if LayoutOrder > 1 then UseRefCacheResult[LayoutOrder - 1] else nil,
			NextSelectionDown = if LayoutOrder < #Gui.items then UseRefCacheResult[LayoutOrder + 1] else nil,
			SelectionImageObject = UseSelectionCursorResult,
			onHeightChanged = function(Current)
				-- upvalues: UseRefCacheResult1 (copy), item (copy), updateTotalHeight (copy)
				UseRefCacheResult1[item.id].current = Current
				updateTotalHeight()
			end
		})
	end
	local v1: boolean = Gui.items and #Gui.items > 0
	
	return ReactModule.createElement(v1 and Focusable.Frame or "Frame", {
		BackgroundTransparency = 1,
		defaultChild = v1 and UseRefCacheResult[1] or nil,
		Size = UseBindingResult:map(FilterUtilsModule.mapHeightToSize),
		LayoutOrder = Gui.layoutOrder,
		NextSelectionLeft = Gui.NextSelectionLeft,
		NextSelectionRight = Gui.NextSelectionRight,
		NextSelectionDown = Gui.NextSelectionDown,
		NextSelectionUp = Gui.NextSelectionUp,
		restorePreviousChildFocus = v1 or nil,
		ref = Gui.frameRef
	}, config)
end

return ReactModule.forwardRef(function(p1, FrameRef)
	-- upvalues: ReactModule (copy), RadioButtonGroup (copy), CryoModule (copy)
	return ReactModule.createElement(RadioButtonGroup, CryoModule.Dictionary.join(p1, { frameRef = FrameRef }))
end)