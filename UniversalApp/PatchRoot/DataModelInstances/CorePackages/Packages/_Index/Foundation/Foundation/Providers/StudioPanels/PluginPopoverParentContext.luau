local Foundation = script:FindFirstAncestor("Foundation")
local config = { id = nil, ready = true }
local Context = require(Foundation.Parent.React).createContext(if require(Foundation.Utility.Flags).FoundationPopoverPluginOverlayMeasurement then config else nil)
Context.displayName = "PluginPopoverParentContext"

return Context