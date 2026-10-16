local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(Foundation.Components.Types)
local ColorNamespaceModule = require(Foundation.Enums.ColorNamespace)
local StateLayerModeModule = require(Foundation.Enums.StateLayerMode)
local ControlStateModule = require(Foundation.Enums.ControlState)

function guiStateToStateLayer(Hover): string --[[ Line: 15 ]]
	-- upvalues: ControlStateModule (copy)
	return if Hover == ControlStateModule.Pressed then "Press" elseif Hover == ControlStateModule.SelectedPressed then "Press" elseif Hover == ControlStateModule.Hover then "Hover" else "Idle"
end

function stateLayerModeToTokenNamespace(Dark) --[[ Line: 27 ]]
	-- upvalues: StateLayerModeModule (copy), ColorNamespaceModule (copy)
	return if Dark == StateLayerModeModule.Default then ColorNamespaceModule.Color elseif Dark == StateLayerModeModule.Inverse then ColorNamespaceModule.Inverse elseif Dark == StateLayerModeModule.Light then ColorNamespaceModule.LightMode elseif Dark == StateLayerModeModule.Dark then ColorNamespaceModule.DarkMode else ColorNamespaceModule.Color
end

return function(p1, p2, p3) --[[ Line: 41 | Named "getStateLayerStyle" ]]
	return p1[stateLayerModeToTokenNamespace(p2)].State[guiStateToStateLayer(p3)]
end