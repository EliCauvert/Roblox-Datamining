local parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(require(parent.Constants).View.Wide, {
	[require(parent.Actions.SetView).name] = function(_, p0)
		return p0.view
	end
})