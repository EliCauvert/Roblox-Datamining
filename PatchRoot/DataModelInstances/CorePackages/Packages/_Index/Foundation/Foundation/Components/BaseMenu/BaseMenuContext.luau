-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:00 2026 Pacific Standard Time.

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