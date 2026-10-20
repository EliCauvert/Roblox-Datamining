local Foundation = script:FindFirstAncestor("Foundation")
local AlertSeverityModule = require(Foundation.Enums.AlertSeverity)
local _ = require(Foundation.Enums.ButtonVariant)

return {
	MAX_ACTION_COUNT = 3,
	SEVERITY_TO_ICON = {
		[AlertSeverityModule.Info] = "circle-i",
		[AlertSeverityModule.Warning] = "triangle-exclamation",
		[AlertSeverityModule.Success] = "circle-check",
		[AlertSeverityModule.Error] = "circle-x"
	}
}