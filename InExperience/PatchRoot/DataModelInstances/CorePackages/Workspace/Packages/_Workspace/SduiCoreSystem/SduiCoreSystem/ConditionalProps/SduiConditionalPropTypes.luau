local Parent = script:FindFirstAncestor("SduiCoreSystem").Parent
local TModule = require(Parent.t)
local FFlagSduiConditionalPropsAppPolicyCondition = require(Parent.SharedFlags).FFlagSduiConditionalPropsAppPolicyCondition
local UnionResult = TModule.union(TModule.literal("Touch"), TModule.literal("Pointer"), TModule.literal("Directional"))

return {
	SduiConditionKey = {
		appPolicy = "appPolicy",
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
			appPolicy = if FFlagSduiConditionalPropsAppPolicyCondition then TModule.optional(TModule.array(TModule.string)) else nil,
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