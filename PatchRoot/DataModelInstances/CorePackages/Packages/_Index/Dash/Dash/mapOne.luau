-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 14 | named "mapOne" ]]
	for i, v in p0 do
		local var0 = if p1 then p1(v, i) else v
		
		if var0 ~= nil then
			return var0
		end
	end
	return nil
end