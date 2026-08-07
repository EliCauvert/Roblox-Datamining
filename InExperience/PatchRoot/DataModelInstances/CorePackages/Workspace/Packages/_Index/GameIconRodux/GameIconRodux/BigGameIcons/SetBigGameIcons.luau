local parent = script:FindFirstAncestor("GameIconRodux").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 10 ]]
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p0, "table", "iconsTable")
	
	return { gameIcons = p0 }
end)