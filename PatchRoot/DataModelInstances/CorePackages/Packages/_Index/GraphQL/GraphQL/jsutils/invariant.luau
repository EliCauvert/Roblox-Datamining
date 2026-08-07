-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:34 2026 Pacific Standard Time.

return {
	invariant = function(p0, p1) --[[ line: 8 ]]
		if not p0 then
			error(p1 or "Unexpected invariant triggered.")
		end
	end
}