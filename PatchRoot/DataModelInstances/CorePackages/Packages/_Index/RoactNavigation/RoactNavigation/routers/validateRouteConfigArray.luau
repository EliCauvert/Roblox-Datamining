-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:02 2026 Pacific Standard Time.

local invariantModule = require(script.Parent.Parent.utils.invariant)
local isValidScreenComponentModule = require(script.Parent.Parent.utils.isValidScreenComponent)

return function(p0) --[[ line: 20 ]]
	-- upvalues: invariantModule (ref), isValidScreenComponentModule (ref)
	invariantModule(type(p0) == "table", "routeConfigs must be an array table")
	
	for i, v in p0 do
		invariantModule(type(i) == "number", ("routeConfigs must be an array table (found non-number key %q of type %q)"):format(i, type(i)))
		local var2, var3 = next(v)
		invariantModule(next(v, var2) == nil, ("only one route must be defined in each entry (found multiple at index %d)"):format(i))
		local var4 = if type(var3) ~= "table" then false else true
		local var5 = if var4 then var3 else {}
		invariantModule(isValidScreenComponentModule(if var4 then var3.screen else var3) or (type(var5.getScreen) == "function" and isValidScreenComponentModule(var5.getScreen())), "The component for route '%s' must be a Roact Function/Stateful component or table with 'getScreen'.getScreen function must return Roact Function/Stateful component.", var2)
		invariantModule(if var5.screen ~= nil then var5.getScreen == nil else true, "Route '%s' should provide 'screen' or 'getScreen', but not both.", var2)
	end
	invariantModule(#p0 > 0, "Please specify at least one route when configuring a navigator.")
	
	return p0
end