-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 4 | named "removeValue" ]]
	local t = {}
	local var1 = 1
	
	for i = 1, #p0 do
		if p0[i] ~= p1 then
			t[var1] = p0[i]
			var1 += 1
		end
	end
	return t
end