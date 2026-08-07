-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:04 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Providers.Style.Tokens)
local _ = require(foundation.Components.Types)
local colorNamespaceModule = require(foundation.Enums.ColorNamespace)
local stateLayerModeModule = require(foundation.Enums.StateLayerMode)
local controlStateModule = require(foundation.Enums.ControlState)

function guiStateToStateLayer(p0) --[[ line: 15 ]]
	-- upvalues: controlStateModule (ref)
	return if p0 == controlStateModule.Pressed then "Press" elseif p0 == controlStateModule.SelectedPressed then "Press" elseif p0 == controlStateModule.Hover then "Hover" else "Idle"
end

function stateLayerModeToTokenNamespace(p1) --[[ line: 27 ]]
	-- upvalues: stateLayerModeModule (ref), colorNamespaceModule (ref)
	return if p1 == stateLayerModeModule.Default then colorNamespaceModule.Color elseif p1 == stateLayerModeModule.Inverse then colorNamespaceModule.Inverse elseif p1 == stateLayerModeModule.Light then colorNamespaceModule.LightMode elseif p1 == stateLayerModeModule.Dark then colorNamespaceModule.DarkMode else colorNamespaceModule.Color
end

return function(p2, p3, p4) --[[ line: 41 | named "getStateLayerStyle" ]]
	return p2[stateLayerModeToTokenNamespace(p3)].State[guiStateToStateLayer(p4)]
end