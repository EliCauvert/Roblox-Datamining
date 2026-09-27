return require(script:FindFirstAncestor("Groups").Parent.React).createContext({
	userId = "",
	groupId = nil,
	groupDetailPaneSource = nil,
	navigateTo = {
		previousView = nil,
		webView = function() end,
		groupDetails = function() end,
		seeAllGroups = function() end,
		createGroup = function() end
	}
})