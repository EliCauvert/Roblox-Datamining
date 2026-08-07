-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:05 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 7 ]]
	return function(p2, ...) --[[ line: 8 ]]
		-- upvalues: p1 (ref), p0 (ref)
		return if p2 == p1 then p0(p1, ...) else p0(p1, p2, ...)
	end
end