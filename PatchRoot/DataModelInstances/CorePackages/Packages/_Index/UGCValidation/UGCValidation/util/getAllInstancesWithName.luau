-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:39 2026 Pacific Standard Time.

return function(p0, p1) --[[ line: 1 ]]
	local descendants = p0:GetDescendants()
	table.insert(descendants, p0)
	local t = {}
	
	for i, v in descendants do
		if v.Name == p1 then
			table.insert(t, v)
		end
	end
	return t
end