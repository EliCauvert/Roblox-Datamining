local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local getSduiComponentRegistry = require(serverDrivenUi.Parent.SduiCoreSystem).getSduiComponentRegistry
local sduiComponentDefinitionsModule = require(serverDrivenUi.System.SduiComponentDefinitions)

return function() --[[ line: 15 | named "registerDiscoveryUiComponents" ]]
	-- upvalues: sduiComponentDefinitionsModule (ref), getSduiComponentRegistry (ref)
	getSduiComponentRegistry().registerComponentDefinitions(sduiComponentDefinitionsModule.new()._registeredComponents)
end