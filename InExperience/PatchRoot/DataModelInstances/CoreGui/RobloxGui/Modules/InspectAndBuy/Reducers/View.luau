local Parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(require(Parent.Constants).View.Wide, {
	[require(Parent.Actions.SetView).name] = function(_, p1) --[[ Line: 8 ]]
		return p1.view
	end
})