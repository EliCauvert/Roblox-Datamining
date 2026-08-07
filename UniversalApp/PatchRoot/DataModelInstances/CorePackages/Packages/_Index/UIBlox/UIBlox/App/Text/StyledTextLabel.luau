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

function styledTextLabel.render(p0) --[[ line: 64 ]]
	-- upvalues: roactModule (ref), genericTextLabelModule (ref)
	return roactModule.createElement(genericTextLabelModule, {
		maxSize = p0.props.maxSize,
		fontStyle = p0.props.fontStyle,
		colorStyle = p0.props.colorStyle,
		fluidSizing = p0.props.fluidSizing,
		Size = p0.props.size,
		Text = p0.props.text,
		TextXAlignment = p0.props.textXAlignment,
		TextYAlignment = p0.props.textYAlignment,
		TextTruncate = p0.props.textTruncate,
		TextWrapped = p0.props.textWrapped,
		LayoutOrder = p0.props.layoutOrder,
		RichText = p0.props.richText,
		AutomaticSize = p0.props.automaticSize,
		LineHeight = p0.props.lineHeight,
		ClipsDescendants = p0.props.clipsDescendants,
		openTypeFeatures = p0.props.openTypeFeatures,
		[roactModule.Change.AbsoluteSize] = p0.props.onAbsoluteSizeChange
	})
end

return styledTextLabel