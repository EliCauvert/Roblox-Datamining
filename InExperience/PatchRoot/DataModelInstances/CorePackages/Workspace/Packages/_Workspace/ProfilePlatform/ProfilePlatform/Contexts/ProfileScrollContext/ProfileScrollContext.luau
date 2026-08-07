return require(script:FindFirstAncestor("ProfilePlatform").Parent.React).createContext({
	scrollY = 0,
	peekViewOpenPercent = 0,
	setAbsoluteYPosition = function() --[[ line: 14 ]] end,
	setPeekViewOpenPercent = function() --[[ line: 16 ]] end
})