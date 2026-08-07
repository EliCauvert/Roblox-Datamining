-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:02 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local dialogSizeModule = require(foundation.Enums.DialogSize)

return require(foundation.Parent.React).createContext({
	hasHeroMedia = false,
	testId = "",
	closeAffordanceRef = nil,
	contentStartRef = nil,
	size = dialogSizeModule.Small,
	responsiveSize = dialogSizeModule.Small,
	setResponsiveSize = function(_) --[[ line: 11 ]] end,
	setHasHeroMedia = function(_) --[[ line: 13 ]] end,
	setContentStartRef = function(_) --[[ line: 17 ]] end
})