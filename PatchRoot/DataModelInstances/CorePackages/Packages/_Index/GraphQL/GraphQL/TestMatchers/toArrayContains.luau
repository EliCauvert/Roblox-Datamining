-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:36 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local inspect = require(parent.Parent.LuauPolyfill).util.inspect
local arrayContainsModule = require(parent.luaUtils.arrayContains)

return function(p0, p1, p2) --[[ line: 20 | named "toArrayContains" ]]
	-- upvalues: arrayContainsModule (ref), inspect (ref)
	local var1 = arrayContainsModule(p0, p1, p2)
	
	return {
		pass = var1,
		message = if not var1 then "received tbl: " .. inspect(p1) .. " expected item to be in table: " .. inspect(p0) else ""
	}
end