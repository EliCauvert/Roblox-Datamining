local parent = script:FindFirstAncestor("ExperienceLoadingScript").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p1, "table", "SetGameProductInfo action expects productInfo to be a table")
	
	return { productInfo = p1 }
end)