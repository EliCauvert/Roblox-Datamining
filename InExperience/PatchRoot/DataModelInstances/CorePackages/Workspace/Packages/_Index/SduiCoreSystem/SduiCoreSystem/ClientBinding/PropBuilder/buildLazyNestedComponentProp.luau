local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.Signals)
local _ = require(parent.ServiceContractsProto)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local buildNestedComponentPropModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildNestedComponentProp)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: buildNestedComponentPropModule (ref)
	return buildNestedComponentPropModule(p1, p2, p3, p4, p5, p6, true)
end