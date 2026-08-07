-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

return function(p0) --[[ line: 7 | named "isCallable" ]]
	return if not (type(p0) == "function" or type(p0) ~= "table" or not getmetatable(p0)) then getmetatable(p0).__call ~= nil else true
end