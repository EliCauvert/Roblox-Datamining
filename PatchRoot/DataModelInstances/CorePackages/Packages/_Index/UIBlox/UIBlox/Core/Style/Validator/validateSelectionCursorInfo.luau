-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:04 2026 Pacific Standard Time.

local tModule = require(script.Parent.Parent.Parent.Parent.Parent.t)

return tModule.strictInterface({
	Color = tModule.Color3,
	AnimatedColor = tModule.Color3,
	Transparency = tModule.numberConstrained(0, 1),
	GradientRotationSpeed = tModule.number,
	GradientColorSequence = tModule.ColorSequence,
	GradientTransparencySequence = tModule.NumberSequence
})