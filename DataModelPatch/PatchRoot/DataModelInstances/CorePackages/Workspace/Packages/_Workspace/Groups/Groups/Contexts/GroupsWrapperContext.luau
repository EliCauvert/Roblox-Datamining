return require(script:FindFirstAncestor("Groups").Parent.React).createContext({
	userId = "",
	navigateTo = {
		webView = function() end,
		groupDetails = function() end,
		seeAllGroups = function() end,
		createGroup = function() end
	}
})