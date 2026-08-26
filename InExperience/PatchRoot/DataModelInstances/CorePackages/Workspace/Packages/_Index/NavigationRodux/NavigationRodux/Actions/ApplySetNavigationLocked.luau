local parent = script:FindFirstAncestor("NavigationRodux").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1)
	-- upvalues: argCheckModule (ref)
	return { locked = argCheckModule.isType(p1, "boolean", "locked") }
end)