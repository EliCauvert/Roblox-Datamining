-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:41 2026 Pacific Standard Time.

local function copyDeep(p0) --[[ line: 2 ]]
	-- upvalues: copyDeep (ref)
	local var1 = type(p0)
	assert(var1 == "table", "expected a table for first argument, got " .. var1)
	local t = {}
	
	for i = 1, #p0 do
		if type(p0[i]) == "table" then
			t[i] = copyDeep(p0[i])
		else
			t[i] = p0[i]
		end
	end
	return t
end

return copyDeep