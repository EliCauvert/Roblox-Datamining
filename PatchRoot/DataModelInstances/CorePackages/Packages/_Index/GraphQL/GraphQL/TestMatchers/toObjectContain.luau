-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:36 2026 Pacific Standard Time.

local inspect = require(script.Parent.Parent.Parent.LuauPolyfill).util.inspect
local deepContainsModule = require(script.Parent.Parent.luaUtils.deepContains)

return function(p0, p1) --[[ line: 20 | named "toObjectContain" ]]
	-- upvalues: deepContainsModule (ref), inspect (ref)
	local var1 = deepContainsModule(p0, p1)
	
	return {
		pass = var1,
		message = if not var1 then "received tbl: " .. inspect(p1) .. " expected item to be in table: " .. inspect(p0) else ""
	}
end