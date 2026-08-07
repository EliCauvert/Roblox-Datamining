-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:47:57 2026 Pacific Standard Time.

local assertEqualModule = require(script.Parent.assertEqual)

return function(p0) --[[ line: 15 | named "isLowercase" ]]
	-- upvalues: assertEqualModule (ref)
	assertEqualModule(#p0 > 0, true, "Attempted to call Dash.isLowercase with an empty string")
	local var1 = p0:sub(1, 1)
	
	return var1 == var1:lower()
end