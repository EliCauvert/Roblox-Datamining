-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:56 2026 Pacific Standard Time.

return function(p0, ...) --[[ line: 6 | named "omit" ]]
	local cloned = table.clone(p0)
	
	for i, v in { ... } do
		cloned[v] = nil
	end
	return cloned
end