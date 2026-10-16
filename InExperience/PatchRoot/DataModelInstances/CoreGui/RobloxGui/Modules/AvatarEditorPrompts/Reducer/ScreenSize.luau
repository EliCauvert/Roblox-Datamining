return (require(game:GetService("CorePackages").Packages.Rodux).createReducer(Vector2.new(0, 0), {
	[require(script.Parent.Parent.Actions.ScreenSizeUpdated).name] = function(_, p1) --[[ Line: 11 ]]
		return p1.screenSize
	end
}))