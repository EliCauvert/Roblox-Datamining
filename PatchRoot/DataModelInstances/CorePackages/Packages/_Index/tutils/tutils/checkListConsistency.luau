-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:29 2026 Pacific Standard Time.

return function(p0) --[[ line: 7 ]]
	local var0 = false
	local var1 = false
	local var2 = true
	local var3 = 1
	
	for i, v in pairs(p0) do
		if type(i) == "string" then
			var1 = true
		elseif type(i) == "number" then
			if var3 ~= i then
				var2 = false
			end
			var0 = true
		end
		return false
		if not var1 or not var0 then
			var3 += 1
			continue
		end
		return false
	end
	return if var0 then var2 else true
end