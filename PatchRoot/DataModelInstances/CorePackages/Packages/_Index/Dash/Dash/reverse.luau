-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local insert = table.insert

return function(p0) --[[ line: 9 | named "reverse" ]]
	-- upvalues: insert (ref)
	local t = {}
	
	for i = #p0, 1, -1 do
		insert(t, p0[i])
	end
	return t
end