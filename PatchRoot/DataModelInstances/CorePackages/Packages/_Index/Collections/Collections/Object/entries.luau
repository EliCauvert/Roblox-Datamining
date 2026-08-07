-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:55 2026 Pacific Standard Time.

local _ = require(script.Parent.Parent.Parent.ES7Types)

return function(p0) --[[ line: 24 ]]
	assert(p0 ~= nil, "cannot get entries from a nil value")
	local var0 = typeof(p0)
	local t = {}
	
	if var0 == "table" then
		for i, v in pairs(p0) do
			table.insert(t, { i, v })
		end
		return t
	elseif var0 == "string" then
		for i = 1, string.len(p0) do
			t[i] = { tostring(i), string.sub(p0, i, i) }
		end
	end
	return t
end