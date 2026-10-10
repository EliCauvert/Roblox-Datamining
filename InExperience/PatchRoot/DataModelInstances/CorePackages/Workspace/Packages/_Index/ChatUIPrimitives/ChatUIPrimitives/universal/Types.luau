local tModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.t)
local plainTextTypesModule = require(script.Parent.ContentKinds.PlainText.PlainTextTypes)
local var1 = tModule.array(tModule.union(tModule.strictInterface({ plainText = plainTextTypesModule.isValid })))
local var2 = tModule.interface({ userId = tModule.string, displayName = tModule.string })
local var3 = tModule.interface({
	contents = tModule.array(tModule.union(tModule.strictInterface({ plainText = plainTextTypesModule.isValidDraft }))),
	repliesToIds = tModule.optional(tModule.array(tModule.string))
})
local var4 = tModule.interface({
	id = tModule.string,
	sentAtUnixMilliseconds = tModule.number,
	author = tModule.optional(var2),
	contents = var1,
	repliesTo = tModule.optional(tModule.array(tModule.interface({
		id = tModule.string,
		preview = tModule.optional(tModule.interface({
			author = tModule.optional(var2),
			fallbackText = tModule.string
		}))
	})))
})
local var5 = tModule.strictInterface({
	kind = tModule.literal("draft"),
	draft = var3,
	author = tModule.optional(var2)
})
local var6 = tModule.union(tModule.strictInterface({
	direction = tModule.literal("incoming"),
	stableId = tModule.string,
	payload = tModule.strictInterface({ kind = tModule.literal("message"), message = var4 })
}), tModule.strictInterface({
	direction = tModule.literal("outgoing"),
	stableId = tModule.string,
	payload = var5,
	delivery = tModule.strictInterface({
		state = tModule.literal("sending"),
		attemptedAtUnixMilliseconds = tModule.number,
		resolvedAtUnixMilliseconds = tModule.optional(tModule.number)
	})
}), tModule.strictInterface({
	direction = tModule.literal("outgoing"),
	stableId = tModule.string,
	payload = var5,
	delivery = tModule.strictInterface({
		state = tModule.literal("failed"),
		attemptedAtUnixMilliseconds = tModule.number,
		resolvedAtUnixMilliseconds = tModule.optional(tModule.number)
	})
}), tModule.strictInterface({
	direction = tModule.literal("outgoing"),
	stableId = tModule.string,
	payload = tModule.strictInterface({ kind = tModule.literal("message"), message = var4 }),
	delivery = tModule.strictInterface({
		state = tModule.literal("acknowledged"),
		attemptedAtUnixMilliseconds = tModule.number,
		resolvedAtUnixMilliseconds = tModule.number
	})
}))

return {
	isValidMessageDraft = var3,
	isValidMessage = var4,
	isValidMessageEnvelope = function(p1)
		-- upvalues: var6 (ref)
		local var7, var8 = var6(p1)
		
		if not var7 then
			return false, var8
		elseif p1.direction == "incoming" and p1.stableId ~= p1.payload.message.id then
			return false, "incoming envelope stableId must equal message.id"
		end
		return true
	end
}