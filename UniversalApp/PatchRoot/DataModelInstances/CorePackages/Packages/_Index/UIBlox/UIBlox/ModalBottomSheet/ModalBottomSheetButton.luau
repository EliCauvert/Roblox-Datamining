local Parent = script.Parent.Parent.Parent
local RoactModule = require(Parent.Roact)
local TModule = require(Parent.t)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local ImagesModule = require(Parent.UIBlox.App.ImageSet.Images)
local ImageSetComponentModule = require(Parent.UIBlox.Core.ImageSet.ImageSetComponent)
local WithStyleModule = require(Parent.UIBlox.Core.Style.withStyle)
local RoundedFrameModule = require(Parent.UIBlox.App.Menu.RoundedFrame)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local ModalBottomSheetButton = RoactModule.PureComponent:extend("ModalBottomSheetButton")
local ImageRectSize = ImagesModule["component_assets/circle_17"].ImageRectSize
local ImageRectOffset = ImagesModule["component_assets/circle_17"].ImageRectOffset
local ScaledImagesResolutionScale = 8 * ImagesModule.ImagesResolutionScale
local ScaledImagesResolutionScale1 = 8 * ImagesModule.ImagesResolutionScale
local _Rect = Rect.new(ScaledImagesResolutionScale, ScaledImagesResolutionScale1, ImageRectSize.x - ScaledImagesResolutionScale, ImageRectSize.y - ScaledImagesResolutionScale1)
local ScaledImagesResolutionScale2 = 8 * ImagesModule.ImagesResolutionScale
ModalBottomSheetButton.validateProps = TModule.strictInterface({
	icon = TModule.optional(TModule.union(TModule.table, TModule.string)),
	text = TModule.optional(TModule.string),
	onActivated = TModule.optional(TModule.callback),
	renderRightElement = TModule.optional(TModule.callback),
	showImage = TModule.boolean,
	isFixed = TModule.boolean,
	onActivatedAndDismissed = TModule.callback,
	elementHeight = TModule.integer,
	hasRoundBottom = TModule.boolean,
	hasRoundTop = TModule.boolean,
	LayoutOrder = TModule.integer,
	stayOnActivated = TModule.optional(TModule.boolean)
})
ModalBottomSheetButton.defaultProps = {
	text = "",
	icon = {},
	onActivated = function() end
}

function ModalBottomSheetButton.init(p1)
	-- upvalues: RoactModule (copy)
	p1.pressed, p1.updatePressed = RoactModule.createBinding(false)
	p1.ref = RoactModule.createRef()
	
	function p1.onColorChange(ImageColor3)
		-- upvalues: p1 (copy)
		if p1.ref.current then
			p1.ref.current.ImageColor3 = ImageColor3
			
			return
		end
	end
	
	function p1.onInputBegan(Input): boolean
		return Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch
	end
	
	function p1.onInputEnd(Input): boolean
		return Input.UserInputType == Enum.UserInputType.MouseButton1 or Input.UserInputType == Enum.UserInputType.Touch
	end
end

function ModalBottomSheetButton.render(p1)
	-- upvalues: ImageRectSize (copy), ImageRectOffset (copy), _Rect (copy), WithStyleModule (copy), RoactModule (copy), ImagesModule (copy), ImageSetComponentModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), RoundedFrameModule (copy), ScaledImagesResolutionScale2 (copy)
	local HasRoundTop = p1.props.hasRoundTop
	local HasRoundBottom = p1.props.hasRoundBottom
	local ImageRectSize1 = nil
	local NewVector = nil
	local SliceCenter: Rect? = nil
	local X: number = ImageRectSize.X
	local Y = X / 2
	
	if HasRoundTop and HasRoundBottom then
		ImageRectSize1 = ImageRectSize
		NewVector = ImageRectOffset
		SliceCenter = _Rect
	elseif HasRoundTop then
		ImageRectSize1 = Vector2.new(X, Y)
		NewVector = ImageRectOffset
		SliceCenter = Rect.new(Y - 1, Y - 1, Y + 1, Y)
	elseif HasRoundBottom then
		ImageRectSize1 = Vector2.new(X, Y)
		NewVector = ImageRectOffset + Vector2.new(0, Y)
		SliceCenter = Rect.new(Y - 1, 0, Y + 1, 1)
	else
		ImageRectSize1 = Vector2.new(1, 1)
		NewVector = ImageRectOffset + Vector2.new(Y, Y)
	end
	local ElementHeight: number = p1.props.elementHeight
	local _UDim2 = nil
	_UDim2 = if p1.props.isFixed then UDim2.new(0, 300, 0, ElementHeight) else UDim2.new(1, -32, 0, ElementHeight)
	local Offset: number = if p1.props.showImage or p1.props.renderRightElement then 12 else 24
	local Offset1: number = Offset
	local XOffset = ElementHeight * 0.8
	
	if p1.props.showImage then
		Offset1 = Offset1 + XOffset + Offset
	end
	if p1.props.renderRightElement then
		Offset1 = Offset1 + XOffset + Offset
	end
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), RoactModule (upval), SliceCenter (ref), ImagesModule (upval), ImageRectSize1 (ref), NewVector (ref), Offset (ref), ImageSetComponentModule (upval), XOffset (copy), Offset1 (ref), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), HasRoundBottom (copy), _UDim2 (ref), RoundedFrameModule (upval), HasRoundTop (copy), ScaledImagesResolutionScale2 (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		local Color = Theme.TextEmphasis.Color
		local Transparency = Theme.TextEmphasis.Transparency
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p1.props.LayoutOrder,
			Size = _UDim2
		}, {
			Background = RoactModule.createElement(RoundedFrameModule, {
				zIndex = -1,
				background = Theme.BackgroundUIDefault,
				topCornerRadius = if HasRoundTop then UDim.new(0, ScaledImagesResolutionScale2) else nil,
				bottomCornerRadius = if HasRoundBottom then UDim.new(0, ScaledImagesResolutionScale2) else nil
			}),
			Button = RoactModule.createElement("ImageButton", {
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = SliceCenter,
				Image = ImagesModule["component_assets/circle_17"].Image,
				ImageColor3 = p1.pressed:map(function(p3)
					-- upvalues: Theme (copy)
					return if p3 then Theme.BackgroundOnPress.Color else Theme.BackgroundUIDefault.Color
				end),
				ImageRectSize = ImageRectSize1,
				ImageRectOffset = NewVector,
				ImageTransparency = p1.pressed:map(function(p3)
					-- upvalues: Theme (copy)
					return if p3 then Theme.BackgroundOnPress.Transparency else Theme.BackgroundUIDefault.Transparency
				end),
				Size = UDim2.fromScale(1, 1),
				LayoutOrder = p1.props.LayoutOrder,
				[RoactModule.Ref] = p1.ref,
				[RoactModule.Event.Activated] = p1.props.onActivatedAndDismissed,
				[RoactModule.Event.InputBegan] = function(_, Input)
					-- upvalues: p1 (upval)
					if p1.onInputBegan(Input) then
						p1.updatePressed(true)
					end
				end,
				[RoactModule.Event.InputEnded] = function(_, Input)
					-- upvalues: p1 (upval)
					if p1.onInputEnd(Input) then
						p1.updatePressed(false)
					end
				end
			}, {
				buttonContents = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					horizontalLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, Offset)
					}),
					padding = RoactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, Offset),
						PaddingTop = UDim.new(0.1, 0),
						PaddingBottom = UDim.new(0.1, 0)
					}),
					icon = p1.props.showImage and RoactModule.createElement(ImageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Image = p1.props.icon,
						ImageColor3 = Color,
						ImageTransparency = Transparency,
						Size = UDim2.new(0, XOffset, 0, XOffset)
					}) or nil,
					textLabel = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(1, -Offset1, 1, 0),
						Text = p1.props.text,
						TextTransparency = Transparency,
						Font = if FoundationFontFaceMigration then nil else _Font.Header2.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(_Font.Header2.Font) else nil,
						TextColor3 = Color,
						TextSize = _Font.Header2.RelativeSize * _Font.BaseSize,
						TextTruncate = Enum.TextTruncate.AtEnd
					}),
					rightContainer = p1.props.renderRightElement and RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(0, XOffset, 0, XOffset)
					}, { hint = p1.props.renderRightElement() })
				}),
				bottomBorder = not HasRoundBottom and RoactModule.createElement("Frame", {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					BackgroundColor3 = Theme.Divider.Color,
					Size = UDim2.new(1, 0, 0, 1),
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.new(0, 0, 1, 0)
				})
			})
		})
	end)
end

return ModalBottomSheetButton