return require(script:FindFirstAncestor("Groups").Parent.React).createContext({
	userId = "",
	groupId = nil,
	groupDetailPaneSource = nil,
	navigateTo = {
		previousView = nil,
		webView = function() --[[ Line: 27 ]] end,
		groupDetails = function() --[[ Line: 28 ]] end,
		seeAllGroups = function() --[[ Line: 29 ]] end,
		createGroup = function() --[[ Line: 30 ]] end
	}
})