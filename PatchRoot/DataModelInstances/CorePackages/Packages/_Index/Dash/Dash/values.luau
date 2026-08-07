-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local _ = require(script.Parent.Types)
local insert = table.insert

return function(p0) --[[ line: 14 | named "values" ]]
	-- upvalues: insert (ref)
	local t = {}
	
	for i, v in p0 do
		insert(t, v)
	end
	return t
end