-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:41 2026 Pacific Standard Time.

local function copyDeep(p0) --[[ line: 2 ]]
	-- upvalues: copyDeep (ref)
	local var1 = type(p0)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local t = {}
	
	for i, v in pairs(p0) do
		if type(v) == "table" then
			t[i] = copyDeep(v)
		else
			t[i] = v
		end
	end
	return t
end

return copyDeep