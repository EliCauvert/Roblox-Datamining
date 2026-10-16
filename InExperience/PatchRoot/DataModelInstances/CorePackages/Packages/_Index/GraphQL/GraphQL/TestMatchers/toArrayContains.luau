local Parent = script.Parent.Parent
local InspectFunction = require(Parent.Parent.LuauPolyfill).util.inspect
local ArrayContainsModule = require(Parent.luaUtils.arrayContains)

return function(p1, p2, p3) --[[ Line: 20 | Named "toArrayContains" ]]
	-- upvalues: ArrayContainsModule (copy), InspectFunction (copy)
	local ArrayContainsModuleResult = ArrayContainsModule(p1, p2, p3)
	
	return {
		pass = ArrayContainsModuleResult,
		message = if ArrayContainsModuleResult then "" else "received tbl: " .. InspectFunction(p2) .. " expected item to be in table: " .. InspectFunction(p1)
	}
end