return (require(game:GetService("CorePackages").Packages.Rodux).createReducer(true, {
	[require(script.Parent.Parent.Actions.SetIsSubjectToChinaPolicies).name] = function(_, p1) --[[ Line: 11 ]]
		return p1.isSubjectToChinaPolicies
	end
}))