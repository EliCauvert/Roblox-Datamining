local App = script:FindFirstAncestor("App")
local Parent = App.Parent
local Core = Parent.Core
local Parent1 = Parent.Parent
local TModule = require(Parent1.t)
local RoactModule = require(Parent1.Roact)
local CryoModule = require(Parent1.Cryo)
local InteractableModule = require(Core.Control.Interactable)
local ControlStateModule = require(Core.Control.Enum.ControlState)
local GetContentStyleModule = require(Core.Button.getContentStyle)
local GetTextSizeModule = require(Core.Text.GetTextSize)
local CleanRichTextTagsModule = require(Core.Text.CleanRichTextTags)
local WithStyleModule = require(Core.Style.withStyle)
local GenericTextLabelModule = require(Core.Text.GenericTextLabel.GenericTextLabel)
local HoverButtonBackgroundModule = require(Core.Button.HoverButtonBackground)
local UseCursorByTypeModule = require(App.SelectionCursor.useCursorByType)
local CursorTypeModule = require(App.SelectionCursor.CursorType)
local Focusable = require(Parent1.RoactGamepad).Focusable
local LinkButton = RoactModule.PureComponent:extend("LinkButton")
LinkButton.validateProps = TModule.strictInterface({
	onStateChanged = TModule.optional(TModule.callback),
	isDisabled = TModule.optional(TModule.boolean),
	fontStyle = TModule.optional(TModule.string),
	colorStyleDefault = TModule.optional(TModule.string),
	colorStyleHover = TModule.optional(TModule.string),
	hoverBackgroundEnabled = TModule.optional(TModule.boolean),
	underlineAlwaysEnabled = TModule.optional(TModule.boolean),
	userInteractionEnabled = TModule.optional(TModule.boolean),
	onActivated = TModule.optional(TModule.callback),
	anchorPoint = TModule.optional(TModule.Vector2),
	layoutOrder = TModule.optional(TModule.number),
	position = TModule.optional(TModule.UDim2),
	size = TModule.optional(TModule.UDim2),
	text = TModule.optional(TModule.string),
	minPaddingX = TModule.optional(TModule.number),
	minPaddingY = TModule.optional(TModule.number),
	selectionCursorKind = TModule.optional(TModule.userdata),
	debugGetTextSize = TModule.optional(TModule.callback),
	debugControlState = TModule.optional(ControlStateModule.isEnumValue),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	buttonRef = TModule.optional(TModule.union(TModule.callback, TModule.table)),
	cursor = TModule.optional(TModule.table)
})
LinkButton.defaultProps = {
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
	debugGetTextSize = GetTextSizeModule
}

function LinkButton.init(p1)
	-- upvalues: ControlStateModule (copy)
	p1:setState({ controlState = ControlStateModule.Initialize })
	
	function p1.applyRichTextUnderline(Text): string
		return "<u>" .. Text .. "</u>"
	end
	
	function p1.onStateChanged(p2, ControlState)
		-- upvalues: p1 (copy)
		p1:setState({ controlState = ControlState })
		
		if p1.props.onStateChanged then
			p1.props.onStateChanged(p2, ControlState)
		end
	end
end

function LinkButton.render(p1)
	return p1:renderWithSelectionCursorProvider(nil, p1.props.cursor)
end

function LinkButton.renderWithSelectionCursorProvider(p1, _, SelectionImageObject)
	-- upvalues: WithStyleModule (copy), ControlStateModule (copy), GetContentStyleModule (copy), CleanRichTextTagsModule (copy), RoactModule (copy), Focusable (copy), InteractableModule (copy), GenericTextLabelModule (copy), HoverButtonBackgroundModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), ControlStateModule (upval), GetContentStyleModule (upval), CleanRichTextTagsModule (upval), SelectionImageObject (copy), RoactModule (upval), Focusable (upval), InteractableModule (upval), GenericTextLabelModule (upval), HoverButtonBackgroundModule (upval)
		local DebugControlState = p1.props.debugControlState or p1.state.controlState
		local ContentStyleModule = GetContentStyleModule({
			[ControlStateModule.Default] = p1.props.colorStyleDefault,
			[ControlStateModule.Hover] = p1.props.colorStyleHover
		}, DebugControlState, p2)
		local FontStyle = p2.Font[p1.props.fontStyle]
		
		if p1.props.underlineAlwaysEnabled == true and DebugControlState == ControlStateModule.Hover then
			ContentStyleModule.Transparency = 0.3
		end
		local ScaledRelativeSize = FontStyle.RelativeSize * p2.Font.BaseSize
		
		return RoactModule.createElement(Focusable[InteractableModule], {
			AnchorPoint = p1.props.anchorPoint,
			LayoutOrder = p1.props.layoutOrder,
			Position = p1.props.position,
			Size = p1.props.size,
			isDisabled = p1.props.isDisabled,
			onStateChanged = p1.onStateChanged,
			userInteractionEnabled = p1.props.userInteractionEnabled,
			BackgroundTransparency = 1,
			AutoButtonColor = false,
			SelectionImageObject = SelectionImageObject,
			[RoactModule.Event.Activated] = p1.props.onActivated,
			[RoactModule.Ref] = p1.props.buttonRef,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown
		}, {
			sizeConstraint = RoactModule.createElement("UISizeConstraint", {
				MinSize = Vector2.new(p1.props.debugGetTextSize(CleanRichTextTagsModule(p1.props.text), ScaledRelativeSize, FontStyle.Font, Vector2.new(10000, 0)).X + p1.props.minPaddingX * 2, ScaledRelativeSize + p1.props.minPaddingY * 2)
			}),
			textLabel = RoactModule.createElement(GenericTextLabelModule, {
				BackgroundTransparency = 1,
				RichText = true,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				Text = if p1.props.underlineAlwaysEnabled or DebugControlState == ControlStateModule.Hover or DebugControlState == ControlStateModule.Pressed then p1.applyRichTextUnderline(p1.props.text) else p1.props.text,
				fontStyle = FontStyle,
				colorStyle = ContentStyleModule
			}),
			background = p1.props.hoverBackgroundEnabled and (DebugControlState == ControlStateModule.Hover and RoactModule.createElement(HoverButtonBackgroundModule))
		})
	end)
end

function LinkButtonFunctionalWrapper(p1)
	-- upvalues: UseCursorByTypeModule (copy), CursorTypeModule (copy), RoactModule (copy), LinkButton (copy), CryoModule (copy)
	return RoactModule.createElement(LinkButton, CryoModule.Dictionary.join(p1, {
		cursor = UseCursorByTypeModule(CursorTypeModule.RoundedRectNoInset)
	}))
end

return LinkButtonFunctionalWrapper