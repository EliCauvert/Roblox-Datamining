-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:59 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")

return require(foundation.Parent.React).createContext({
	onAccordionItemActivated = nil,
	testId = "",
	itemSize = require(foundation.Enums.InputSize).Medium
})