-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

local noneModule = require(script.Parent.Parent.None)

return function(...) --[[ line: 6 | named "join" ]]
	-- upvalues: noneModule (ref)
	local t = {}
	
	for i_1 = 1, select("#", ...) do
		local var2 = select(i_1, ...)
		local tCount = #t
		
		for i = 1, #var2 do
			if var2[i] == noneModule then
				tCount -= 1
			else
				t[tCount + i] = var2[i]
			end
		end
	end
	return t
end