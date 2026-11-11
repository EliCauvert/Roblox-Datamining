local Parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(true, {
	[require(Parent.Actions.ShowMenu).name] = function(_, _): boolean
		return true
	end,
	[require(Parent.Actions.HideMenu).name] = function(_, _): boolean
		return false
	end
})