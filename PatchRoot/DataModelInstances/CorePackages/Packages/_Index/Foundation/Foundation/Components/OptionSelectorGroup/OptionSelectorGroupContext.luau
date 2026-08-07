-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:06 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")

return require(foundation.Parent.React).createContext({
	value = nil,
	Selectable = true,
	testId = "",
	onValueChanged = function(_) --[[ line: 10 ]]
		warn("No OptionSelectorGroupProvider found for OptionSelectorGroup")
	end,
	orientation = require(foundation.Enums.Orientation).Vertical
})