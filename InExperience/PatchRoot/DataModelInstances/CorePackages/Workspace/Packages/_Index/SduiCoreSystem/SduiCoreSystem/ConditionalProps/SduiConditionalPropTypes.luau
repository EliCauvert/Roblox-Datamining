local tModule = require(script:FindFirstAncestor("SduiCoreSystem").Parent.t)
local var1 = tModule.union(tModule.literal("Touch"), tModule.literal("Pointer"), tModule.literal("Directional"))

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
		propOverrides = tModule.table,
		conditions = tModule.optional(tModule.interface({
			imageQualityLevel = tModule.optional(tModule.string),
			isPortrait = tModule.optional(tModule.boolean),
			isSpatial = tModule.optional(tModule.boolean),
			lastInput = tModule.optional(var1),
			maxScreenWidth = tModule.optional(tModule.number),
			minScreenWidth = tModule.optional(tModule.number),
			performanceLevel = tModule.optional(tModule.string),
			preferredInput = tModule.optional(var1)
		}))
	}
}