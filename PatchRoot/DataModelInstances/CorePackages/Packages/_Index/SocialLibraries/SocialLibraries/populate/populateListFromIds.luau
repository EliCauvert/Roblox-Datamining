-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:25 2026 Pacific Standard Time.

local function populateListFromIds(p0, p1) --[[ line: 5 ]]
	-- upvalues: populateListFromIds (ref)
	local t = {}
	
	for i, v in ipairs(p0) do
		if type(v) == "table" then
			table.insert(t, populateListFromIds(v, p1))
		else
			table.insert(t, p1[v])
		end
	end
	return t
end

return populateListFromIds