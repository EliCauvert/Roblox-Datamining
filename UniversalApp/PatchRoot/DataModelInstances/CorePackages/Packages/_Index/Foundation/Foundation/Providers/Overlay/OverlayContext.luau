return require(script:FindFirstAncestor("Foundation").Parent.React).createContext({
	instance = nil,
	screen = nil,
	requestOverlay = function() end
})