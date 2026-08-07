local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.ServiceContractsProto)
local _ = require(parent.Signals)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiActionType)
local _ = require(sduiCoreSystem.SduiComponentType)
local _ = require(sduiCoreSystem.ClientBinding.SduiDataBindingContentType)

return {
	PropResultCategory = {
		Literal = "Literal",
		PropSignal = "PropSignal",
		NestedComponentConfig = "NestedComponentConfig",
		NestedComponentConfigListPropSignal = "NestedComponentConfigListPropSignal",
		Failed = "Failed"
	}
}