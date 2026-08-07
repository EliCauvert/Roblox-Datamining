return require(game:GetService("CorePackages").Packages.Rodux).createReducer(false, {
	[require(script.Parent.Parent.Actions.SetAssets).name] = function(_, _) --[[ line: 8 ]]
		return true
	end
})