-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local var0 = function() --[[ line: 3 ]]
	return true
end

return function(p0, p1) --[[ line: 39 | named "count" ]]
	-- upvalues: var0 (ref)
	local var1 = 0
	p1 = p1 or var0
	
	for i, v in p0 do
		if p1(v, i) then
			var1 += 1
		end
	end
	return var1
end