local Parent = script:FindFirstAncestor("GameIconRodux").Parent
local ArgCheckModule = require(Parent.ArgCheck)

return require(Parent.Rodux).makeActionCreator(script.Name, function(GameIcons)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(GameIcons, "table", "iconsTable")
	
	return { gameIcons = GameIcons }
end)