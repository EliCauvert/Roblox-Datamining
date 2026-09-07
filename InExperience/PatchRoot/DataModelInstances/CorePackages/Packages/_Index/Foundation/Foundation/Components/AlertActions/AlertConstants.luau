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