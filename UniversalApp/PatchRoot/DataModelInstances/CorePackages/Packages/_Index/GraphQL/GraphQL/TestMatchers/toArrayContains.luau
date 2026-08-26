local parent = script.Parent.Parent
local inspect = require(parent.Parent.LuauPolyfill).util.inspect
local arrayContainsModule = require(parent.luaUtils.arrayContains)

return function(p1, p2, p3)
	-- upvalues: arrayContainsModule (ref), inspect (ref)
	local var1 = arrayContainsModule(p1, p2, p3)
	
	return {
		pass = var1,
		message = if not var1 then "received tbl: " .. inspect(p2) .. " expected item to be in table: " .. inspect(p1) else ""
	}
end