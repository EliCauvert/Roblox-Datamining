-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:05 2026 Pacific Standard Time.

return function(p0) --[[ line: 4 | named "combineReducers" ]]
	return function(p1, p2) --[[ line: 5 ]]
		-- upvalues: p0 (ref)
		if p1 == nil then
			p1 = {}
		end
		local t = {}
		
		for i, v in pairs(p0) do
			t[i] = v(p1[i], p2)
		end
		return t
	end
end