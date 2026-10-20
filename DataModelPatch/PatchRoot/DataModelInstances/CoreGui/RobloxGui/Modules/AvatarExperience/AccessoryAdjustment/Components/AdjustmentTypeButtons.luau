local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AdjustmentTypeButtonModule = require(Modules.AvatarExperience.AccessoryAdjustment.Components.AdjustmentTypeButton)
local AdjustmentTypeModule = require(Modules.AvatarExperience.AccessoryAdjustment.Enum.AdjustmentType)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local UseFocusGuiObjectFunction = require(CorePackages.Packages.ReactFocusNavigation).useFocusGuiObject
local FFlagAXMigrateAXToGlobalAutofocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateAXToGlobalAutofocus
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable

return function(Frame)
	-- upvalues: UseStyleFunction (copy), ReactModule (copy), FFlagAXMigrateAXToGlobalAutofocus (copy), UseFocusGuiObjectFunction (copy), AdjustmentTypeModule (copy), Focusable (copy), AdjustmentTypeButtonModule (copy)
	local Theme = UseStyleFunction().Theme
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseFocusGuiObjectResult = if FFlagAXMigrateAXToGlobalAutofocus then UseFocusGuiObjectFunction() else nil
	local IsAdjustmentTypeSelectedMatch = Frame.adjustmentTypeSelected == AdjustmentTypeModule.Scale
	local IsAdjustmentTypeSelectedMatch1 = Frame.adjustmentTypeSelected == AdjustmentTypeModule.Position
	
	if FFlagAXMigrateAXToGlobalAutofocus and UseFocusGuiObjectResult then
		ReactModule.useEffect(function()
			-- upvalues: UseFocusGuiObjectResult (copy), UseRefResult (copy)
			UseFocusGuiObjectResult(UseRefResult.current)
		end, { UseFocusGuiObjectResult })
	end
	return ReactModule.createElement(if FFlagAXMigrateAXToGlobalAutofocus then "Frame" else Focusable.Frame, {
		Size = UDim2.new(1, 0, 0, 36),
		BackgroundColor3 = Theme.BackgroundUIDefault.Color,
		BackgroundTransparency = Theme.BackgroundUIDefault.Transparency,
		LayoutOrder = Frame.LayoutOrder,
		ref = if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.frameRef,
		defaultChild = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRefResult,
		restorePreviousChildFocus = not FFlagAXMigrateAXToGlobalAutofocus or nil,
		NextSelectionDown = if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionDown
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, 4),
			PaddingBottom = UDim.new(0, 4),
			PaddingLeft = UDim.new(0, 4),
			PaddingRight = UDim.new(0, 4)
		}),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, 0),
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		MoveButton = ReactModule.createElement(AdjustmentTypeButtonModule, {
			LayoutOrder = 1,
			iconName = "icons/menu/adjust/position_small",
			isSelected = Frame.adjustmentTypeSelected == AdjustmentTypeModule.Position,
			adjustmentType = AdjustmentTypeModule.Position,
			buttonRef = UseRefResult,
			NextSelectionLeft = if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionLeft,
			NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionUp,
			NextSelectionRight = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRefResult1
		}),
		Divider1 = ReactModule.createElement("Frame", {
			LayoutOrder = 2,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 1, 1, 0),
			BackgroundColor3 = Theme.Divider.Color,
			BackgroundTransparency = Theme.Divider.Transparency,
			Visible = IsAdjustmentTypeSelectedMatch
		}),
		RotateButton = ReactModule.createElement(AdjustmentTypeButtonModule, {
			LayoutOrder = 3,
			iconName = "icons/menu/adjust/rotation_small",
			isSelected = Frame.adjustmentTypeSelected == AdjustmentTypeModule.Rotation,
			adjustmentType = AdjustmentTypeModule.Rotation,
			buttonRef = UseRefResult1,
			NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionUp,
			NextSelectionLeft = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRefResult,
			NextSelectionRight = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRefResult2
		}),
		Divider2 = ReactModule.createElement("Frame", {
			LayoutOrder = 4,
			BorderSizePixel = 0,
			Size = UDim2.new(0, 1, 1, 0),
			BackgroundColor3 = Theme.Divider.Color,
			BackgroundTransparency = Theme.Divider.Transparency,
			Visible = IsAdjustmentTypeSelectedMatch1
		}),
		ScaleButton = ReactModule.createElement(AdjustmentTypeButtonModule, {
			LayoutOrder = 5,
			iconName = "icons/menu/adjust/scale_small",
			isSelected = Frame.adjustmentTypeSelected == AdjustmentTypeModule.Scale,
			adjustmentType = AdjustmentTypeModule.Scale,
			buttonRef = UseRefResult2,
			NextSelectionUp = if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionUp,
			NextSelectionLeft = if FFlagAXMigrateAXToGlobalAutofocus then nil else UseRefResult1,
			NextSelectionRight = if FFlagAXMigrateAXToGlobalAutofocus then nil else Frame.NextSelectionRight
		})
	})
end