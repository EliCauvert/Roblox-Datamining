return require(game:GetService("CorePackages").Packages.Rodux).createReducer(true, {
	[require(script.Parent.Parent.Actions.SetIsSubjectToChinaPolicies).name] = function(_, p0)
		return p0.isSubjectToChinaPolicies
	end
})