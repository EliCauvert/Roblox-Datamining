-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:36 2026 Pacific Standard Time.

local deepEqualModule = require(script.Parent.Parent.luaUtils.deepEqual)

return function(p0, p1) --[[ line: 17 | named "toEqual" ]]
	-- upvalues: deepEqualModule (ref)
	local var1, var2 = deepEqualModule(p0, p1)
	
	return {
		pass = var1,
		message = if not var1 then var2:gsub("{1}", "received"):gsub("{2}", "expected") else ("expected: not %s\nreceived:     %s"):format(tostring(p1), tostring(p0))
	}
end