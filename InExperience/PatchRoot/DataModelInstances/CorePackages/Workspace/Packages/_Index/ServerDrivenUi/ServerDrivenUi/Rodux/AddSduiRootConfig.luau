local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local _ = require(Parent.SduiCoreSystem)

return require(Parent.Rodux).makeActionCreator(script.Name, function(Page, RootConfig, DataUpdatedTimestamp, ExpectedSduiFeedItems, CustomFeedStoreKey) --[[ Line: 15 ]]
	return {
		page = Page,
		rootConfig = RootConfig,
		dataUpdatedTimestamp = DataUpdatedTimestamp,
		expectedSduiFeedItems = ExpectedSduiFeedItems,
		customFeedStoreKey = CustomFeedStoreKey
	}
end)