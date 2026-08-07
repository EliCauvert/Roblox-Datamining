-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 13 | named "last" ]]
	for i = #p0, 1, -1 do
		local var0 = p0[i]
		
		if p1 then
			if not p1 or not p1(var0, i) then
				continue
			end
			return var0
		end
		return var0
	end
	return nil
end