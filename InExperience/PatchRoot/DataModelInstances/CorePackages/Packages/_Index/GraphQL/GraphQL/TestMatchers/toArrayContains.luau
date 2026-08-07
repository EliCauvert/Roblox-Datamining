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