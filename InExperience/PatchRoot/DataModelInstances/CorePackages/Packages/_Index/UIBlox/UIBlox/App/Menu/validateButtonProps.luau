local Parent = script.Parent.Parent.Parent
local TModule = require(Parent.Parent.t)

return TModule.array(TModule.strictInterface({
	icon = TModule.optional(TModule.union(TModule.table, TModule.string)),
	text = TModule.string,
	onActivated = TModule.callback,
	disabled = TModule.optional(TModule.boolean),
	inputBindingKey = TModule.optional(TModule.string),
	keyCodeLabel = TModule.optional(TModule.union(TModule.enum(Enum.KeyCode), TModule.strictInterface({
		key = TModule.enum(Enum.KeyCode),
		axis = TModule.optional(TModule.string)
	}))),
	selected = TModule.optional(TModule.boolean),
	stayOnActivated = TModule.optional(TModule.boolean),
	renderRightSideGadget = TModule.optional(TModule.callback),
	rightSideGadgetSize = TModule.optional(TModule.Vector2),
	iconColorOverride = TModule.optional(TModule.Color3),
	textColorOverride = TModule.optional(TModule.Color3),
	dividerOffset = TModule.optional(TModule.number),
	dividerSize = TModule.optional(TModule.number),
	leftPaddingOffset = TModule.optional(TModule.number),
	fontStyle = TModule.optional(TModule.union(TModule.string, require(Parent.Core.Style.Validator.validateFontInfo), (require(Parent.Core.Style.Validator.validateTypographyInfo)))),
	iconSize = TModule.optional(TModule.integer),
	selectedIconSize = TModule.optional(TModule.integer),
	iconPaddingLeft = TModule.optional(TModule.integer),
	textPadding = TModule.optional(TModule.strictInterface({ left = TModule.integer, right = TModule.integer })),
	selectedIconPaddingRight = TModule.optional(TModule.integer),
	keyLabelPaddingRight = TModule.optional(TModule.integer),
	textOnlyPadding = TModule.optional(TModule.integer),
	buttonTextOverride = TModule.optional(TModule.table),
	borderCornerRadius = TModule.optional(TModule.integer),
	background = TModule.optional((require(Parent.Core.Style.Validator.validateColorInfo)))
}))