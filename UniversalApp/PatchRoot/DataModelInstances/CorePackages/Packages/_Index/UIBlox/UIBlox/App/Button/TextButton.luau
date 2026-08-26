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

function textButton.init(p1)
	-- upvalues: controlStateModule (ref)
	p1:setState({ controlState = controlStateModule.Initialize })
	
	function p0.onStateChanged(p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({ controlState = p3 })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, p3)
		end
	end
end

function textButton.render(p1)
	-- upvalues: withStyleModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithProviders(p2, nil, nil)
	end)
end

function textButton.renderWithProviders(p1, p2, p3, p4)
	-- upvalues: controlStateModule (ref), getContentStyleModule (ref), cleanRichTextTagsModule (ref), roactModule (ref), interactableModule (ref), reactModule (ref), uDim (ref), cursorKindModule (ref), genericTextLabelModule (ref)
	local debugControlState = p1.props.debugControlState or p1.state.controlState
	local var1 = getContentStyleModule({
		[controlStateModule.Default] = p1.props.colorStyleDefault,
		[controlStateModule.Hover] = p1.props.colorStyleHover
	}, debugControlState, p2)
	local fontStyle = p2.Font[p1.props.fontStyle]
	local var2 = fontStyle.RelativeSize * p2.Font.BaseSize
	local x = p1.props.debugGetTextSize(p1.props.richText and cleanRichTextTagsModule(p1.props.text) or p1.props.text, var2, fontStyle.Font, Vector2.new(10000, 0)).X
	local var3 = if p1.props.showBackground then p1.props.backgroundColor or p2.Theme.UIMuted else { Color = nil, Transparency = 1 }
	local verticalPadding = p1.props.verticalPadding
	local horizontalPadding = p1.props.horizontalPadding
	local backgroundOnHover = p2.Theme.BackgroundOnHover
	
	if p1.props.hoverBackgroundEnabled and debugControlState == controlStateModule.Hover then
		var3 = if var3.Color then {
			Color = var3.Color:Lerp(backgroundOnHover.Color, 1 - backgroundOnHover.Transparency),
			Transparency = var3.Transparency
		} else backgroundOnHover
	end
	return roactModule.createElement(interactableModule, {
		[reactModule.Tag] = p1.props[reactModule.Tag],
		AnchorPoint = p1.props.anchorPoint,
		LayoutOrder = p1.props.layoutOrder,
		Position = p1.props.position,
		Size = p1.props.size,
		isDisabled = p1.props.isDisabled,
		onStateChanged = p1.onStateChanged,
		userInteractionEnabled = p1.props.userInteractionEnabled,
		BackgroundColor3 = var3.Color,
		BackgroundTransparency = var3.Transparency,
		AutoButtonColor = false,
		SelectionImageObject = if p4 then p4(uDim) else p3 and p3(cursorKindModule.RoundedRectNoInset),
		[roactModule.Event.Activated] = p1.props.onActivated
	}, {
		corner = roactModule.createElement("UICorner", { CornerRadius = uDim }),
		sizeConstraint = roactModule.createElement("UISizeConstraint", {
			MinSize = Vector2.new(x + horizontalPadding * 2, var2 + verticalPadding * 2)
		}),
		textLabel = roactModule.createElement(genericTextLabelModule, {
			BackgroundTransparency = 1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			Text = p1.props.text,
			fontStyle = fontStyle,
			colorStyle = var1,
			RichText = p1.props.richText
		})
	})
end

local function TextButtonFunctionalWrapper(p1)
	-- upvalues: useCursorModule (ref), uDim (ref), roactModule (ref), textButton (ref), cryoModule (ref)
	return roactModule.createElement(textButton, cryoModule.Dictionary.join(p1, { cursor = useCursorModule(uDim) }))
end

local textButtonOuterWrapper = roactModule.PureComponent:extend("TextButtonOuterWrapper")
textButtonOuterWrapper.validateProps = textButton.validateProps

function textButtonOuterWrapper.render(p1)
	-- upvalues: roactModule (ref), TextButtonFunctionalWrapper (ref)
	return roactModule.createElement(TextButtonFunctionalWrapper, p1.props)
end

return textButtonOuterWrapper