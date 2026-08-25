return require(script:FindFirstAncestor("ProfilePlatform").Parent.React).createContext({
	scrollY = 0,
	peekViewOpenPercent = 0,
	setAbsoluteYPosition = function() end,
	setPeekViewOpenPercent = function() end
})