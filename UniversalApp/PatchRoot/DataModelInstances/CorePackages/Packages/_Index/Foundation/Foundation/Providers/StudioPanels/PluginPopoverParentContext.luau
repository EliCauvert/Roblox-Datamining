local foundation = script:FindFirstAncestor("Foundation")
local var1 = require(foundation.Parent.React).createContext(if require(foundation.Utility.Flags).FoundationPopoverPluginOverlayMeasurement then { id = nil, ready = true } else nil)
var1.displayName = "PluginPopoverParentContext"

return var1