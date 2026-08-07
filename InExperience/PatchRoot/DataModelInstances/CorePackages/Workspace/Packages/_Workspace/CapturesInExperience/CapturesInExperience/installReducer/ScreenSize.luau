local parent = script.Parent.Parent

return require(parent.Parent.Rodux).createReducer(Vector2.new(0, 0), {
	[require(parent.Actions.ScreenSizeChanged).name] = function(_, p0) --[[ line: 13 ]]
		return p0.screenSize
	end
})