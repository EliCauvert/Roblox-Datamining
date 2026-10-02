local tModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.t)

return {
	isValidMessage = tModule.interface({
		id = tModule.string,
		sentAtUnixMilliseconds = tModule.number,
		author = tModule.optional(tModule.interface({ userId = tModule.string, displayName = tModule.string })),
		contents = tModule.array(tModule.union(require(script.Parent.ContentKinds.PlainText.PlainTextTypes).isValid)),
		repliesTo = tModule.optional(tModule.array(tModule.interface({
			id = tModule.string,
			preview = tModule.optional(tModule.interface({
				author = tModule.optional(tModule.interface({ userId = tModule.string, displayName = tModule.string })),
				fallbackText = tModule.string
			}))
		})))
	})
}