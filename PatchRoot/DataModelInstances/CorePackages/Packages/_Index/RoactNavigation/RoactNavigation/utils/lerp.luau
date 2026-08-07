-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:02 2026 Pacific Standard Time.

return function(startValue, endValue, alpha) --[[ line: 2 | named "lerp" ]]
	return startValue * (1 - alpha) + endValue * alpha
end