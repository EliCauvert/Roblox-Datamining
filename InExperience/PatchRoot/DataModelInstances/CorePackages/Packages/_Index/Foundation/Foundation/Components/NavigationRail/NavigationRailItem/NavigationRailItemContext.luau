local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Components.Types)

return require(Foundation.Parent.React).createContext({
	backgroundStyle = nil,
	collapseProgress = nil,
	heldWidth = nil,
	isResizing = nil,
	isTargetCollapsed = nil,
	railWidth = nil
})