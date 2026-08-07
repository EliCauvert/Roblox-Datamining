-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:58 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent.Parent.Parent
local tModule = require(parent.t)

return tModule.strictInterface({
	PreferredTransparency = tModule.optional(tModule.number),
	ReducedMotion = tModule.optional(tModule.boolean),
	PreferredTextSize = if require(parent.UIBlox.Core.Utility.GetEngineFeatureSafe)("EnablePreferredTextSizeSetting") then tModule.optional(tModule.enum(Enum.PreferredTextSize)) else nil,
	Scale = tModule.optional(tModule.number)
})