local invariantModule = require(script.Parent.Parent.utils.invariant)
local isValidScreenComponentModule = require(script.Parent.Parent.utils.isValidScreenComponent)

return function(p1)
	-- upvalues: invariantModule (ref), isValidScreenComponentModule (ref)
	invariantModule(type(p1) == "table", "routeConfigs must be an array table")
	
	for i, v in p1 do
		invariantModule(type(i) == "number", ("routeConfigs must be an array table (found non-number key %q of type %q)"):format(i, type(i)))
		local var1, var2 = next(v)
		invariantModule(next(v, var1) == nil, ("only one route must be defined in each entry (found multiple at index %d)"):format(i))
		local var3 = if type(var2) ~= "table" then false else true
		local var4 = if var3 then var2 else {}
		invariantModule(isValidScreenComponentModule(if var3 then var2.screen else var2) or (type(var4.getScreen) == "function" and isValidScreenComponentModule(var4.getScreen())), "The component for route '%s' must be a Roact Function/Stateful component or table with 'getScreen'.getScreen function must return Roact Function/Stateful component.", var1)
		invariantModule(if var4.screen ~= nil then var4.getScreen == nil else true, "Route '%s' should provide 'screen' or 'getScreen', but not both.", var1)
	end
	invariantModule(#p1 > 0, "Please specify at least one route when configuring a navigator.")
	
	return p1
end