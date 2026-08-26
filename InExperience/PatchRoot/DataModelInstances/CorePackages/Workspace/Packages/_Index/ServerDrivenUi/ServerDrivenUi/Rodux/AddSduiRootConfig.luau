local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local _ = require(parent.SduiCoreSystem)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3, p4, p5)
	return {
		page = p1,
		rootConfig = p2,
		dataUpdatedTimestamp = p3,
		expectedSduiFeedItems = p4,
		customFeedStoreKey = p5
	}
end)