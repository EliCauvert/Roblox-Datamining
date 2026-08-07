-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:58 2026 Pacific Standard Time.

local parent = script.Parent
local tModule = require(parent.Parent.Parent.Parent.Parent.t)

return tModule.strictInterface({
	Theme = tModule.optional(require(parent.validateTheme)),
	Font = tModule.optional(require(parent.validateFont)),
	Tokens = tModule.optional(require(parent.validateTokens)),
	Settings = tModule.optional(require(parent.validateSettings))
})