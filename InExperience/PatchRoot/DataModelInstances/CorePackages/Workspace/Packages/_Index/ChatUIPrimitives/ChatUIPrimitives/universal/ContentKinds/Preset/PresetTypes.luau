local TModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.t)

return {
	isValid = TModule.interface({
		fallbackText = TModule.string,
		presetId = TModule.string,
		presetVersion = TModule.optional(TModule.string),
		displayText = TModule.string
	}),
	isValidDraft = TModule.strictInterface({ presetId = TModule.string, displayText = TModule.string })
}