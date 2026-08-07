local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local _ = require(parent.SduiCoreSystem)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2, p3, p4) --[[ line: 15 ]]
	return {
		page = p0,
		rootConfig = p1,
		dataUpdatedTimestamp = p2,
		expectedSduiFeedItems = p3,
		customFeedStoreKey = p4
	}
end)