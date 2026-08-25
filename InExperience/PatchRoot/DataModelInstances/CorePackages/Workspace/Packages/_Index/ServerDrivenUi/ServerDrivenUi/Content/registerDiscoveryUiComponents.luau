local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local getSduiComponentRegistry = require(serverDrivenUi.Parent.SduiCoreSystem).getSduiComponentRegistry
local sduiComponentDefinitionsModule = require(serverDrivenUi.System.SduiComponentDefinitions)

return function()
	-- upvalues: sduiComponentDefinitionsModule (ref), getSduiComponentRegistry (ref)
	getSduiComponentRegistry().registerComponentDefinitions(sduiComponentDefinitionsModule.new()._registeredComponents)
end