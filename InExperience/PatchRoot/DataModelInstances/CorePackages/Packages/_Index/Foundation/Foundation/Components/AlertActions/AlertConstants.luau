local Foundation = script:FindFirstAncestor("Foundation")
local Icon = require(Foundation.Parent.BuilderIcons).Icon
local AlertSeverityModule = require(Foundation.Enums.AlertSeverity)
local _ = require(Foundation.Enums.ButtonVariant)

return {
	MAX_ACTION_COUNT = 3,
	SEVERITY_TO_ICON = {
		[AlertSeverityModule.Info] = Icon.CircleI,
		[AlertSeverityModule.Warning] = Icon.TriangleExclamation,
		[AlertSeverityModule.Success] = Icon.CircleCheck,
		[AlertSeverityModule.Error] = Icon.CircleX
	}
}