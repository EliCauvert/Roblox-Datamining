local parent = script:FindFirstAncestor("ExperienceLoadingScript").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 7 ]]
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p0, "table", "SetGameProductInfo action expects productInfo to be a table")
	
	return { productInfo = p0 }
end)