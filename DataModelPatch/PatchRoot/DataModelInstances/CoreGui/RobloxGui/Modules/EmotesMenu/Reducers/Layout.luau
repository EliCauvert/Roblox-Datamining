local Parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(require(Parent.Constants).Layout.Large, {
	[require(Parent.Actions.SetLayout).name] = function(_, p1)
		return p1.layout
	end
})