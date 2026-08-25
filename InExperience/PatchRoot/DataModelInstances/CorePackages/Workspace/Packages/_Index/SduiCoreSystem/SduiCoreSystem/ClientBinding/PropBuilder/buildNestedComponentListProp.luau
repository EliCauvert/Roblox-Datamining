local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local buildLazyNestedComponentListPropModule = require(sduiCoreSystem.ClientBinding.PropBuilder.buildLazyNestedComponentListProp)
local propResultCategory = require(sduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory

return function(...)
	-- upvalues: buildLazyNestedComponentListPropModule (ref), propResultCategory (ref)
	return buildLazyNestedComponentListPropModule(...), propResultCategory.NestedComponentConfigListPropSignal
end