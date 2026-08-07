local parent = script:FindFirstAncestor("ExperienceLoadingScript").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p0) --[[ line: 7 ]]
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p0, "boolean", "SetIsSubjectToChinaPolicies action expects isSubjectToChinaPolicies to be a boolean")
	
	return { isSubjectToChinaPolicies = p0 }
end)