-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

local var0 = function(p0) --[[ line: 3 ]]
	return p0
end

return function(p1, p2) --[[ line: 17 | named "all" ]]
	-- upvalues: var0 (ref)
	p2 = p2 or var0
	
	for i, v in p1 do
		if not p2(v, i) then
			return false
		end
	end
	return true
end