local settingsPageFactoryModule = require(game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules.Settings.SettingsPageFactory)

return function() --[[ line: 10 | named "createTraversalHistoryWrapper" ]]
	-- upvalues: settingsPageFactoryModule (ref)
	local traversalHistoryWrapper = settingsPageFactoryModule:CreateNewPage()
	traversalHistoryWrapper.Page.Name = "TraversalHistoryWrapper"
	traversalHistoryWrapper.Page:ClearAllChildren()
	traversalHistoryWrapper.TabHeader = nil
	traversalHistoryWrapper.ShouldShowBottomBar = false
	traversalHistoryWrapper.ShouldShowHubBar = false
	
	return traversalHistoryWrapper
end