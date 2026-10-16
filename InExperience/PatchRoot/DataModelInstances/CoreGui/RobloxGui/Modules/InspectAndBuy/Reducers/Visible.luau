local Parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(true, {
	[require(Parent.Actions.ShowMenu).name] = function(_, _): boolean --[[ Line: 8 ]]
		return true
	end,
	[require(Parent.Actions.HideMenu).name] = function(_, _): boolean --[[ Line: 11 ]]
		return false
	end
})