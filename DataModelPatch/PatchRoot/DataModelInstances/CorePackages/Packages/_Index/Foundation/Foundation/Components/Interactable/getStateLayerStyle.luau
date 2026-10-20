local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Providers.Style.Tokens)
local _ = require(Foundation.Components.Types)
local ColorModeModule = require(Foundation.Enums.ColorMode)
local StateLayerModeModule = require(Foundation.Enums.StateLayerMode)
local ControlStateModule = require(Foundation.Enums.ControlState)

function guiStateToStateLayer(Hover): string
	-- upvalues: ControlStateModule (copy)
	return if Hover == ControlStateModule.Pressed then "Press" elseif Hover == ControlStateModule.SelectedPressed then "Press" elseif Hover == ControlStateModule.Hover then "Hover" else "Idle"
end

function stateLayerModeToTokenNamespace(Dark)
	-- upvalues: StateLayerModeModule (copy), ColorModeModule (copy)
	return if Dark == StateLayerModeModule.Default then ColorModeModule.Color elseif Dark == StateLayerModeModule.Inverse then ColorModeModule.Inverse elseif Dark == StateLayerModeModule.Light then ColorModeModule.LightMode elseif Dark == StateLayerModeModule.Dark then ColorModeModule.DarkMode else ColorModeModule.Color
end

return function(p1, p2, p3)
	return p1[stateLayerModeToTokenNamespace(p2)].State[guiStateToStateLayer(p3)]
end