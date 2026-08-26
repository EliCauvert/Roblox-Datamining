local parent = script:FindFirstAncestor("GameIconRodux").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p1, "table", "iconsTable")
	
	return { gameIcons = p1 }
end)