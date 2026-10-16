local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local _ = require(AbuseReportMenu.Components.Types)
local MenuConfigs = AbuseReportMenu.MenuConfigs

return {
	require(MenuConfigs.Players.MethodOfAbuseModalMenuConfig),
	require(MenuConfigs.Players.PlayerModalSelectorMenuConfig),
	require(MenuConfigs.Players.AbuseReasonModalSelectorMenuConfig),
	require(MenuConfigs.Players.OptionalAttachScreenshotMenuConfig),
	require(MenuConfigs.Players.FreeFormCommentMenuConfig),
	(require(MenuConfigs.Players.SubmitReportButtonMenuConfig))
}