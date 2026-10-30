local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local BuildLazyNestedComponentListPropModule = require(SduiCoreSystem.ClientBinding.PropBuilder.buildLazyNestedComponentListProp)
local PropResultCategory = require(SduiCoreSystem.ClientBinding.SduiClientBindingTypes).PropResultCategory

return function(...)
	-- upvalues: BuildLazyNestedComponentListPropModule (copy), PropResultCategory (copy)
	return BuildLazyNestedComponentListPropModule(...), PropResultCategory.NestedComponentConfigListPropSignal
end