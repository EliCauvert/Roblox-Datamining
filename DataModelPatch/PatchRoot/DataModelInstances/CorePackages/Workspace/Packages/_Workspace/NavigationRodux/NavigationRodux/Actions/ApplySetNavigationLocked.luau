local Parent = script:FindFirstAncestor("NavigationRodux").Parent
local ArgCheckModule = require(Parent.ArgCheck)

return require(Parent.Rodux).makeActionCreator(script.Name, function(p1)
	-- upvalues: ArgCheckModule (copy)
	return { locked = ArgCheckModule.isType(p1, "boolean", "locked") }
end)