local LocalizationStringsModule = require(script:FindFirstAncestor("BuildExperience").LocalizationStrings)
local config = {
	execute_luau = "Feature.Build.Label.ToolCodeRunning",
	manage_developer_product = "Feature.Build.Label.ToolDeveloperProductRunning",
	manage_game_pass = "Feature.Build.Label.ToolGamePassRunning",
	manage_subscription = "Feature.Build.Label.ToolSubscriptionRunning",
	manage_monetization = "Feature.Build.Label.ToolMonetizationRunning"
}

return {
	getRunningKey = function(p1)
		-- upvalues: LocalizationStringsModule (copy), config (copy)
		local InProgressChatToolActivityLocalizationKey = LocalizationStringsModule.getChatToolActivityLocalizationKey(p1, "in_progress")
		
		return if InProgressChatToolActivityLocalizationKey == nil or p1 == nil then InProgressChatToolActivityLocalizationKey else config[p1] or InProgressChatToolActivityLocalizationKey
	end
}