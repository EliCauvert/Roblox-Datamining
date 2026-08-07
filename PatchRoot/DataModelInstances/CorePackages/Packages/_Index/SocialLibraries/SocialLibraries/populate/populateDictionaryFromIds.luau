-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:25 2026 Pacific Standard Time.

local function populateDictionaryFromIds(p0, p1) --[[ line: 5 ]]
	-- upvalues: populateDictionaryFromIds (ref)
	local t = {}
	
	for i, v in pairs(p0) do
		if type(v) == "table" then
			t[i] = populateDictionaryFromIds(v, p1)
		else
			t[i] = p1[v]
		end
	end
	return t
end

return populateDictionaryFromIds