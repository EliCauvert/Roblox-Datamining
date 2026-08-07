-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:08 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local constantsModule = require(foundation.Constants)
local _ = require(foundation.Enums.DialogSize)
local _ = require(parent.React)

return {
	nonSelectable = constantsModule.MODAL.DISABLE_SELECTION,
	isolatedSelectionGroup = constantsModule.MODAL.TRAP_FOCUS
}