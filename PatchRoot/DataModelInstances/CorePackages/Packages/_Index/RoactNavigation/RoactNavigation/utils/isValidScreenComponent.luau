-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:02 2026 Pacific Standard Time.

return function(p0) --[[ line: 2 ]]
	local var0 = type(p0)
	
	return if var0 ~= "function" then var0 == "table" and type(p0.render) == "function" else true
end