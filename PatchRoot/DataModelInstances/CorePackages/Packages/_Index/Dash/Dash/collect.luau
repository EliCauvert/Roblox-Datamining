-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

local _ = require(script.Parent.Types)

return function(p0, p1) --[[ line: 16 | named "collect" ]]
	local t = {}
	
	for i, v in p0 do
		local var1, var2 = p1(i, v)
		
		if var1 ~= nil then
			t[var1] = var2
		end
	end
	return t
end