-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:54 2026 Pacific Standard Time.

local dEV = _G.__DEV__
local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0, p1, p2) --[[ line: 27 ]]
	-- upvalues: dEV (ref)
	if dEV then
		if typeof(p0) ~= "table" then
			error(string.format("Array.forEach called on %s", typeof(p0)))
		end
		if typeof(p1) ~= "function" then
			error("callback is not a function")
		end
	end
	local p0Count = #p0
	local var1 = 1
	while var1 <= p0Count do
		local var2 = p0[var1]
		
		if p2 == nil then
			p1(var2, var1, p0)
		else
			p1(p2, var2, var1, p0)
		end
		if #p0 < p0Count then
			p0Count = #p0
		end
		var1 += 1
	end
end