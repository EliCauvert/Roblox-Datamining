local parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(require(parent.Constants).Layout.Large, {
	[require(parent.Actions.SetLayout).name] = function(_, p1)
		return p1.layout
	end
})