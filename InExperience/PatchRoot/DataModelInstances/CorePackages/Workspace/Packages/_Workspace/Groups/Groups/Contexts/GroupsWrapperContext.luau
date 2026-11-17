local Parent = script:FindFirstAncestor("Groups").Parent
local _ = require(Parent.Signals)

return require(Parent.React).createContext({
	userId = "",
	groupId = nil,
	groupOverviewPaneSource = nil,
	navigateTo = {
		previousView = nil,
		webView = function() end,
		groupDetails = function() end,
		seeAllGroups = function() end,
		createGroup = function() end
	}
})