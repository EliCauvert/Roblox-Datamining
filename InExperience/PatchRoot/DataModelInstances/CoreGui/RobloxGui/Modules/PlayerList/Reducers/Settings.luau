return require(game:GetService("CorePackages").Packages.Rodux).createReducer({ preferredTransparency = 1, reducedMotion = false }, {
	[require(script.Parent.Parent.Actions.SetSettings).name] = function(_, p1)
		return {
			preferredTransparency = p1.preferredTransparency,
			reducedMotion = p1.reducedMotion
		}
	end
})