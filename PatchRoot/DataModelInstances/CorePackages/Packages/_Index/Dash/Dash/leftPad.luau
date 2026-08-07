-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

return function(p0, p1, p2) --[[ line: 21 | named "leftPad" ]]
	p2 = p2 or " "
	local var1 = p1 - p0:len()
	local var2 = var1 % p2:len()
	
	return string.rep(p2 or " ", (var1 - var2) / p2:len()) .. p2:sub(1, var2) .. p0
end