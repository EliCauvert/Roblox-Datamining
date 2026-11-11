local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)

return (require(Foundation.Parent.React).createContext({
	onActivated = nil,
	onNestedLeafActivated = nil,
	hasLeading = nil,
	setHasLeading = nil,
	hoverOpenAtDepth = nil,
	hoverCloseAtDepth = nil,
	hoverReset = nil,
	depth = 1,
	size = require(Foundation.Enums.InputSize).Medium,
	hoverOpenPath = {}
}))