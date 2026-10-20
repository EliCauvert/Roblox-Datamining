local Parent = script.Parent.Parent

return require(Parent.Parent.Rodux).createReducer(Vector2.new(0, 0), {
	[require(Parent.Actions.ScreenSizeChanged).name] = function(_, p1)
		return p1.screenSize
	end
})