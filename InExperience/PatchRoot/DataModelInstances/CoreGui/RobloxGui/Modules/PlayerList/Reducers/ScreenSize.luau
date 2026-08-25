return require(game:GetService("CorePackages").Packages.Rodux).createReducer({ X = 1000, Y = 1000 }, {
	[require(script.Parent.Parent.Actions.SetScreenSize).name] = function(_, p0)
		return { X = p0.sizeX, Y = p0.sizeY }
	end
})