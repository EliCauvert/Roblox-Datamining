local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local _ = require(Parent.ServiceContractsProto)
local _ = require(Parent.Signals)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.SduiActionType)
local _ = require(SduiCoreSystem.SduiComponentType)
local _ = require(SduiCoreSystem.ClientBinding.SduiDataBindingContentType)

return {
	PropResultCategory = {
		Literal = "Literal",
		PropSignal = "PropSignal",
		NestedComponentConfig = "NestedComponentConfig",
		NestedComponentConfigListPropSignal = "NestedComponentConfigListPropSignal",
		Failed = "Failed"
	}
}