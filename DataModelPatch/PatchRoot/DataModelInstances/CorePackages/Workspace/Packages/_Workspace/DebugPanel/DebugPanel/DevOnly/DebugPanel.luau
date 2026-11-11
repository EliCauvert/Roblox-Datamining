local Parent = script:FindFirstAncestor("DebugPanel").Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local Parent1 = script.Parent
local DebugPanelWindowModule = require(Parent1.DebugPanelWindow)
local DebugPanelTreeModule = require(Parent1.DebugPanelTree)
local DebugPanelSectionRegistryModule = require(Parent1.DebugPanelSectionRegistry)

return function()
	-- upvalues: UseSignalStateFunction (copy), DebugPanelSectionRegistryModule (copy), ReactModule (copy), DebugPanelWindowModule (copy), DebugPanelTreeModule (copy)
	local UseSignalStateResult = UseSignalStateFunction(DebugPanelSectionRegistryModule.getRootSignal)
	
	return if next(UseSignalStateResult.children) ~= nil then ReactModule.createElement(DebugPanelWindowModule, {
		title = "Dev Debug Panel",
		screenGuiName = "DevDebugPanel"
	}, {
		Tree = ReactModule.createElement(DebugPanelTreeModule, { depth = 0, node = UseSignalStateResult })
	}) else nil
end