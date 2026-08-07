-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local parent = script.Parent
local _ = require(parent.Types)
local reduceModule = require(parent.reduce)

return function(p0, p1) --[[ line: 31 | named "frequencies" ]]
	-- upvalues: reduceModule (ref)
	return reduceModule(p0, function(p2, p3, p4) --[[ line: 32 ]]
		-- upvalues: p1 (ref)
		local var1 = if p1 then p1(p3, p4) else p3
		
		if p2[var1] == nil then
			p2[var1] = 1
			
			return p2
		end
		p2[var1] += 1
		
		return p2
	end, {})
end