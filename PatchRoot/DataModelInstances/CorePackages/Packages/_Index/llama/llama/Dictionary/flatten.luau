-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:41 2026 Pacific Standard Time.

local joinModule = require(script.Parent.join)

local function flatten(p0) --[[ line: 4 ]]
	-- upvalues: joinModule (ref), flatten (ref)
	local var2 = type(p0)
	assert(var2 == "table", "expected a table for first argument, got " .. var2)
	local t = {}
	
	for i, v in pairs(p0) do
		if type(v) == "table" then
			t = joinModule(flatten(v), t)
		else
			t[i] = v
		end
	end
	return t
end

return flatten