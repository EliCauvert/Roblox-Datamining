local app = script:FindFirstAncestor("App")
local parent = app.Parent
local core = parent.Core
local parent_1 = parent.Parent
local tModule = require(parent_1.t)
local roactModule = require(parent_1.Roact)
local reactModule = require(parent_1.React)
local cryoModule = require(parent_1.Cryo)
local interactableModule = require(core.Control.Interactable)
local controlStateModule = require(core.Control.Enum.ControlState)
local getContentStyleModule = require(core.Button.getContentStyle)
local getTextSizeModule = require(core.Text.GetTextSize)
local cleanRichTextTagsModule = require(core.Text.CleanRichTextTags)
local isReactTagPropModule = require(parent.Utility.isReactTagProp)
local cursorKindModule = require(app.SelectionImage.CursorKind)
local validateColorInfoModule = require(core.Style.Validator.validateColorInfo)
local withStyleModule = require(core.Style.withStyle)
local genericTextLabelModule = require(core.Text.GenericTextLabel.GenericTextLabel)
local useCursorModule = require(parent.App.SelectionCursor.useCursor)
local uDim = UDim.new(0, 8)
local textButton = roactModule.PureComponent:extend("TextButton")
textButton.validateProps = tModule.strictInterface({
	[reactModule.Tag] = isReactTagPropModule,
	onStateChanged = tModule.optional(tModule.callback),
	isDisabled = tModule.optional(tModule.boolean),
	fontStyle = tModule.optional(tModule.string),
	colorStyleDefault = tModule.optional(tModule.string),
	colorStyleHover = tModule.optional(tModule.string),
	hoverBackgroundEnabled = tModule.optional(tModule.boolean),
	richText = tModule.optional(tModule.boolean),
	showBackground = tModule.optional(tModule.boolean),
	backgroundColor = tModule.optional(validateColorInfoModule),
	horizontalPadding = tModule.optional(tModule.number),
	verticalPadding = tModule.optional(tModule.number),
	userInteractionEnabled = tModule.optional(tModule.boolean),
	onActivated = tModule.optional(tModule.callback),
	anchorPoint = tModule.optional(tModule.Vector2),
	layoutOrder = tModule.optional(tModule.number),
	position = tModule.optional(tModule.UDim2),
	size = tModule.optional(tModule.UDim2),
	text = tModule.optional(tModule.string),
	cursor = tModule.optional(tModule.table),
	debugGetTextSize = tModule.optional(tModule.callback),
	debugControlState = tModule.optional(controlStateModule.isEnumValue)
})
textButton.defaultProps = {
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
	debugGetTextSize = getTextSizeModule
}

function textButton.init(p0)
	-- upvalues: controlStateModule (ref)
	p0:setState({ controlState = controlStateModule.Initialize })
	
	function p0.onStateChanged(p1, p2)
		-- upvalues: p0 (ref)
		p0:setState({ controlState = p2 })
		
		if p0.props.onStateChanged then
			p0.props.onStateChanged(p1, p2)
		end
	end
end

function textButton.render(p3)
	-- upvalues: withStyleModule (ref)
	return withStyleModule(function(p4)
		-- upvalues: p3 (ref)
		return p3:renderWithProviders(p4, nil, nil)
	end)
end

function textButton.renderWithProviders(p5, p6, p7, p8)
	-- upvalues: controlStateModule (ref), getContentStyleModule (ref), cleanRichTextTagsModule (ref), roactModule (ref), interactableModule (ref), reactModule (ref), uDim (ref), cursorKindModule (ref), genericTextLabelModule (ref)
	local debugControlState = p5.props.debugControlState or p5.state.controlState
	local var21 = getContentStyleModule({
		[controlStateModule.Default] = p5.props.colorStyleDefault,
		[controlStateModule.Hover] = p5.props.colorStyleHover
	}, debugControlState, p6)
	local fontStyle = p6.Font[p5.props.fontStyle]
	local var22 = fontStyle.RelativeSize * p6.Font.BaseSize
	local x = p5.props.debugGetTextSize(p5.props.richText and cleanRichTextTagsModule(p5.props.text) or p5.props.text, var22, fontStyle.Font, Vector2.new(10000, 0)).X
	local var23 = if p5.props.showBackground then p5.props.backgroundColor or p6.Theme.UIMuted else { Color = nil, Transparency = 1 }
	local verticalPadding = p5.props.verticalPadding
	local horizontalPadding = p5.props.horizontalPadding
	local backgroundOnHover = p6.Theme.BackgroundOnHover
	
	if p5.props.hoverBackgroundEnabled and debugControlState == controlStateModule.Hover then
		var23 = if var23.Color then {
			Color = var23.Color:Lerp(backgroundOnHover.Color, 1 - backgroundOnHover.Transparency),
			Transparency = var23.Transparency
		} else backgroundOnHover
	end
	return roactModule.createElement(interactableModule, {
		[reactModule.Tag] = p5.props[reactModule.Tag],
		AnchorPoint = p5.props.anchorPoint,
		LayoutOrder = p5.props.layoutOrder,
		Position = p5.props.position,
		Size = p5.props.size,
		isDisabled = p5.props.isDisabled,
		onStateChanged = p5.onStateChanged,
		userInteractionEnabled = p5.props.userInteractionEnabled,
		BackgroundColor3 = var23.Color,
		BackgroundTransparency = var23.Transparency,
		AutoButtonColor = false,
		SelectionImageObject = if p8 then p8(uDim) else p7 and p7(cursorKindModule.RoundedRectNoInset),
		[roactModule.Event.Activated] = p5.props.onActivated
	}, {
		corner = roactModule.createElement("UICorner", { CornerRadius = uDim }),
		sizeConstraint = roactModule.createElement("UISizeConstraint", {
			MinSize = Vector2.new(x + horizontalPadding * 2, var22 + verticalPadding * 2)
		}),
		textLabel = roactModule.createElement(genericTextLabelModule, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Text = p5.props.text,
			fontStyle = fontStyle,
			colorStyle = var21,
			RichText = p5.props.richText
		})
	})
end

local function TextButtonFunctionalWrapper(p9)
	-- upvalues: useCursorModule (ref), uDim (ref), roactModule (ref), textButton (ref), cryoModule (ref)
	return roactModule.createElement(textButton, cryoModule.Dictionary.join(p9, { cursor = useCursorModule(uDim) }))
end

local textButtonOuterWrapper = roactModule.PureComponent:extend("TextButtonOuterWrapper")
textButtonOuterWrapper.validateProps = textButton.validateProps

function textButtonOuterWrapper.render(p10)
	-- upvalues: roactModule (ref), TextButtonFunctionalWrapper (ref)
	return roactModule.createElement(TextButtonFunctionalWrapper, p10.props)
end

return textButtonOuterWrapper