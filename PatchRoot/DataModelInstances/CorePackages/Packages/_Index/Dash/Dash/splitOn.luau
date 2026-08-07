-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local insert = table.insert

return function(p0, p1) --[[ line: 10 | named "splitOn" ]]
	-- upvalues: insert (ref)
	local t = {}
	local t_1 = {}
	local var2 = 1
	
	if p1 then
		local var3, var4 = p0:find(p1, var2)
		while var3 do
			insert(t_1, p0:sub(var3, var4))
			insert(t, p0:sub(var2, var3 - 1))
			var2 = var4 + 1
			local var5, var6 = p0:find(p1, var2)
			var3 = var5
			var4 = var6
		end
		insert(t, p0:sub(var2))
		
		return t, t_1
	else
		for i = 1, #p0 do
			insert(t, p0:sub(i, i))
		end
		return t
	end
end