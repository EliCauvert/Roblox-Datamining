-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:05 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")

return require(foundation.Parent.React).createContext({
	hasDivider = false,
	isContained = false,
	isInset = false,
	hasMargin = false,
	lastLayoutOrder = 0,
	testId = "",
	size = require(foundation.Enums.InputSize).Medium
})