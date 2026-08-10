local foundation = script:FindFirstAncestor("Foundation")
local _ = require(foundation.Components.Types)

return require(foundation.Parent.React).createContext({
	onActivated = nil,
	onNestedLeafActivated = nil,
	hasLeading = nil,
	setHasLeading = nil,
	hoverOpenAtDepth = nil,
	hoverCloseAtDepth = nil,
	hoverReset = nil,
	depth = 1,
	maxHeight = nil,
	size = require(foundation.Enums.InputSize).Medium,
	hoverOpenPath = {}
})