local inspect = require(script.Parent.Parent.Parent.LuauPolyfill).util.inspect
local deepContainsModule = require(script.Parent.Parent.luaUtils.deepContains)

return function(p1, p2)
	-- upvalues: deepContainsModule (ref), inspect (ref)
	local var1 = deepContainsModule(p1, p2)
	
	return {
		pass = var1,
		message = if not var1 then "received tbl: " .. inspect(p2) .. " expected item to be in table: " .. inspect(p1) else ""
	}
end