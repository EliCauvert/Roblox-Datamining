-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:41 2026 Pacific Standard Time.

local noneModule = require(script.Parent.Parent.None)

return function(...) --[[ line: 4 | named "join" ]]
	-- upvalues: noneModule (ref)
	local t = {}
	
	for i = 1, select("#", ...) do
		local var2 = select(i, ...)
		
		if not var2 then
			continue
		end
		for i, v in pairs(var2) do
			if v == noneModule then
				t[i] = nil
			else
				t[i] = v
			end
		end
	end
	return t
end