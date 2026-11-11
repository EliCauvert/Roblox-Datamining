return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(IsSubjectToChinaPolicies)
	return { isSubjectToChinaPolicies = IsSubjectToChinaPolicies }
end)