local foundation = script:FindFirstAncestor("Foundation")
local icon = require(foundation.Parent.BuilderIcons).Icon
local alertSeverityModule = require(foundation.Enums.AlertSeverity)
local _ = require(foundation.Enums.ButtonVariant)

return {
	MAX_ACTION_COUNT = 3,
	SEVERITY_TO_ICON = {
		[alertSeverityModule.Info] = icon.CircleI,
		[alertSeverityModule.Warning] = icon.TriangleExclamation,
		[alertSeverityModule.Success] = icon.CircleCheck,
		[alertSeverityModule.Error] = icon.CircleX
	}
}