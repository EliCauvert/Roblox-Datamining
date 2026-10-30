local TModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.t)

return {
	isValid = TModule.strictInterface({
		text = TModule.string,
		iconName = TModule.optional(TModule.string)
	})
}