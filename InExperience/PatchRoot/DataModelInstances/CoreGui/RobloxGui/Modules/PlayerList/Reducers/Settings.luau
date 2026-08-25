return require(game:GetService("CorePackages").Packages.Rodux).createReducer({ preferredTransparency = 1, reducedMotion = false }, {
	[require(script.Parent.Parent.Actions.SetSettings).name] = function(_, p0)
		return {
			preferredTransparency = p0.preferredTransparency,
			reducedMotion = p0.reducedMotion
		}
	end
})