local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local GenericTextLabelModule = require(Parent.Core.Text.GenericTextLabel.GenericTextLabel)
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local StyledTextLabel = RoactModule.PureComponent:extend("StyledTextLabel")
StyledTextLabel.validateProps = TModule.strictInterface({
	text = TModule.string,
	fontStyle = TModule.union(require(Parent.Core.Style.Validator.validateFontInfo), (require(Parent.Core.Style.Validator.validateTypographyInfo))),
	colorStyle = TModule.union(require(Parent.Core.Style.Validator.validateColorInfo), (require(Parent.Core.Style.Validator.validateColorToken))),
	textTruncate = TModule.optional(TModule.EnumItem),
	textWrapped = TModule.optional(TModule.boolean),
	textXAlignment = TModule.optional(TModule.EnumItem),
	textYAlignment = TModule.optional(TModule.EnumItem),
	size = TModule.optional(TModule.UDim2),
	maxSize = TModule.optional(TModule.Vector2),
	richText = TModule.optional(TModule.boolean),
	layoutOrder = TModule.optional(TModule.number),
	fluidSizing = TModule.optional(TModule.boolean),
	automaticSize = TModule.optional(TModule.EnumItem),
	lineHeight = TModule.optional(TModule.number),
	clipsDescendants = TModule.optional(TModule.boolean),
	onAbsoluteSizeChange = TModule.optional(TModule.callback),
	openTypeFeatures = TModule.optional(TModule.string)
})
StyledTextLabel.defaultProps = {
	richText = true,
	fluidSizing = true,
	lineHeight = 1.4,
	clipsDescendants = false,
	openTypeFeatures = nil,
	textXAlignment = Enum.TextXAlignment.Left,
	textYAlignment = Enum.TextYAlignment.Center,
	automaticSize = Enum.AutomaticSize.None
}

function StyledTextLabel.render(p1) --[[ Line: 64 ]]
	-- upvalues: RoactModule (copy), GenericTextLabelModule (copy)
	return RoactModule.createElement(GenericTextLabelModule, {
		maxSize = p1.props.maxSize,
		fontStyle = p1.props.fontStyle,
		colorStyle = p1.props.colorStyle,
		fluidSizing = p1.props.fluidSizing,
		Size = p1.props.size,
		Text = p1.props.text,
		TextXAlignment = p1.props.textXAlignment,
		TextYAlignment = p1.props.textYAlignment,
		TextTruncate = p1.props.textTruncate,
		TextWrapped = p1.props.textWrapped,
		LayoutOrder = p1.props.layoutOrder,
		RichText = p1.props.richText,
		AutomaticSize = p1.props.automaticSize,
		LineHeight = p1.props.lineHeight,
		ClipsDescendants = p1.props.clipsDescendants,
		openTypeFeatures = p1.props.openTypeFeatures,
		[RoactModule.Change.AbsoluteSize] = p1.props.onAbsoluteSizeChange
	})
end

return StyledTextLabel