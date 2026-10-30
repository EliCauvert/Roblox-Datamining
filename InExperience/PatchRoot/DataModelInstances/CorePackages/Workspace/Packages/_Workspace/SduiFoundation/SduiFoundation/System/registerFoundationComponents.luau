local SduiFoundation = script:FindFirstAncestor("SduiFoundation")
local GetSduiComponentRegistryFunction = require(SduiFoundation.Parent.SduiCoreSystem).getSduiComponentRegistry
local GetComponentDefinitionsModule = require(SduiFoundation.Components.getComponentDefinitions)

return function()
	-- upvalues: GetSduiComponentRegistryFunction (copy), GetComponentDefinitionsModule (copy)
	GetSduiComponentRegistryFunction().registerComponentDefinitions(GetComponentDefinitionsModule())
end