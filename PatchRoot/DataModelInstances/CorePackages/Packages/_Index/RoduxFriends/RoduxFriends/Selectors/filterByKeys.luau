-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:07 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 1 ]]
	local t = {}
	
	for i, v in pairs(p0) do
		local var1 = tostring(v)
		local var2 = p1[var1]
		
		if var2 then
			t[var1] = var2
		end
	end
	return t
end