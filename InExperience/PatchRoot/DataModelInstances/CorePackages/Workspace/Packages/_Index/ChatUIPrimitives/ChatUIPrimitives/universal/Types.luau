local TModule = require(script:FindFirstAncestor("ChatUIPrimitives").Parent.t)
local PlainTextTypesModule = require(script.Parent.ContentKinds.PlainText.PlainTextTypes)
local PresetTypesModule = require(script.Parent.ContentKinds.Preset.PresetTypes)
local EmojiTypesModule = require(script.Parent.ContentKinds.Emoji.EmojiTypes)
local ArrayResult = TModule.array(TModule.union(TModule.strictInterface({ plainText = PlainTextTypesModule.isValid }), TModule.strictInterface({ preset = PresetTypesModule.isValid }), TModule.strictInterface({ emoji = EmojiTypesModule.isValid }), TModule.strictInterface({
	system = require(script.Parent.ContentKinds.System.SystemTypes).isValid
})))
local InterfaceResult = TModule.interface({ userId = TModule.string, displayName = TModule.string })
local InterfaceResult1 = TModule.interface({
	contents = TModule.array(TModule.union(TModule.strictInterface({ plainText = PlainTextTypesModule.isValidDraft }), TModule.strictInterface({ preset = PresetTypesModule.isValidDraft }), TModule.strictInterface({ emoji = EmojiTypesModule.isValidDraft }))),
	repliesToIds = TModule.optional(TModule.array(TModule.string))
})
local InterfaceResult2 = TModule.interface({
	id = TModule.string,
	sentAtUnixMilliseconds = TModule.number,
	author = TModule.optional(InterfaceResult),
	contents = function(List)
		-- upvalues: ArrayResult (copy)
		local ArrayResultResult, ArrayResultResult2 = ArrayResult(List)
		
		if not ArrayResultResult then
			return false, ArrayResultResult2
		end
		if #List > 1 then
			for _, value in List do
				if value.system ~= nil then
					return false, "a system content must be the message's only content"
				end
			end
		end
		return true
	end,
	repliesTo = TModule.optional(TModule.array(TModule.interface({
		id = TModule.string,
		preview = TModule.optional(TModule.interface({
			author = TModule.optional(InterfaceResult),
			fallbackText = TModule.string
		})),
		label = TModule.optional(TModule.string)
	})))
})
local StrictInterfaceResult = TModule.strictInterface({
	kind = TModule.literal("draft"),
	draft = InterfaceResult1,
	author = TModule.optional(InterfaceResult)
})
local UnionResult = TModule.union(TModule.strictInterface({
	direction = TModule.literal("incoming"),
	stableId = TModule.string,
	payload = TModule.strictInterface({
		kind = TModule.literal("message"),
		message = InterfaceResult2
	})
}), TModule.strictInterface({
	direction = TModule.literal("outgoing"),
	stableId = TModule.string,
	payload = StrictInterfaceResult,
	delivery = TModule.strictInterface({
		state = TModule.literal("sending"),
		attemptedAtUnixMilliseconds = TModule.number,
		resolvedAtUnixMilliseconds = TModule.optional(TModule.number)
	})
}), TModule.strictInterface({
	direction = TModule.literal("outgoing"),
	stableId = TModule.string,
	payload = StrictInterfaceResult,
	delivery = TModule.strictInterface({
		state = TModule.literal("failed"),
		attemptedAtUnixMilliseconds = TModule.number,
		resolvedAtUnixMilliseconds = TModule.optional(TModule.number)
	})
}), TModule.strictInterface({
	direction = TModule.literal("outgoing"),
	stableId = TModule.string,
	payload = TModule.strictInterface({
		kind = TModule.literal("message"),
		message = InterfaceResult2
	}),
	delivery = TModule.strictInterface({
		state = TModule.literal("acknowledged"),
		attemptedAtUnixMilliseconds = TModule.number,
		resolvedAtUnixMilliseconds = TModule.number
	})
}))

return {
	isValidMessageDraft = InterfaceResult1,
	isValidMessage = InterfaceResult2,
	isValidMessageEnvelope = function(p1)
		-- upvalues: UnionResult (copy)
		local UnionResultResult, UnionResultResult2 = UnionResult(p1)
		
		if not UnionResultResult then
			return false, UnionResultResult2
		elseif p1.direction == "incoming" and p1.stableId ~= p1.payload.message.id then
			return false, "incoming envelope stableId must equal message.id"
		else
			return true
		end
	end
}