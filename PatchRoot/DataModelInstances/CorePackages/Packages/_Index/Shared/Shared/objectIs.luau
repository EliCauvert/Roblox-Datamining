-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:20 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 16 | named "is" ]]
	local var0
	if p0 == p1 then
		var0 = true
		
		if p0 == 0 then
			var0 = true
			
			if 1 / p0 ~= 1 / p1 then
				var0 = p0 ~= p0 and p1 ~= p1
			end
		end
		return var0
	end
end