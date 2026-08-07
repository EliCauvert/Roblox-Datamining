local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(abuseReportMenu.Components.Types)
local menuConfigs = abuseReportMenu.MenuConfigs

return {
	require(menuConfigs.Experience.AbuseReasonMenuConfig),
	require(menuConfigs.Experience.OptionalAttachScreenshotMenuConfig),
	require(menuConfigs.Experience.FreeFormCommentMenuConfig),
	require(menuConfigs.Experience.SubmitReportButtonMenuConfig)
}