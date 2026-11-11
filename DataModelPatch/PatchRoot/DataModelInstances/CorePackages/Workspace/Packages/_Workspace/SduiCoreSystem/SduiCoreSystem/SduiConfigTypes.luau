local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local TModule = require(Parent.t)
local _ = require(SduiCoreSystem.SduiComponentType)
local UiComponentInterface = {
	componentType = TModule.string,
	props = TModule.optional(TModule.table),
	templateKey = TModule.optional(TModule.string),
	analyticsData = TModule.optional(TModule.table),
	children = TModule.optional(TModule.table),
	conditionalProps = TModule.optional(TModule.array(TModule.interface(require(SduiCoreSystem.ConditionalProps.SduiConditionalPropTypes).ConditionalPropsInterface))),
	feedItemKey = TModule.optional(TModule.string),
	__processed = TModule.optional(TModule.boolean),
	__isClientBinding = TModule.optional(TModule.boolean),
	__usageRecorded = TModule.optional(TModule.boolean)
}

return {
	ActionInterface = {
		actionType = TModule.string,
		actionParams = TModule.optional(TModule.table),
		telemetryHandler = if require(Parent.SharedFlags).FFlagSduiActionTelemetryHandler then TModule.optional(TModule.string) else nil
	},
	UiComponentInterface = UiComponentInterface,
	SduiTemplateInterface = require(Parent.Cryo).Dictionary.join(UiComponentInterface, { componentType = TModule.optional(TModule.string) })
}