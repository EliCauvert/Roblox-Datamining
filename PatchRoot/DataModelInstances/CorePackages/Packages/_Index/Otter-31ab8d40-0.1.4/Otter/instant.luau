-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:55 2026 Pacific Standard Time.

local function step(p0, _, _) --[[ line: 1 ]]
	return { complete = true, value = p0.__targetValue }
end

return function(p1) --[[ line: 8 | named "instant" ]]
	-- upvalues: step (ref)
	return { __targetValue = p1, step = step }
end