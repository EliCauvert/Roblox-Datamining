return require(game:GetService("CorePackages").Packages.Rodux).createReducer(false, {
	[require(script.Parent.Parent.Actions.SetGamepadEnabled).name] = function(_, p1)
		return p1.gamepadEnabled
	end
})