local App = script:FindFirstAncestor("App")
local Parent = App.Parent
local Core = Parent.Core
local Parent1 = Parent.Parent
local TModule = require(Parent1.t)
local RoactModule = require(Parent1.Roact)
local ReactModule = require(Parent1.React)
local CryoModule = require(Parent1.Cryo)
local InteractableModule = require(Core.Control.Interactable)
local ControlStateModule = require(Core.Control.Enum.ControlState)
local GetContentStyleModule = require(Core.Button.getContentStyle)
local GetTextSizeModule = require(Core.Text.GetTextSize)
local CleanRichTextTagsModule = require(Core.Text.CleanRichTextTags)
local CursorKindModule = require(App.SelectionImage.CursorKind)
local WithStyleModule = require(Core.Style.withStyle)
local GenericTextLabelModule = require(Core.Text.GenericTextLabel.GenericTextLabel)
local UseCursorModule = require(Parent.App.SelectionCursor.useCursor)
local _UDim = UDim.new(0, 8)
local TextButton = RoactModule.PureComponent:extend("TextButton")
TextButton.validateProps = TModule.strictInterface({
	[ReactModule.Tag] = require(Parent.Utility.isReactTagProp),
	onStateChanged = TModule.optional(TModule.callback),
	isDisabled = TModule.optional(TModule.boolean),
	fontStyle = TModule.optional(TModule.string),
	colorStyleDefault = TModule.optional(TModule.string),
	colorStyleHover = TModule.optional(TModule.string),
	hoverBackgroundEnabled = TModule.optional(TModule.boolean),
	richText = TModule.optional(TModule.boolean),
	showBackground = TModule.optional(TModule.boolean),
	backgroundColor = TModule.optional((require(Core.Style.Validator.validateColorInfo))),
	horizontalPadding = TModule.optional(TModule.number),
	verticalPadding = TModule.optional(TModule.number),
	userInteractionEnabled = TModule.optional(TModule.boolean),
	onActivated = TModule.optional(TModule.callback),
	anchorPoint = TModule.optional(TModule.Vector2),
	layoutOrder = TModule.optional(TModule.number),
	position = TModule.optional(TModule.UDim2),
	size = TModule.optional(TModule.UDim2),
	text = TModule.optional(TModule.string),
	cursor = TModule.optional(TModule.table),
	debugGetTextSize = TModule.optional(TModule.callback),
	debugControlState = TModule.optional(ControlStateModule.isEnumValue)
})
TextButton.defaultProps = {
	layoutOrder = 0,
	text = "",
	verticalPadding = 11,
	horizontalPadding = 8,
	showBackground = false,
	fontStyle = "Header2",
	colorStyleDefault = "TextEmphasis",
	colorStyleHover = "TextEmphasis",
	hoverBackgroundEnabled = true,
	richText = false,
	isDisabled = false,
	userInteractionEnabled = true,
	debugControlState = nil,
	anchorPoint = Vector2.new(0, 0),
	position = UDim2.new(0, 0, 0, 0),
	size = UDim2.fromScale(0, 0),
	debugGetTextSize = GetTextSizeModule
}

function TextButton.init(p1)
	-- upvalues: ControlStateModule (copy)
	p1:setState({ controlState = ControlStateModule.Initialize })
	
	function p1.onStateChanged(p2, ControlState)
		-- upvalues: p1 (copy)
		p1:setState({ controlState = ControlState })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, ControlState)
		end
	end
end

function TextButton.render(p1)
	-- upvalues: WithStyleModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithProviders(p2, nil, nil)
	end)
end

function TextButton.renderWithProviders(p1, p2, Callback1, Callback)
	-- upvalues: ControlStateModule (copy), GetContentStyleModule (copy), CleanRichTextTagsModule (copy), RoactModule (copy), InteractableModule (copy), ReactModule (copy), _UDim (copy), CursorKindModule (copy), GenericTextLabelModule (copy)
	local DebugControlState = p1.props.debugControlState or p1.state.controlState
	local ContentStyleModule = GetContentStyleModule({
		[ControlStateModule.Default] = p1.props.colorStyleDefault,
		[ControlStateModule.Hover] = p1.props.colorStyleHover
	}, DebugControlState, p2)
	local FontStyle = p2.Font[p1.props.fontStyle]
	local ScaledRelativeSize = FontStyle.RelativeSize * p2.Font.BaseSize
	local X = p1.props.debugGetTextSize(p1.props.richText and CleanRichTextTagsModule(p1.props.text) or p1.props.text, ScaledRelativeSize, FontStyle.Font, Vector2.new(10000, 0)).X
	local BackgroundColor = if p1.props.showBackground then p1.props.backgroundColor or p2.Theme.UIMuted else { Color = nil, Transparency = 1 }
	local VerticalPadding: number = p1.props.verticalPadding
	local HorizontalPadding: number = p1.props.horizontalPadding
	local BackgroundOnHover = p2.Theme.BackgroundOnHover
	
	if p1.props.hoverBackgroundEnabled and DebugControlState == ControlStateModule.Hover then
		if BackgroundColor.Color then
			BackgroundColor = {
				Color = BackgroundColor.Color:Lerp(BackgroundOnHover.Color, 1 - BackgroundOnHover.Transparency),
				Transparency = BackgroundColor.Transparency
			}
		else
			BackgroundColor = BackgroundOnHover
		end
	end
	return RoactModule.createElement(InteractableModule, {
		[ReactModule.Tag] = p1.props[ReactModule.Tag],
		AnchorPoint = p1.props.anchorPoint,
		LayoutOrder = p1.props.layoutOrder,
		Position = p1.props.position,
		Size = p1.props.size,
		isDisabled = p1.props.isDisabled,
		onStateChanged = p1.onStateChanged,
		userInteractionEnabled = p1.props.userInteractionEnabled,
		BackgroundColor3 = BackgroundColor.Color,
		BackgroundTransparency = BackgroundColor.Transparency,
		AutoButtonColor = false,
		SelectionImageObject = if Callback then Callback(_UDim) else Callback1 and Callback1(CursorKindModule.RoundedRectNoInset),
		[RoactModule.Event.Activated] = p1.props.onActivated
	}, {
		corner = RoactModule.createElement("UICorner", { CornerRadius = _UDim }),
		sizeConstraint = RoactModule.createElement("UISizeConstraint", {
			MinSize = Vector2.new(X + HorizontalPadding * 2, ScaledRelativeSize + VerticalPadding * 2)
		}),
		textLabel = RoactModule.createElement(GenericTextLabelModule, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Text = p1.props.text,
			fontStyle = FontStyle,
			colorStyle = ContentStyleModule,
			RichText = p1.props.richText
		})
	})
end

local function TextButtonFunctionalWrapper(p1)
	-- upvalues: UseCursorModule (copy), _UDim (copy), RoactModule (copy), TextButton (copy), CryoModule (copy)
	return RoactModule.createElement(TextButton, CryoModule.Dictionary.join(p1, { cursor = UseCursorModule(_UDim) }))
end

local TextButtonOuterWrapper = RoactModule.PureComponent:extend("TextButtonOuterWrapper")
TextButtonOuterWrapper.validateProps = TextButton.validateProps

function TextButtonOuterWrapper.render(p1)
	-- upvalues: RoactModule (copy), TextButtonFunctionalWrapper (copy)
	return RoactModule.createElement(TextButtonFunctionalWrapper, p1.props)
end

return TextButtonOuterWrapper