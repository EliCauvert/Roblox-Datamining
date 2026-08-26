local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local genericTextLabelModule = require(parent.Core.Text.GenericTextLabel.GenericTextLabel)
local validateFontInfoModule = require(parent.Core.Style.Validator.validateFontInfo)
local validateColorInfoModule = require(parent.Core.Style.Validator.validateColorInfo)
local validateColorTokenModule = require(parent.Core.Style.Validator.validateColorToken)
local validateTypographyInfoModule = require(parent.Core.Style.Validator.validateTypographyInfo)
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local styledTextLabel = roactModule.PureComponent:extend("StyledTextLabel")
styledTextLabel.validateProps = tModule.strictInterface({
	text = tModule.string,
	fontStyle = tModule.union(validateFontInfoModule, validateTypographyInfoModule),
	colorStyle = tModule.union(validateColorInfoModule, validateColorTokenModule),
	textTruncate = tModule.optional(tModule.EnumItem),
	textWrapped = tModule.optional(tModule.boolean),
	textXAlignment = tModule.optional(tModule.EnumItem),
	textYAlignment = tModule.optional(tModule.EnumItem),
	size = tModule.optional(tModule.UDim2),
	maxSize = tModule.optional(tModule.Vector2),
	richText = tModule.optional(tModule.boolean),
	layoutOrder = tModule.optional(tModule.number),
	fluidSizing = tModule.optional(tModule.boolean),
	automaticSize = tModule.optional(tModule.EnumItem),
	lineHeight = tModule.optional(tModule.number),
	clipsDescendants = tModule.optional(tModule.boolean),
	onAbsoluteSizeChange = tModule.optional(tModule.callback),
	openTypeFeatures = tModule.optional(tModule.string)
})
styledTextLabel.defaultProps = {
	richText = true,
	fluidSizing = true,
	lineHeight = 1.4,
	clipsDescendants = false,
	openTypeFeatures = nil,
	textXAlignment = Enum.TextXAlignment.Left,
	textYAlignment = Enum.TextYAlignment.Center,
	automaticSize = Enum.AutomaticSize.None
}

function styledTextLabel.render(p1)
	-- upvalues: roactModule (ref), genericTextLabelModule (ref)
	return roactModule.createElement(genericTextLabelModule, {
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
		[roactModule.Change.AbsoluteSize] = p1.props.onAbsoluteSizeChange
	})
end

return styledTextLabel