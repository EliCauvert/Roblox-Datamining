local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local tModule = require(parent.t)
local cryoModule = require(parent.Cryo)
local _ = require(sduiCoreSystem.SduiComponentType)
local t = {
	componentType = tModule.string,
	props = tModule.optional(tModule.table),
	templateKey = tModule.optional(tModule.string),
	analyticsData = tModule.optional(tModule.table),
	children = tModule.optional(tModule.table),
	conditionalProps = tModule.optional(tModule.array(tModule.interface(require(sduiCoreSystem.ConditionalProps.SduiConditionalPropTypes).ConditionalPropsInterface))),
	feedItemKey = tModule.optional(tModule.string),
	__processed = tModule.optional(tModule.boolean),
	__isClientBinding = tModule.optional(tModule.boolean),
	__usageRecorded = tModule.optional(tModule.boolean)
}

return {
	ActionInterface = {
		actionType = tModule.string,
		actionParams = tModule.optional(tModule.table),
		telemetryHandler = tModule.optional(tModule.string),
		skipUnifiedLogging = if require(parent.SharedFlags).FFlagSduiActionSkipUnifiedLogging then tModule.optional(tModule.boolean) else nil
	},
	UiComponentInterface = t,
	SduiTemplateInterface = cryoModule.Dictionary.join(t, { componentType = tModule.optional(tModule.string) })
}