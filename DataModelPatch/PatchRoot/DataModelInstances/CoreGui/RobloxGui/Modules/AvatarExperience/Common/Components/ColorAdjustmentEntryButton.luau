local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local IconButton = UIBloxModule.App.Button.IconButton
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local IconSize = UIBloxModule.App.Constant.IconSize
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local ColorGradientCircle = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Components.ColorGradientCircle
local AXFixColorAdjustmentQuickButtonSize = game:DefineFastFlag("AXFixColorAdjustmentQuickButtonSize", false)
local FFlagAXMigrateQuickButtonsToGlobalAutoFocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateQuickButtonsToGlobalAutoFocus
local _UDim = UDim.new(0, 8)
local _UDim1 = UDim.new(0, 4)

return (ReactModule.forwardRef(function(Frame: Frame, ButtonRef)
	-- upvalues: UseTokensFunction (copy), UseStyleFunction (copy), UseSelectionCursorFunction (copy), CursorKind (copy), AXFixColorAdjustmentQuickButtonSize (copy), ReactModule (copy), FFlagAXMigrateQuickButtonsToGlobalAutoFocus (copy), Focusable (copy), _UDim (copy), ImageSetButton (copy), IconSize (copy), _UDim1 (copy), ColorGradientCircle (copy), IconButton (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStyleResult = UseStyleFunction()
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.RoundedRect)
	local Theme = UseStyleResult.Theme
	local UseRefResult = if AXFixColorAdjustmentQuickButtonSize then ReactModule.useRef(nil) else nil
	
	return if AXFixColorAdjustmentQuickButtonSize then ReactModule.createElement(if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then "Frame" else Focusable.Frame, {
		Size = UDim2.fromOffset(44, 44),
		BackgroundColor3 = Theme.BackgroundMuted.Color,
		BackgroundTransparency = Theme.BackgroundMuted.Transparency,
		LayoutOrder = Frame.LayoutOrder,
		ref = ButtonRef,
		defaultChild = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else UseRefResult
	}, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = _UDim }),
		Button = ReactModule.createElement(if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then ImageSetButton else Focusable[ImageSetButton], {
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(IconSize.Regular, IconSize.Regular),
			BackgroundTransparency = 1,
			[ReactModule.Event.Activated] = Frame.onActivated,
			ref = UseRefResult,
			NextSelectionUp = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Frame.NextSelectionUp,
			NextSelectionDown = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Frame.NextSelectionDown,
			NextSelectionLeft = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Frame.NextSelectionLeft,
			NextSelectionRight = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Frame.NextSelectionRight,
			SelectionImageObject = UseSelectionCursorResult
		}, {
			Padding = ReactModule.createElement("UIPadding", {
				PaddingTop = _UDim1,
				PaddingBottom = _UDim1,
				PaddingLeft = _UDim1,
				PaddingRight = _UDim1
			}),
			Color = ReactModule.createElement(ColorGradientCircle, {
				Size = UDim2.fromScale(1, 1),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Colors = Frame.colors
			})
		})
	}) else ReactModule.createElement(IconButton, {
		showBackground = true,
		position = UDim2.fromScale(0.5, 0.5),
		anchorPoint = Vector2.new(0.5, 0.5),
		layoutOrder = Frame.LayoutOrder,
		iconSize = IconSize.Medium,
		onActivated = Frame.onActivated,
		backgroundColor = Theme.BackgroundUIDefault,
		buttonRef = ButtonRef,
		NextSelectionUp = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Frame.NextSelectionUp,
		NextSelectionDown = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Frame.NextSelectionDown,
		NextSelectionLeft = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Frame.NextSelectionLeft,
		NextSelectionRight = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Frame.NextSelectionRight
	}, {
		Color = ReactModule.createElement(ColorGradientCircle, {
			Size = UDim2.fromOffset(UseTokensResult.Size.Size_700, UseTokensResult.Size.Size_700),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Colors = Frame.colors
		})
	})
end))