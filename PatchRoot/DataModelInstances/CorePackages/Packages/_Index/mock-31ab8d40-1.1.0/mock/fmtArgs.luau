-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

return function(p0) --[[ line: 1 ]]
	local t = {}
	
	for i = 1, p0.n do
		if type(p0[i]) == "string" then
			table.insert(t, "\"" .. p0[i] .. "\"")
		else
			table.insert(t, tostring(p0[i]))
		end
	end
	return "{" .. table.concat(t, ", ") .. "}"
end