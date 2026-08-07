-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local var1 = require(foundation.Parent.React).createContext(if require(foundation.Utility.Flags).FoundationPopoverPluginOverlayMeasurement then { id = nil, ready = true } else nil)
var1.displayName = "PluginPopoverParentContext"

return var1