-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:59 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local alertSeverityModule = require(foundation.Enums.AlertSeverity)
local _ = require(foundation.Enums.ButtonVariant)

return {
	MAX_ACTION_COUNT = 3,
	SEVERITY_TO_ICON = {
		[alertSeverityModule.Info] = "circle-i",
		[alertSeverityModule.Warning] = "triangle-exclamation",
		[alertSeverityModule.Success] = "circle-check",
		[alertSeverityModule.Error] = "circle-x"
	}
}