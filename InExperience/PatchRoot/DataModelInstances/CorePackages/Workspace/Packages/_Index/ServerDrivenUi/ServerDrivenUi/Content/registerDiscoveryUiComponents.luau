local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local GetSduiComponentRegistryFunction = require(ServerDrivenUi.Parent.SduiCoreSystem).getSduiComponentRegistry
local SduiComponentDefinitionsModule = require(ServerDrivenUi.System.SduiComponentDefinitions)

return function()
	-- upvalues: SduiComponentDefinitionsModule (copy), GetSduiComponentRegistryFunction (copy)
	GetSduiComponentRegistryFunction().registerComponentDefinitions(SduiComponentDefinitionsModule.new()._registeredComponents)
end