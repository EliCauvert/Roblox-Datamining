-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:05 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 19 ]]
	local var0 = p0
	
	for i, v in ipairs(p1:split(".")) do
		if var0[v] then
			var0 = var0[v]
			continue
		end
		return nil
	end
	return var0
end