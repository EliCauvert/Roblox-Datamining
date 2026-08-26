local parent = script.Parent.Parent

return require(parent.Parent.Rodux).createReducer(Vector2.new(0, 0), {
	[require(parent.Actions.ScreenSizeChanged).name] = function(_, p1)
		return p1.screenSize
	end
})