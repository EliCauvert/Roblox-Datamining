local tModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.t)
local plainTextTypesModule = require(script.Parent.ContentKinds.PlainText.PlainTextTypes)

return {
	isValidMessageDraft = tModule.interface({
		contents = tModule.array(tModule.union(tModule.strictInterface({ plainText = plainTextTypesModule.isValidDraft }))),
		repliesToIds = tModule.optional(tModule.array(tModule.string))
	}),
	isValidMessage = tModule.interface({
		id = tModule.string,
		sentAtUnixMilliseconds = tModule.number,
		author = tModule.optional(tModule.interface({ userId = tModule.string, displayName = tModule.string })),
		contents = tModule.array(tModule.union(tModule.strictInterface({ plainText = plainTextTypesModule.isValid }))),
		repliesTo = tModule.optional(tModule.array(tModule.interface({
			id = tModule.string,
			preview = tModule.optional(tModule.interface({
				author = tModule.optional(tModule.interface({ userId = tModule.string, displayName = tModule.string })),
				fallbackText = tModule.string
			}))
		})))
	})
}