local tModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.t)
local var1 = tModule.interface({
	text = tModule.string,
	locale = tModule.optional(tModule.string)
})

return {
	isValid = tModule.interface({
		fallbackText = tModule.string,
		displayText = var1,
		translatedText = tModule.optional(var1),
		originalText = tModule.optional(var1),
		wasRewritten = tModule.boolean
	})
}