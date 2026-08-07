local parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(require(parent.Constants).Layout.Large, {
	[require(parent.Actions.SetLayout).name] = function(_, p0) --[[ line: 14 ]]
		return p0.layout
	end
})