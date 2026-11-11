local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(AbuseReportMenu.Components.Types)
local MenuConfigs = AbuseReportMenu.MenuConfigs

return {
	require(MenuConfigs.Experience.AbuseReasonMenuConfig),
	require(MenuConfigs.Experience.OptionalAttachScreenshotMenuConfig),
	require(MenuConfigs.Experience.FreeFormCommentMenuConfig),
	(require(MenuConfigs.Experience.SubmitReportButtonMenuConfig))
}