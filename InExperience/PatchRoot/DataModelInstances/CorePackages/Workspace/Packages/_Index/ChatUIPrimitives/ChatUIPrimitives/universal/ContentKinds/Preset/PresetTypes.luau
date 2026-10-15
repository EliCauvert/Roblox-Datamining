local tModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.t)

return {
	isValid = tModule.interface({
		fallbackText = tModule.string,
		presetId = tModule.string,
		presetVersion = tModule.optional(tModule.string),
		displayText = tModule.string
	}),
	isValidDraft = tModule.strictInterface({ presetId = tModule.string, displayText = tModule.string })
}