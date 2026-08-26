local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local stateLayerModeModule = require(foundation.Enums.StateLayerMode)
local controlStateModule = require(foundation.Enums.ControlState)

function guiStateToStateLayer(p1)
	-- upvalues: controlStateModule (ref)
	return if p1 == controlStateModule.Pressed then "Press" elseif p1 == controlStateModule.SelectedPressed then "Press" elseif p1 == controlStateModule.Hover then "Hover" else "Idle"
end

function stateLayerModeToTokenNamespace(p1)
	-- upvalues: stateLayerModeModule (ref), colorNamespaceModule (ref)
	return if p1 == stateLayerModeModule.Default then colorNamespaceModule.Color elseif p1 == stateLayerModeModule.Inverse then colorNamespaceModule.Inverse elseif p1 == stateLayerModeModule.Light then colorNamespaceModule.LightMode elseif p1 == stateLayerModeModule.Dark then colorNamespaceModule.DarkMode else colorNamespaceModule.Color
end

return function(p1, p2, p3)
	return p1[stateLayerModeToTokenNamespace(p2)].State[guiStateToStateLayer(p3)]
end