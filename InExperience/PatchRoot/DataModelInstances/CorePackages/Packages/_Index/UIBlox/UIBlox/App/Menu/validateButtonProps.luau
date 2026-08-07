local parent = script.Parent.Parent.Parent
local tModule = require(parent.Parent.t)

return tModule.array(tModule.strictInterface({
	icon = tModule.optional(tModule.union(tModule.table, tModule.string)),
	text = tModule.string,
	onActivated = tModule.callback,
	disabled = tModule.optional(tModule.boolean),
	inputBindingKey = tModule.optional(tModule.string),
	keyCodeLabel = tModule.optional(tModule.union(tModule.enum(Enum.KeyCode), tModule.strictInterface({
		key = tModule.enum(Enum.KeyCode),
		axis = tModule.optional(tModule.string)
	}))),
	selected = tModule.optional(tModule.boolean),
	stayOnActivated = tModule.optional(tModule.boolean),
	renderRightSideGadget = tModule.optional(tModule.callback),
	rightSideGadgetSize = tModule.optional(tModule.Vector2),
	iconColorOverride = tModule.optional(tModule.Color3),
	textColorOverride = tModule.optional(tModule.Color3),
	dividerOffset = tModule.optional(tModule.number),
	dividerSize = tModule.optional(tModule.number),
	leftPaddingOffset = tModule.optional(tModule.number),
	fontStyle = tModule.optional(tModule.union(tModule.string, require(parent.Core.Style.Validator.validateFontInfo), require(parent.Core.Style.Validator.validateTypographyInfo))),
	iconSize = tModule.optional(tModule.integer),
	selectedIconSize = tModule.optional(tModule.integer),
	iconPaddingLeft = tModule.optional(tModule.integer),
	textPadding = tModule.optional(tModule.strictInterface({ left = tModule.integer, right = tModule.integer })),
	selectedIconPaddingRight = tModule.optional(tModule.integer),
	keyLabelPaddingRight = tModule.optional(tModule.integer),
	textOnlyPadding = tModule.optional(tModule.integer),
	buttonTextOverride = tModule.optional(tModule.table),
	borderCornerRadius = tModule.optional(tModule.integer),
	background = tModule.optional(require(parent.Core.Style.Validator.validateColorInfo))
}))