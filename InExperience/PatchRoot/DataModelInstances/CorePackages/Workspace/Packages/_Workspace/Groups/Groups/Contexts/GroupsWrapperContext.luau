return require(script:FindFirstAncestor("Groups").Parent.React).createContext({
	userId = "",
	navigateTo = {
		webView = function() --[[ line: 23 ]] end,
		groupDetails = function() --[[ line: 24 ]] end,
		seeAllGroups = function() --[[ line: 25 ]] end,
		createGroup = function() --[[ line: 26 ]] end
	}
})