local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseSelectionCursorFunction = UIBloxModule.App.SelectionImage.useSelectionCursor
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local ComponentAssetsCircle17Stroke1 = UIBloxModule.App.ImageSet.Images["component_assets/circle_17_stroke_1"]
local _Rect = Rect.new(8, 8, 8, 8)

return function(Gui)
	-- upvalues: UseStyleFunction (copy), UseSelectionCursorFunction (copy), CursorKind (copy), ReactModule (copy), ImageSetLabel (copy), ComponentAssetsCircle17Stroke1 (copy), _Rect (copy), Focusable (copy)
	local UseStyleResult = UseStyleFunction()
	local UseStyleResultFont = UseStyleResult.Font
	local Theme = UseStyleResult.Theme
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundTransparency = Theme.UIMuted.Transparency,
		BackgroundColor3 = Theme.UIMuted.Color,
		Size = if Gui.width then UDim2.new(Gui.width.Scale, Gui.width.Offset, 0, 30) else UDim2.new(1, 0, 0, 30),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		LayoutOrder = Gui.layoutOrder
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		Outline = ReactModule.createElement(ImageSetLabel, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Image = ComponentAssetsCircle17Stroke1,
			ImageColor3 = Theme.UIDefault.Color,
			ImageTransparency = Theme.UIDefault.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.new(1, 0, 0, 30),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			SliceCenter = _Rect
		}),
		Textbox = ReactModule.createElement(Focusable.TextBox, {
			Text = Gui.text,
			BackgroundTransparency = 1,
			ClearTextOnFocus = false,
			Font = UseStyleResultFont.Header2.Font,
			TextSize = UseStyleResultFont.BaseSize * UseStyleResultFont.CaptionBody.RelativeSize,
			PlaceholderColor3 = Theme.PlaceHolder.Color,
			PlaceholderText = Gui.placeholderText,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Size = UDim2.new(1, -16, 1, 0),
			TextColor3 = Theme.TextDefault.Color,
			TextTruncate = Enum.TextTruncate.AtEnd,
			TextWrapped = true,
			TextXAlignment = Enum.TextXAlignment.Left,
			OverlayNativeInput = true,
			[ReactModule.Change.Text] = function(p1)
				-- upvalues: Gui (copy)
				local Text = p1.Text
				
				if Gui.onTextChanged then
					Gui.onTextChanged(Text)
				end
			end,
			[ReactModule.Event.Focused] = Gui.onFocused,
			SelectionImageObject = UseSelectionCursorFunction(CursorKind.InputFields),
			ref = Gui.textBoxRef,
			NextSelectionLeft = Gui.NextSelectionLeft,
			NextSelectionRight = Gui.NextSelectionRight,
			NextSelectionUp = Gui.NextSelectionUp,
			NextSelectionDown = Gui.NextSelectionDown
		})
	})
end