return {
	projects = {
		require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.AbuseReportMenu)["jest.config"],
		require(script.Parent.Parent.InGameAssetReporting)["jest.config"]
	}
}