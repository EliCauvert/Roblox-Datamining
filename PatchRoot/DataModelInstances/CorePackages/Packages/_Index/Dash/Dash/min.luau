-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local reduceModule = require(script.Parent.reduce)

local var1 = function(p0, p1) --[[ line: 8 ]]
	return p0 < p1
end

return function(a, b, p2) --[[ line: 48 | named "min" ]]
	-- upvalues: var1 (ref), reduceModule (ref)
	p2 = p2 or var1
	
	return if b then reduceModule(a, function(p5, p6, p7) --[[ line: 52 ]]
		-- upvalues: b (ref), p2 (ref)
		local var3 = b(p6, p7)
		
		return if p5 then if p2(var3, p5.value) then { value = var3, original = p6 } else p5 else { value = var3, original = p6 }
	end, nil).original else reduceModule(a, function(p3, p4) --[[ line: 62 ]]
		-- upvalues: p2 (ref)
		return if p3 then if p2(p4, p3) then p4 else p3 else p4
	end, nil)
end