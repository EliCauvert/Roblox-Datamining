local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local IconSize = UIBloxModule.App.Constant.IconSize
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UseTokensFunction = require(CorePackages.Packages.Foundation).Hooks.useTokens
local UsePulseAnimationBindingFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Hooks.usePulseAnimationBinding
local FFlagAXMigrateQuickButtonsToGlobalAutoFocus = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXMigrateQuickButtonsToGlobalAutoFocus
local IconsMenuTransform = UIBloxModule.App.ImageSet.Images["icons/menu/transform"]
local _UDim = UDim.new(0, 8)

return (ReactModule.forwardRef(function(Frame, Ref)
	-- upvalues: UseStyleFunction (copy), FFlagAXMigrateQuickButtonsToGlobalAutoFocus (copy), ReactModule (copy), UseTokensFunction (copy), UseSelectionCursorFunction (copy), CursorKind (copy), UsePulseAnimationBindingFunction (copy), Focusable (copy), _UDim (copy), ImageSetButton (copy), IconSize (copy), IconsMenuTransform (copy)
	local Theme = UseStyleFunction().Theme
	local UseRefResult = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else ReactModule.useRef(nil)
	local UseTokensResult = UseTokensFunction()
	local UseSelectionCursorResult = UseSelectionCursorFunction(CursorKind.RoundedRect)
	local UsePulseAnimationBindingResult = UsePulseAnimationBindingFunction(Frame.enableFocusAnimation)
	
	return ReactModule.createElement(if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then "Frame" else Focusable.Frame, {
		Size = UDim2.fromOffset(44, 44),
		BackgroundColor3 = Theme.BackgroundMuted.Color,
		BackgroundTransparency = Theme.BackgroundMuted.Transparency,
		LayoutOrder = Frame.LayoutOrder,
		ref = Ref,
		defaultChild = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else UseRefResult
	}, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = _UDim }),
		Button = ReactModule.createElement(if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then ImageSetButton else Focusable[ImageSetButton], {
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(IconSize.Regular, IconSize.Regular),
			BackgroundTransparency = 1,
			Image = IconsMenuTransform,
			ImageColor3 = Theme.IconEmphasis.Color,
			ImageTransparency = 0,
			[ReactModule.Event.Activated] = Frame.onActivated,
			ref = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else UseRefResult,
			NextSelectionUp = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Frame.NextSelectionUp,
			NextSelectionDown = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Frame.NextSelectionDown,
			NextSelectionLeft = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Frame.NextSelectionLeft,
			NextSelectionRight = if FFlagAXMigrateQuickButtonsToGlobalAutoFocus then nil else Frame.NextSelectionRight,
			SelectionImageObject = UseSelectionCursorResult
		}),
		UIStroke = if Frame.enableFocusAnimation then ReactModule.createElement("UIStroke", {
			Color = UseTokensResult.Color.ActionEmphasis.Background.Color3,
			Thickness = UsePulseAnimationBindingResult and UsePulseAnimationBindingResult:map(function(p1)
				return p1.thickness
			end),
			Transparency = UsePulseAnimationBindingResult and UsePulseAnimationBindingResult:map(function(p1)
				return p1.transparency
			end)
		}) else nil
	})
end))