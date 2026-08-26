local app = script:FindFirstAncestor("App")
local parent = app.Parent
local core = parent.Core
local parent_1 = parent.Parent
local tModule = require(parent_1.t)
local roactModule = require(parent_1.Roact)
local cryoModule = require(parent_1.Cryo)
local interactableModule = require(core.Control.Interactable)
local controlStateModule = require(core.Control.Enum.ControlState)
local getContentStyleModule = require(core.Button.getContentStyle)
local getTextSizeModule = require(core.Text.GetTextSize)
local cleanRichTextTagsModule = require(core.Text.CleanRichTextTags)
local withStyleModule = require(core.Style.withStyle)
local genericTextLabelModule = require(core.Text.GenericTextLabel.GenericTextLabel)
local hoverButtonBackgroundModule = require(core.Button.HoverButtonBackground)
local useCursorByTypeModule = require(app.SelectionCursor.useCursorByType)
local cursorTypeModule = require(app.SelectionCursor.CursorType)
local focusable = require(parent_1.RoactGamepad).Focusable
local linkButton = roactModule.PureComponent:extend("LinkButton")
linkButton.validateProps = tModule.strictInterface({
	onStateChanged = tModule.optional(tModule.callback),
	isDisabled = tModule.optional(tModule.boolean),
	fontStyle = tModule.optional(tModule.string),
	colorStyleDefault = tModule.optional(tModule.string),
	colorStyleHover = tModule.optional(tModule.string),
	hoverBackgroundEnabled = tModule.optional(tModule.boolean),
	underlineAlwaysEnabled = tModule.optional(tModule.boolean),
	userInteractionEnabled = tModule.optional(tModule.boolean),
	onActivated = tModule.optional(tModule.callback),
	anchorPoint = tModule.optional(tModule.Vector2),
	layoutOrder = tModule.optional(tModule.number),
	position = tModule.optional(tModule.UDim2),
	size = tModule.optional(tModule.UDim2),
	text = tModule.optional(tModule.string),
	minPaddingX = tModule.optional(tModule.number),
	minPaddingY = tModule.optional(tModule.number),
	selectionCursorKind = tModule.optional(tModule.userdata),
	debugGetTextSize = tModule.optional(tModule.callback),
	debugControlState = tModule.optional(controlStateModule.isEnumValue),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	buttonRef = tModule.optional(tModule.union(tModule.callback, tModule.table)),
	cursor = tModule.optional(tModule.table)
})
linkButton.defaultProps = {
	layoutOrder = 0,
	text = "",
	fontStyle = "Header2",
	colorStyleDefault = "TextLink",
	colorStyleHover = "TextLink",
	hoverBackgroundEnabled = false,
	underlineAlwaysEnabled = false,
	isDisabled = false,
	userInteractionEnabled = true,
	minPaddingX = 8,
	minPaddingY = 11,
	debugControlState = nil,
	anchorPoint = Vector2.new(0, 0),
	position = UDim2.new(0, 0, 0, 0),
	size = UDim2.fromScale(0, 0),
	debugGetTextSize = getTextSizeModule
}

function linkButton.init(p1)
	-- upvalues: controlStateModule (ref)
	p1:setState({ controlState = controlStateModule.Initialize })
	
	function p0.applyRichTextUnderline(p2)
		return "<u>" .. p1 .. "</u>"
	end
	
	function p0.onStateChanged(p2, p3)
		-- upvalues: p1 (ref)
		p1:setState({ controlState = p3 })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, p3)
		end
	end
end

function linkButton.render(p1)
	return p1:renderWithSelectionCursorProvider(nil, p1.props.cursor)
end

function linkButton.renderWithSelectionCursorProvider(p1, _, p2)
	-- upvalues: withStyleModule (ref), controlStateModule (ref), getContentStyleModule (ref), cleanRichTextTagsModule (ref), roactModule (ref), focusable (ref), interactableModule (ref), genericTextLabelModule (ref), hoverButtonBackgroundModule (ref)
	return withStyleModule(function(p3)
		-- upvalues: p1 (ref), controlStateModule (copy), getContentStyleModule (copy), cleanRichTextTagsModule (copy), p2 (ref), roactModule (copy), focusable (copy), interactableModule (copy), genericTextLabelModule (copy), hoverButtonBackgroundModule (copy)
		local debugControlState = p1.props.debugControlState or p1.state.controlState
		local var1 = getContentStyleModule({
			[controlStateModule.Default] = p1.props.colorStyleDefault,
			[controlStateModule.Hover] = p1.props.colorStyleHover
		}, debugControlState, p3)
		local fontStyle = p3.Font[p1.props.fontStyle]
		
		if p1.props.underlineAlwaysEnabled == true and debugControlState == controlStateModule.Hover then
			var1.Transparency = 0.3
		end
		local var2 = fontStyle.RelativeSize * p3.Font.BaseSize
		
		return roactModule.createElement(focusable[interactableModule], {
			AnchorPoint = p1.props.anchorPoint,
			LayoutOrder = p1.props.layoutOrder,
			Position = p1.props.position,
			Size = p1.props.size,
			isDisabled = p1.props.isDisabled,
			onStateChanged = p1.onStateChanged,
			userInteractionEnabled = p1.props.userInteractionEnabled,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			SelectionImageObject = p2,
			[roactModule.Event.Activated] = p1.props.onActivated,
			[roactModule.Ref] = p1.props.buttonRef,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown
		}, {
			sizeConstraint = roactModule.createElement("UISizeConstraint", {
				MinSize = Vector2.new(p1.props.debugGetTextSize(cleanRichTextTagsModule(p1.props.text), var2, fontStyle.Font, Vector2.new(10000, 0)).X + p1.props.minPaddingX * 2, var2 + p1.props.minPaddingY * 2)
			}),
			textLabel = roactModule.createElement(genericTextLabelModule, {
				BackgroundTransparency = 1,
				RichText = true,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Text = if p1.props.underlineAlwaysEnabled or debugControlState == controlStateModule.Hover or debugControlState == controlStateModule.Pressed then p1.applyRichTextUnderline(p1.props.text) else p1.props.text,
				fontStyle = fontStyle,
				colorStyle = var1
			}),
			background = p1.props.hoverBackgroundEnabled and (debugControlState == controlStateModule.Hover and roactModule.createElement(hoverButtonBackgroundModule))
		})
	end)
end

function LinkButtonFunctionalWrapper(p1)
	-- upvalues: useCursorByTypeModule (ref), cursorTypeModule (ref), roactModule (ref), linkButton (ref), cryoModule (ref)
	return roactModule.createElement(linkButton, cryoModule.Dictionary.join(p1, {
		cursor = useCursorByTypeModule(cursorTypeModule.RoundedRectNoInset)
	}))
end

return LinkButtonFunctionalWrapper