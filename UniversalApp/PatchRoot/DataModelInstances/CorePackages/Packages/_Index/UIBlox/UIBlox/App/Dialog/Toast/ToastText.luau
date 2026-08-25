local parent = script.Parent.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local validateFontInfoModule = require(parent.Core.Style.Validator.validateFontInfo)
local validateColorInfoModule = require(parent.Core.Style.Validator.validateColorInfo)
local genericTextLabelModule = require(parent.Core.Text.GenericTextLabel.GenericTextLabel)
local toastText = roactModule.PureComponent:extend("ToastText")
toastText.validateProps = tModule.interface({
	colorStyle = validateColorInfoModule,
	fontStyle = validateFontInfoModule,
	Size = tModule.UDim2,
	Text = tModule.string,
	AnchorPoint = tModule.optional(tModule.Vector2),
	fluidSizing = tModule.optional(tModule.boolean),
	LayoutOrder = tModule.optional(tModule.integer),
	maxSize = tModule.optional(tModule.Vector2),
	Position = tModule.optional(tModule.UDim2),
	TextTruncate = tModule.optional(tModule.EnumItem),
	TextXAlignment = tModule.optional(tModule.EnumItem),
	TextYAlignment = tModule.optional(tModule.EnumItem)
})
toastText.defaultProps = {
	TextXAlignment = Enum.TextXAlignment.Left,
	TextYAlignment = Enum.TextYAlignment.Center
}

function toastText.render(p0)
	-- upvalues: roactModule (ref), genericTextLabelModule (ref)
	return roactModule.createElement(genericTextLabelModule, p0.props)
end

return toastText