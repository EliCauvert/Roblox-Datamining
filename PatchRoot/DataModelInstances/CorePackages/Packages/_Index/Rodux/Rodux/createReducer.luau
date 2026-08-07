-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:05 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 1 ]]
	return function(p2, p3) --[[ line: 2 ]]
		-- upvalues: p0 (ref), p1 (ref)
		if p2 == nil then
			p2 = p0
		end
		local type = p1[p3.type]
		
		return if type then type(p2, p3) else p2
	end
end