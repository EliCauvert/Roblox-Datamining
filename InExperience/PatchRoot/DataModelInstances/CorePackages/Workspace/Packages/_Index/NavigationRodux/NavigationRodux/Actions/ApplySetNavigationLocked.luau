local parent = script:FindFirstAncestor("NavigationRodux").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 7 ]]
	-- upvalues: argCheckModule (ref)
	return { locked = argCheckModule.isType(p0, "boolean", "locked") }
end)