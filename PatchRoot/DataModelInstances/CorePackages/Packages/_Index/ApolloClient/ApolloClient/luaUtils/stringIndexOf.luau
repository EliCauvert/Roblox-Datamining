-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:15 2026 Pacific Standard Time.

return {
	stringIndexOf = function(p0, p1) --[[ line: 11 ]]
		local matchIndex, _ = string.find(p0, p1)
		
		return if matchIndex == nil then -1 else matchIndex
	end
}