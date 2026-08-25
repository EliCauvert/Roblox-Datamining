return require(game:GetService("CorePackages").Packages.Rodux).createReducer(false, {
	[require(script.Parent.Parent.Actions.SetGamepadEnabled).name] = function(_, p0)
		return p0.gamepadEnabled
	end
})