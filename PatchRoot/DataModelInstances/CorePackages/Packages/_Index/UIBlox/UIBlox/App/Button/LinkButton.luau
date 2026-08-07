-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:51 2026 Pacific Standard Time.

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

function linkButton.init(p0) --[[ line: 109 ]]
	-- upvalues: controlStateModule (ref)
	p0:setState({ controlState = controlStateModule.Initialize })
	
	function p0.applyRichTextUnderline(p1) --[[ line: 114 ]]
		return "<u>" .. p1 .. "</u>"
	end
	
	function p0.onStateChanged(p2, p3) --[[ line: 118 ]]
		-- upvalues: p0 (ref)
		p0:setState({ controlState = p3 })
		
		if p0.props.onStateChanged then
			p0.props.onStateChanged(p2, p3)
		end
	end
end

function linkButton.render(p4) --[[ line: 128 ]]
	return p4:renderWithSelectionCursorProvider(nil, p4.props.cursor)
end

function linkButton.renderWithSelectionCursorProvider(p5, _, p6) --[[ line: 132 ]]
	-- upvalues: withStyleModule (ref), controlStateModule (ref), getContentStyleModule (ref), cleanRichTextTagsModule (ref), roactModule (ref), focusable (ref), interactableModule (ref), genericTextLabelModule (ref), hoverButtonBackgroundModule (ref)
	return withStyleModule(function(p7) --[[ line: 133 ]]
		-- upvalues: p5 (ref), controlStateModule (copy), getContentStyleModule (copy), cleanRichTextTagsModule (copy), p6 (ref), roactModule (copy), focusable (copy), interactableModule (copy), genericTextLabelModule (copy), hoverButtonBackgroundModule (copy)
		local debugControlState = p5.props.debugControlState or p5.state.controlState
		local var16 = getContentStyleModule({
			[controlStateModule.Default] = p5.props.colorStyleDefault,
			[controlStateModule.Hover] = p5.props.colorStyleHover
		}, debugControlState, p7)
		local fontStyle = p7.Font[p5.props.fontStyle]
		
		if p5.props.underlineAlwaysEnabled == true and debugControlState == controlStateModule.Hover then
			var16.Transparency = 0.3
		end
		local var17 = fontStyle.RelativeSize * p7.Font.BaseSize
		
		return roactModule.createElement(focusable[interactableModule], {
			AnchorPoint = p5.props.anchorPoint,
			LayoutOrder = p5.props.layoutOrder,
			Position = p5.props.position,
			Size = p5.props.size,
			isDisabled = p5.props.isDisabled,
			onStateChanged = p5.onStateChanged,
			userInteractionEnabled = p5.props.userInteractionEnabled,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			SelectionImageObject = p6,
			[roactModule.Event.Activated] = p5.props.onActivated,
			[roactModule.Ref] = p5.props.buttonRef,
			NextSelectionLeft = p5.props.NextSelectionLeft,
			NextSelectionRight = p5.props.NextSelectionRight,
			NextSelectionUp = p5.props.NextSelectionUp,
			NextSelectionDown = p5.props.NextSelectionDown
		}, {
			sizeConstraint = roactModule.createElement("UISizeConstraint", {
				MinSize = Vector2.new(p5.props.debugGetTextSize(cleanRichTextTagsModule(p5.props.text), var17, fontStyle.Font, Vector2.new(10000, 0)).X + p5.props.minPaddingX * 2, var17 + p5.props.minPaddingY * 2)
			}),
			textLabel = roactModule.createElement(genericTextLabelModule, {
				BackgroundTransparency = 1,
				RichText = true,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Text = if p5.props.underlineAlwaysEnabled or debugControlState == controlStateModule.Hover or debugControlState == controlStateModule.Pressed then p5.applyRichTextUnderline(p5.props.text) else p5.props.text,
				fontStyle = fontStyle,
				colorStyle = var16
			}),
			background = p5.props.hoverBackgroundEnabled and (debugControlState == controlStateModule.Hover and roactModule.createElement(hoverButtonBackgroundModule))
		})
	end)
end

function LinkButtonFunctionalWrapper(p8) --[[ line: 209 ]]
	-- upvalues: useCursorByTypeModule (ref), cursorTypeModule (ref), roactModule (ref), linkButton (ref), cryoModule (ref)
	return roactModule.createElement(linkButton, cryoModule.Dictionary.join(p8, {
		cursor = useCursorByTypeModule(cursorTypeModule.RoundedRectNoInset)
	}))
end

return LinkButtonFunctionalWrapper