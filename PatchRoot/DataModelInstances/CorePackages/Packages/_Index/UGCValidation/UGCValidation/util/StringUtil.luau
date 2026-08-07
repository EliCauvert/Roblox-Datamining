-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:40 2026 Pacific Standard Time.

return {
	keysToString = function(p0, p1, p2) --[[ line: 7 ]]
		local t = {}
		
		for i in p0 do
			table.insert(t, tostring(i))
		end
		if p2 then
			table.sort(t)
		end
		return table.concat(t, p1)
	end
}