local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Interactable = UIBloxModule.Core.Control.Interactable
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local _UDim2 = UDim2.new(0, 44, 0, 44)
local _UDim2_1 = UDim2.new(0, 37, 0, 37)
local ComponentAssetsCircle17 = UIBloxModule.App.ImageSet.Images["component_assets/circle_17"]
local _Rect = Rect.new(8, 8, 9, 9)

return ReactModule.forwardRef(function(Gui, Ref)
	-- upvalues: UseStyleFunction (copy), UseSelectionCursorFunction (copy), CursorKind (copy), ReactModule (copy), Focusable (copy), Interactable (copy), _UDim2 (copy), ComponentAssetsCircle17 (copy), _Rect (copy), ImageSetLabel (copy), _UDim2_1 (copy)
	local Theme = UseStyleFunction().Theme
	
	return ReactModule.createElement(Focusable[Interactable], {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = _UDim2,
		Image = ComponentAssetsCircle17,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = _Rect,
		ImageTransparency = Theme.BackgroundDefault.Transparency,
		ImageColor3 = Theme.BackgroundDefault.Color,
		LayoutOrder = 2,
		ClipsDescendants = false,
		[ReactModule.Event.Activated] = Gui.onActivated,
		NextSelectionRight = Gui.NextSelectionRight,
		NextSelectionLeft = Gui.NextSelectionLeft,
		ref = Ref,
		SelectionImageObject = UseSelectionCursorFunction(CursorKind.RoundedRectNoInset)
	}, {
		Icon = ReactModule.createElement(ImageSetLabel, {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = _UDim2_1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = Gui.icon,
			ImageTransparency = Theme.IconEmphasis.Transparency,
			ImageColor3 = Theme.IconEmphasis.Color
		})
	})
end)