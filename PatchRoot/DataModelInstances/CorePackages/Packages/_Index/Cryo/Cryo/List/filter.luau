-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 5 | named "filter" ]]
	local t = {}
	local var1 = 1
	
	for i = 1, #p0 do
		local var2 = p0[i]
		
		if p1(var2, i) then
			t[var1] = var2
			var1 += 1
		end
	end
	return t
end