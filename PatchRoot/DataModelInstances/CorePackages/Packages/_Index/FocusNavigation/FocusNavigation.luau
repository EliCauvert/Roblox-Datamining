-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:58 2026 Pacific Standard Time.

local _ = require(script.Parent.EventPropagation)
local focusNavigationServiceModule = require(script.FocusNavigationService)
local isValidFocusTargetModule = require(script.isValidFocusTarget)
local engineInterfaceModule = require(script.EngineInterface)
local _ = require(script.types)

return {
	isValidFocusTarget = isValidFocusTargetModule,
	FocusNavigationService = focusNavigationServiceModule,
	EngineInterface = {
		CoreGui = engineInterfaceModule.CoreGui,
		PlayerGui = engineInterfaceModule.PlayerGui
	}
}