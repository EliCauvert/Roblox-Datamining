local InvariantModule = require(script.Parent.Parent.utils.invariant)
local IsValidScreenComponentModule = require(script.Parent.Parent.utils.isValidScreenComponent)

return function(List) --[[ Line: 20 ]]
	-- upvalues: InvariantModule (copy), IsValidScreenComponentModule (copy)
	InvariantModule(type(List) == "table", "routeConfigs must be an array table")
	
	for i, value in List do
		InvariantModule(type(i) == "number", ("routeConfigs must be an array table (found non-number key %q of type %q)"):format(i, (type(i))))
		local Key, Value = next(value)
		InvariantModule(next(value, Key) == nil, ("only one route must be defined in each entry (found multiple at index %d)"):format(i))
		local IsTable = type(Value) == "table"
		local Value1 = if IsTable then Value else {}
		InvariantModule(IsValidScreenComponentModule(IsTable and Value.screen or Value) or type(Value1.getScreen) == "function" and IsValidScreenComponentModule(Value1.getScreen()), "The component for route '%s' must be a Roact Function/Stateful component or table with 'getScreen'.getScreen function must return Roact Function/Stateful component.", Key)
		InvariantModule(Value1.screen == nil or Value1.getScreen == nil, "Route '%s' should provide 'screen' or 'getScreen', but not both.", Key)
	end
	InvariantModule(#List > 0, "Please specify at least one route when configuring a navigator.")
	
	return List
end