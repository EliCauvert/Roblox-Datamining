local Parent = script.Parent.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local GenericTextLabelModule = require(Parent.Core.Text.GenericTextLabel.GenericTextLabel)
local ToastText = RoactModule.PureComponent:extend("ToastText")
ToastText.validateProps = TModule.interface({
	colorStyle = require(Parent.Core.Style.Validator.validateColorInfo),
	fontStyle = require(Parent.Core.Style.Validator.validateFontInfo),
	Size = TModule.UDim2,
	Text = TModule.string,
	AnchorPoint = TModule.optional(TModule.Vector2),
	fluidSizing = TModule.optional(TModule.boolean),
	LayoutOrder = TModule.optional(TModule.integer),
	maxSize = TModule.optional(TModule.Vector2),
	Position = TModule.optional(TModule.UDim2),
	TextTruncate = TModule.optional(TModule.EnumItem),
	TextXAlignment = TModule.optional(TModule.EnumItem),
	TextYAlignment = TModule.optional(TModule.EnumItem)
})
ToastText.defaultProps = {
	TextXAlignment = Enum.TextXAlignment.Left,
	TextYAlignment = Enum.TextYAlignment.Center
}

function ToastText.render(p1) --[[ Line: 39 ]]
	-- upvalues: RoactModule (copy), GenericTextLabelModule (copy)
	return RoactModule.createElement(GenericTextLabelModule, p1.props)
end

return ToastText