local SettingsPageFactoryModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.SettingsPageFactory)

return function()
	-- upvalues: SettingsPageFactoryModule (copy)
	local NewPage = SettingsPageFactoryModule:CreateNewPage()
	NewPage.Page.Name = "TraversalHistoryWrapper"
	NewPage.Page:ClearAllChildren()
	NewPage.TabHeader = nil
	NewPage.ShouldShowBottomBar = false
	NewPage.ShouldShowHubBar = false
	
	return NewPage
end