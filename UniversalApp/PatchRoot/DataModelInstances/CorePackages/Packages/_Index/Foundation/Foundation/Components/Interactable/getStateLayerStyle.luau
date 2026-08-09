local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)
local colorModeModule = require(foundation.Enums.ColorMode)
local stateLayerModeModule = require(foundation.Enums.StateLayerMode)
local controlStateModule = require(foundation.Enums.ControlState)

function guiStateToStateLayer(p0) --[[ line: 15 ]]
	-- upvalues: controlStateModule (ref)
	return if p0 == controlStateModule.Pressed then "Press" elseif p0 == controlStateModule.SelectedPressed then "Press" elseif p0 == controlStateModule.Hover then "Hover" else "Idle"
end

function stateLayerModeToTokenNamespace(p1) --[[ line: 27 ]]
	-- upvalues: stateLayerModeModule (ref), colorModeModule (ref)
	return if p1 == stateLayerModeModule.Default then colorModeModule.Color elseif p1 == stateLayerModeModule.Inverse then colorModeModule.Inverse elseif p1 == stateLayerModeModule.Light then colorModeModule.LightMode elseif p1 == stateLayerModeModule.Dark then colorModeModule.DarkMode else colorModeModule.Color
end

return function(p2, p3, p4) --[[ line: 41 | named "getStateLayerStyle" ]]
	return p2[stateLayerModeToTokenNamespace(p3)].State[guiStateToStateLayer(p4)]
end