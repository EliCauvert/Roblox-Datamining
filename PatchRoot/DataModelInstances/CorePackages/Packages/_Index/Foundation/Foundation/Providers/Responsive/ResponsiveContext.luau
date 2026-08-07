-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:27 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")

return require(foundation.Parent.React).createContext({
	config = {
		breakpoint = require(foundation.Utility.Responsive.BreakpointConfig),
		grid = require(foundation.Utility.Responsive.GridConfig)
	}
})