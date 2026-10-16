local TModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.t)
local InterfaceResult = TModule.interface({
	text = TModule.string,
	locale = TModule.optional(TModule.string)
})

return {
	isValid = TModule.interface({
		fallbackText = TModule.string,
		displayText = InterfaceResult,
		translatedText = TModule.optional(InterfaceResult),
		originalText = TModule.optional(InterfaceResult),
		wasRewritten = TModule.boolean
	}),
	isValidDraft = TModule.strictInterface({ text = TModule.string })
}