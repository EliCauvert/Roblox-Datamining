local TModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.t)

return {
	isValid = TModule.interface({
		emojiId = TModule.string,
		unicode = TModule.optional(TModule.string),
		name = TModule.optional(TModule.string),
		fallbackText = TModule.optional(TModule.string)
	}),
	isValidDraft = TModule.strictInterface({ emojiId = TModule.string, unicode = TModule.string })
}