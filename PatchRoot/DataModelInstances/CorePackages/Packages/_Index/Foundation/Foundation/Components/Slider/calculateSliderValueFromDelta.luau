-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:09 2026 Pacific Standard Time.

return function(p0, p1, p2) --[[ line: 7 | named "calculateSliderValueFromDelta" ]]
	return math.clamp(p0 + p1 * (p2.Max - p2.Min), p2.Min, p2.Max)
end