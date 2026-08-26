local parent = script:FindFirstAncestor("ExperienceLoadingScript").Parent
local argCheckModule = require(parent.ArgCheck)

return require(parent.Rodux).makeActionCreator(script.Name, function(p1)
	-- upvalues: argCheckModule (ref)
	argCheckModule.isType(p1, "boolean", "SetIsSubjectToChinaPolicies action expects isSubjectToChinaPolicies to be a boolean")
	
	return { isSubjectToChinaPolicies = p1 }
end)