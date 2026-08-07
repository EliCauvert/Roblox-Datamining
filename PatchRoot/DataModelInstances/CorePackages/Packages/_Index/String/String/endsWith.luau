-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:27 2026 Pacific Standard Time.

return function(p0, p1, p2) --[[ line: 16 | named "endsWith" ]]
	local var0 = p1:len()
	
	if var0 == 0 then
		return true
	end
	local var1 = p0:len()
	p2 = p2 or var1
	
	if var1 < p2 then
		p2 = var1
	end
	if p2 < 1 then
		return false
	end
	local var3 = p2 - var0 + 1
	
	return p0:find(p1, var3, true) == var3
end