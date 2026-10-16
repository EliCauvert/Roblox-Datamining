local Parent = script:FindFirstAncestor("ExperienceLoadingScript").Parent
local ArgCheckModule = require(Parent.ArgCheck)

return require(Parent.Rodux).makeActionCreator(script.Name, function(IsSubjectToChinaPolicies) --[[ Line: 7 ]]
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(IsSubjectToChinaPolicies, "boolean", "SetIsSubjectToChinaPolicies action expects isSubjectToChinaPolicies to be a boolean")
	
	return { isSubjectToChinaPolicies = IsSubjectToChinaPolicies }
end)