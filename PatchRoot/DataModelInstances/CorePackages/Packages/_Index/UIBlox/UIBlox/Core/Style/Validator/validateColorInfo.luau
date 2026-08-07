-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:03 2026 Pacific Standard Time.

local parent = script.Parent
local tModule = require(parent.Parent.Parent.Parent.Parent.t)

return tModule.strictInterface({
	Color = tModule.Color3,
	Transparency = tModule.union(tModule.numberConstrained(0, 1), require(parent.validateBinding))
})