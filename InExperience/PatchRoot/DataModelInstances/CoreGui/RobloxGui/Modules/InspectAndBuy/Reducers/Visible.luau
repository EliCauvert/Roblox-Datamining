local parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(true, {
	[require(parent.Actions.ShowMenu).name] = function(_, _)
		return true
	end,
	[require(parent.Actions.HideMenu).name] = function(_, _)
		return false
	end
})