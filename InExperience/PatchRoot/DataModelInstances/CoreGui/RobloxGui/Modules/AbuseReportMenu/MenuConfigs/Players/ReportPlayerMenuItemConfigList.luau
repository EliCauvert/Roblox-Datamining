local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(abuseReportMenu.Components.Types)
local menuConfigs = abuseReportMenu.MenuConfigs

return {
	require(menuConfigs.Players.MethodOfAbuseModalMenuConfig),
	require(menuConfigs.Players.PlayerModalSelectorMenuConfig),
	require(menuConfigs.Players.AbuseReasonModalSelectorMenuConfig),
	require(menuConfigs.Players.OptionalAttachScreenshotMenuConfig),
	require(menuConfigs.Players.FreeFormCommentMenuConfig),
	require(menuConfigs.Players.SubmitReportButtonMenuConfig)
}