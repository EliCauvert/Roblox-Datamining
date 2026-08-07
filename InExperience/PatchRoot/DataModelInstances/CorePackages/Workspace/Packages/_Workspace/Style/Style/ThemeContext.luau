return require(script:FindFirstAncestor("Style").Parent.React).createContext({
	theme = "dark",
	setTheme = function(_) --[[ line: 5 ]] end
})