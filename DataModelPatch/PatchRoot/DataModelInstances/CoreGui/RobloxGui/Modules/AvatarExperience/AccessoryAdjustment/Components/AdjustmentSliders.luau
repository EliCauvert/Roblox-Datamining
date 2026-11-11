local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactGamepadModule = require(CorePackages.Packages.RoactGamepad)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AdjustmentSliderModule = require(Modules.AvatarExperience.AccessoryAdjustment.Components.AdjustmentSlider)
local AdjustmentSliderTypeModule = require(Modules.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentSliderType)
local AdjustmentTypeModule = require(Modules.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentType)
local Focusable = RoactGamepadModule.Focusable
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus

local function Slider(p1, AdjustmentSliderType, LayoutOrder, UpdateCharacterCallback, SetSliderValuesCallback, SliderRef, p2, p3)
	-- upvalues: ReactModule (copy), AdjustmentSliderModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy)
	return ReactModule.createElement(AdjustmentSliderModule, {
		sliderRef = SliderRef,
		NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else p2,
		NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus then nil else p3,
		LayoutOrder = LayoutOrder,
		adjustmentSliderType = AdjustmentSliderType,
		sliderValue = p1[AdjustmentSliderType],
		updateCharacterCallback = UpdateCharacterCallback,
		setSliderValuesCallback = SetSliderValuesCallback
	})
end

local function getSliders(Position, SliderValues, UpdateCharacterCallback, SetSliderValuesCallback, Entry, NextSelectionUp, NextSelectionDown)
	-- upvalues: AdjustmentTypeModule (copy), Slider (copy), AdjustmentSliderTypeModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), ReactModule (copy)
	local List = {}
	
	if Position == AdjustmentTypeModule.Position then
		table.insert(List, Slider(SliderValues, AdjustmentSliderTypeModule.PositionX, 1, UpdateCharacterCallback, SetSliderValuesCallback, Entry[1], if FFlagAXMigrateAXToGlobalAutofocus then nil else NextSelectionUp, if FFlagAXMigrateAXToGlobalAutofocus then nil else Entry[2]))
		table.insert(List, Slider(SliderValues, AdjustmentSliderTypeModule.PositionY, 2, UpdateCharacterCallback, SetSliderValuesCallback, Entry[2], if FFlagAXMigrateAXToGlobalAutofocus then nil else Entry[1], if FFlagAXMigrateAXToGlobalAutofocus then nil else Entry[3]))
		table.insert(List, Slider(SliderValues, AdjustmentSliderTypeModule.PositionZ, 3, UpdateCharacterCallback, SetSliderValuesCallback, Entry[3], if FFlagAXMigrateAXToGlobalAutofocus then nil else Entry[2], if FFlagAXMigrateAXToGlobalAutofocus then nil else NextSelectionDown))
	elseif Position == AdjustmentTypeModule.Rotation then
		table.insert(List, Slider(SliderValues, AdjustmentSliderTypeModule.RotationX, 1, UpdateCharacterCallback, SetSliderValuesCallback, Entry[1], if FFlagAXMigrateAXToGlobalAutofocus then nil else NextSelectionUp, if FFlagAXMigrateAXToGlobalAutofocus then nil else Entry[2]))
		table.insert(List, Slider(SliderValues, AdjustmentSliderTypeModule.RotationY, 2, UpdateCharacterCallback, SetSliderValuesCallback, Entry[2], if FFlagAXMigrateAXToGlobalAutofocus then nil else Entry[1], if FFlagAXMigrateAXToGlobalAutofocus then nil else Entry[3]))
		table.insert(List, Slider(SliderValues, AdjustmentSliderTypeModule.RotationZ, 3, UpdateCharacterCallback, SetSliderValuesCallback, Entry[3], if FFlagAXMigrateAXToGlobalAutofocus then nil else Entry[2], if FFlagAXMigrateAXToGlobalAutofocus then nil else NextSelectionDown))
	elseif Position == AdjustmentTypeModule.Scale then
		table.insert(List, Slider(SliderValues, AdjustmentSliderTypeModule.Scale, 1, UpdateCharacterCallback, SetSliderValuesCallback, Entry[1], if FFlagAXMigrateAXToGlobalAutofocus then nil else NextSelectionUp, if FFlagAXMigrateAXToGlobalAutofocus then nil else NextSelectionDown))
	end
	table.insert(List, ReactModule.createElement("UIListLayout", {
		Padding = UDim.new(0, 24),
		SortOrder = Enum.SortOrder.LayoutOrder,
		FillDirection = Enum.FillDirection.Vertical,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top
	}))
	table.insert(List, ReactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 5) }))
	
	return List
end

return if require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateSystemSliderToFoundationSlider then function(Frame)
	-- upvalues: UseStyleFunction (copy), RoactGamepadModule (copy), ReactModule (copy), getSliders (copy), AdjustmentTypeModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy)
	local Theme = UseStyleFunction().Theme
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseRefCacheResult1 = RoactGamepadModule.useRefCache()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local Sliders = getSliders(AdjustmentTypeModule.Position, Frame.sliderValues, Frame.updateCharacterCallback, Frame.setSliderValuesCallback, RoactGamepadModule.useRefCache(), if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionUp, if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionDown)
	local Sliders1 = getSliders(AdjustmentTypeModule.Rotation, Frame.sliderValues, Frame.updateCharacterCallback, Frame.setSliderValuesCallback, UseRefCacheResult, if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionUp, if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionDown)
	local Sliders2 = getSliders(AdjustmentTypeModule.Scale, Frame.sliderValues, Frame.updateCharacterCallback, Frame.setSliderValuesCallback, UseRefCacheResult1, if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionUp, if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionDown)
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ref = if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.frameRef,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		LayoutOrder = Frame.LayoutOrder
	}, {
		PositionSlidersContainer = if Frame.adjustmentTypeSelected == AdjustmentTypeModule.Position then ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			ref = UseRefResult,
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency
		}, Sliders) else nil,
		RotationSlidersContainer = if Frame.adjustmentTypeSelected == AdjustmentTypeModule.Rotation then ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			ref = UseRefResult1,
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency
		}, Sliders1) else nil,
		ScaleSlidersContainer = if Frame.adjustmentTypeSelected == AdjustmentTypeModule.Scale then ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 2,
			ref = UseRefResult2,
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency
		}, Sliders2) else nil,
		BackPanel = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 1,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency
		})
	})
end else function(Frame)
	-- upvalues: UseStyleFunction (copy), RoactGamepadModule (copy), ReactModule (copy), getSliders (copy), AdjustmentTypeModule (copy), Focusable (copy)
	local Theme = UseStyleFunction().Theme
	local UseRefCacheResult = RoactGamepadModule.useRefCache()
	local UseRefCacheResult1 = RoactGamepadModule.useRefCache()
	local UseRefCacheResult2 = RoactGamepadModule.useRefCache()
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseRefCacheResult[1])
	local Sliders = getSliders(AdjustmentTypeModule.Position, Frame.sliderValues, Frame.updateCharacterCallback, Frame.setSliderValuesCallback, UseRefCacheResult, Frame.NextSelectionUp, Frame.NextSelectionDown)
	local Sliders1 = getSliders(AdjustmentTypeModule.Rotation, Frame.sliderValues, Frame.updateCharacterCallback, Frame.setSliderValuesCallback, UseRefCacheResult1, Frame.NextSelectionUp, Frame.NextSelectionDown)
	local Sliders2 = getSliders(AdjustmentTypeModule.Scale, Frame.sliderValues, Frame.updateCharacterCallback, Frame.setSliderValuesCallback, UseRefCacheResult2, Frame.NextSelectionUp, Frame.NextSelectionDown)
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), AdjustmentTypeModule (upval), UseStateResult2 (copy), UseRefResult (copy), UseRefResult1 (copy), UseRefResult2 (copy)
		if Frame.adjustmentTypeSelected == AdjustmentTypeModule.Position then
			UseStateResult2(UseRefResult)
			
			return
		end
		if Frame.adjustmentTypeSelected == AdjustmentTypeModule.Rotation then
			UseStateResult2(UseRefResult1)
			
			return
		else
			UseStateResult2(UseRefResult2)
		end
	end, { Frame.adjustmentTypeSelected })
	
	return ReactModule.createElement(Focusable.Frame, {
		BackgroundTransparency = 1,
		ref = Frame.frameRef,
		defaultChild = UseStateResult,
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		BackgroundColor3 = Theme.BackgroundDefault.Color,
		LayoutOrder = Frame.LayoutOrder
	}, {
		PositionSlidersContainer = ReactModule.createElement(Focusable.Frame, {
			restorePreviousChildFocus = true,
			BorderSizePixel = 0,
			ref = UseRefResult,
			defaultChild = UseRefCacheResult[1],
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			ZIndex = if Frame.adjustmentTypeSelected == AdjustmentTypeModule.Position then 2 else 0
		}, Sliders),
		RotationSlidersContainer = ReactModule.createElement(Focusable.Frame, {
			restorePreviousChildFocus = true,
			BorderSizePixel = 0,
			ref = UseRefResult1,
			defaultChild = UseRefCacheResult1[1],
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			ZIndex = if Frame.adjustmentTypeSelected == AdjustmentTypeModule.Rotation then 2 else 0
		}, Sliders1),
		ScaleSlidersContainer = ReactModule.createElement(Focusable.Frame, {
			restorePreviousChildFocus = true,
			BorderSizePixel = 0,
			ref = UseRefResult2,
			defaultChild = UseRefCacheResult2[1],
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			ZIndex = if Frame.adjustmentTypeSelected == AdjustmentTypeModule.Scale then 2 else 0
		}, Sliders2),
		BackPanel = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 1,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency
		})
	})
end