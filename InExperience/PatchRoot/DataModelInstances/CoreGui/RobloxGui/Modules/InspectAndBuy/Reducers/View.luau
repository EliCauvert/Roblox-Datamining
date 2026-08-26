local parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(require(parent.Constants).View.Wide, {
	[require(parent.Actions.SetView).name] = function(_, p1)
		return p1.view
	end
})