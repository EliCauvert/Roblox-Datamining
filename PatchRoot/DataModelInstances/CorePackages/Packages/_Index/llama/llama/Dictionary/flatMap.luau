-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:41 2026 Pacific Standard Time.

local joinModule = require(script.Parent.join)

local function flatMap(p0, p1) --[[ line: 4 ]]
	-- upvalues: joinModule (ref), flatMap (ref)
	local var2 = type(p0)
	assert(var2 == "table", "expected a table for first argument, got " .. var2)
	local var3 = type(p1)
	assert(var3 == "function", "expected a function for second argument, got " .. var3)
	local t = {}
	
	for i, v in pairs(p0) do
		if type(v) == "table" then
			t = joinModule(flatMap(v, p1), t)
		else
			local var5, var6 = p1(v, i)
			t[var6 or i] = var5
		end
	end
	return t
end

return flatMap