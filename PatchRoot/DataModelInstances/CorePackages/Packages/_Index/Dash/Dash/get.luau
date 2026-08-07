-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

return function(p0, p1, p2) --[[ line: 22 | named "get" ]]
	if p0 == nil then
		return p2
	end
	local var0 = p0
	
	for i, v in p1 do
		if type(var0) == "table" then
			var0 = var0[v]
			
			if var0 == nil then
				return p2
			end
		end
		return p2
	end
	return var0
end