return require(game:GetService("CorePackages").Packages.Rodux).createReducer({ X = 1000, Y = 1000 }, {
	[require(script.Parent.Parent.Actions.SetScreenSize).name] = function(_, p1)
		return { X = p1.sizeX, Y = p1.sizeY }
	end
})