-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 4 | named "removeIndex" ]]
	local t = {}
	local var1 = 0
	
	for i = 1, #p0 do
		if i == p1 then
			var1 = 1
		else
			t[i - var1] = p0[i]
		end
	end
	return t
end