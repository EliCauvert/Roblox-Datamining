return require(game:GetService("CorePackages").Packages.Rodux).createReducer("", {
	[require(script.Parent.Parent.Actions.SetPlayerId).name] = function(_, p0)
		return p0.playerId
	end
})