-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:26 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 1 ]]
	return if p0 and p0 ~= "" then string.find(string.lower(p1), string.lower(p0), 1, true) ~= nil else true
end