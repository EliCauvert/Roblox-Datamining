return require(game:GetService("CorePackages").Packages.Rodux).createReducer(Vector2.new(0, 0), {
	[require(script.Parent.Parent.Actions.ScreenSizeUpdated).name] = function(_, p0) --[[ line: 11 ]]
		return p0.screenSize
	end
})