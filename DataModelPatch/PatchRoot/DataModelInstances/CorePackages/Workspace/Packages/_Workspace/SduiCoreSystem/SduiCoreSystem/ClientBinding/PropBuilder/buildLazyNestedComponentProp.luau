local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local _ = require(Parent.Signals)
local _ = require(Parent.ServiceContractsProto)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes)
local BuildNestedComponentPropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildNestedComponentProp)

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: BuildNestedComponentPropModule (copy)
	return BuildNestedComponentPropModule(p1, p2, p3, p4, p5, p6, true)
end