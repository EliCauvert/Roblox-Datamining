local TModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.t)
local UnionResult = TModule.union(TModule.literal("Touch"), TModule.literal("Pointer"), TModule.literal("Directional"))

return {
	SduiConditionKey = {
		friendInGame = "friendInGame",
		imageQualityLevel = "imageQualityLevel",
		isPortrait = "isPortrait",
		lastInput = "lastInput",
		maxScreenWidth = "maxScreenWidth",
		minScreenWidth = "minScreenWidth",
		performanceLevel = "performanceLevel",
		preferredInput = "preferredInput",
		isSpatial = "isSpatial"
	},
	SduiResponsiveKey = {
		imageQualityLevel = "imageQualityLevel",
		isPortrait = "isPortrait",
		lastInput = "lastInput",
		maxScreenWidth = "maxScreenWidth",
		minScreenWidth = "minScreenWidth",
		performanceLevel = "performanceLevel",
		preferredInput = "preferredInput",
		isSpatial = "isSpatial"
	},
	ConditionalPropsInterface = {
		propOverrides = TModule.table,
		conditions = TModule.optional((TModule.interface({
			imageQualityLevel = TModule.optional(TModule.string),
			isPortrait = TModule.optional(TModule.boolean),
			isSpatial = TModule.optional(TModule.boolean),
			lastInput = TModule.optional(UnionResult),
			maxScreenWidth = TModule.optional(TModule.number),
			minScreenWidth = TModule.optional(TModule.number),
			performanceLevel = TModule.optional(TModule.string),
			preferredInput = TModule.optional(UnionResult)
		})))
	}
}