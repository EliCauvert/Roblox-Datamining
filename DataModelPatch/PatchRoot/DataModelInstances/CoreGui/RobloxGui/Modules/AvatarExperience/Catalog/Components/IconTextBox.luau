local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local _Rect = Rect.new(7, 8, 7, 8)
local IconTextBox = RoactModule.PureComponent:extend("IconTextBox")
IconTextBox.defaultProps = { LayoutOrder = 0, imagePadding = 6 }

function IconTextBox.render(p1)
	-- upvalues: UIBloxModule (copy), WithSelectionCursorProviderFunction (copy), RoactModule (copy), _Rect (copy), ImageSetLabel (copy), Focusable (copy), CursorKind (copy)
	return UIBloxModule.Style.withStyle(function(p2)
		-- upvalues: p1 (copy), WithSelectionCursorProviderFunction (upval), RoactModule (upval), _Rect (upval), ImageSetLabel (upval), Focusable (upval), CursorKind (upval)
		local _Font = p2.Font
		local Theme = p2.Theme
		local Image = p1.props.Image
		local ImagePadding: number = p1.props.imagePadding
		local LayoutOrder = p1.props.LayoutOrder
		local PlaceholderText = p1.props.PlaceholderText
		local ScaledBaseSize = _Font.BaseSize * _Font.Body.RelativeSize
		local XOffset = ScaledBaseSize + ImagePadding * 2
		local ForwardRef = p1.props.forwardRef
		
		return WithSelectionCursorProviderFunction(function(Callback)
			-- upvalues: RoactModule (upval), Theme (copy), LayoutOrder (copy), _Rect (upval), ImageSetLabel (upval), ImagePadding (copy), ScaledBaseSize (copy), Image (copy), Focusable (upval), _Font (copy), PlaceholderText (copy), XOffset (copy), p1 (upval), ForwardRef (copy), CursorKind (upval)
			return RoactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/LuaDiscussions/buttonStroke.png",
				ImageRectSize = Vector2.new(0, 0),
				ImageColor3 = Theme.UIDefault.Color,
				ImageRectOffset = Vector2.new(0, 0),
				LayoutOrder = LayoutOrder,
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.new(1, 0, 0, 30),
				SliceCenter = _Rect
			}, {
				IconImage = RoactModule.createElement(ImageSetLabel, {
					LayoutOrder = 1,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					AnchorPoint = Vector2.new(0, 0.5),
					Position = UDim2.new(0, ImagePadding, 0.5, 0),
					Size = UDim2.new(0, ScaledBaseSize, 0, ScaledBaseSize),
					Image = Image,
					ImageColor3 = Theme.TextDefault.Color,
					ImageTransparency = Theme.TextDefault.Transparency
				}),
				Textbox = RoactModule.createElement(Focusable.TextBox, {
					BackgroundTransparency = 1,
					ClearTextOnFocus = false,
					Font = _Font.Header2.Font,
					PlaceholderText = PlaceholderText,
					PlaceholderColor3 = Theme.PlaceHolder.Color,
					Position = UDim2.new(0, XOffset, 0, 0),
					Size = UDim2.new(1, -XOffset, 1, 0),
					TextInputType = p1.props.TextInputType,
					Text = "",
					TextColor3 = Theme.TextDefault.Color,
					TextSize = ScaledBaseSize,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left,
					OverlayNativeInput = true,
					[RoactModule.Change.Text] = p1.props[RoactModule.Change.Text],
					[RoactModule.Ref] = ForwardRef,
					NextSelectionLeft = p1.props.NextSelectionLeft,
					NextSelectionRight = p1.props.NextSelectionRight,
					NextSelectionUp = p1.props.NextSelectionUp,
					NextSelectionDown = p1.props.NextSelectionDown,
					SelectionImageObject = Callback(CursorKind.RoundedRectNoInset)
				})
			})
		end)
	end)
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), IconTextBox (copy), CryoModule (copy)
	return RoactModule.createElement(IconTextBox, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)