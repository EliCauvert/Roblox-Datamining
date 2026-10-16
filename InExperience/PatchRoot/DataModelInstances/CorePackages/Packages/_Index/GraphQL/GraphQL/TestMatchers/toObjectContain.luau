local InspectFunction = require(script.Parent.Parent.Parent.LuauPolyfill).util.inspect
local DeepContainsModule = require(script.Parent.Parent.luaUtils.deepContains)

return function(p1, p2) --[[ Line: 20 | Named "toObjectContain" ]]
	-- upvalues: DeepContainsModule (copy), InspectFunction (copy)
	local DeepContainsModuleResult = DeepContainsModule(p1, p2)
	
	return {
		pass = DeepContainsModuleResult,
		message = if DeepContainsModuleResult then "" else "received tbl: " .. InspectFunction(p2) .. " expected item to be in table: " .. InspectFunction(p1)
	}
end