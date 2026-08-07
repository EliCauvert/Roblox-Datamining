-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

return {
	isNonNullObject = function(p0) --[[ line: 9 ]]
		return p0 ~= nil and type(p0) == "table"
	end
}