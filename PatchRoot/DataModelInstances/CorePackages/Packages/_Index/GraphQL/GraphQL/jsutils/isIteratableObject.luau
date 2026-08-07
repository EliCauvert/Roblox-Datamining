-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:34 2026 Pacific Standard Time.

return {
	isIteratableObject = function(p0) --[[ line: 27 ]]
		return typeof(p0) == "table" and (next(p0) == nil or #p0 ~= 0)
	end
}