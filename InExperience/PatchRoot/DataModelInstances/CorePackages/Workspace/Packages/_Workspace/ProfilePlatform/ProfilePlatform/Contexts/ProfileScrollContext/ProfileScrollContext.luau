return (require(script:FindFirstAncestor("ProfilePlatform").Parent.React).createContext({
	scrollY = 0,
	peekViewOpenPercent = 0,
	setAbsoluteYPosition = function() --[[ Line: 14 ]] end,
	setPeekViewOpenPercent = function() --[[ Line: 16 ]] end
}))