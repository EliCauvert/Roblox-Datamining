-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:42 2026 Pacific Standard Time.

local noneModule = require(script.Parent.Parent.None)

return function(...) --[[ line: 4 | named "join" ]]
	-- upvalues: noneModule (ref)
	local t = {}
	local var2 = 1
	
	for i_1 = 1, select("#", ...) do
		local var3 = select(i_1, ...)
		
		if not var3 then
			continue
		end
		for i = 1, #var3 do
			if var3[i] ~= noneModule then
				t[var2] = var3[i]
				var2 += 1
			end
		end
	end
	return t
end