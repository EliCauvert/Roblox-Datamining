return require(game:GetService("CorePackages").Packages.Rodux).createReducer("", {
	[require(script.Parent.Parent.Actions.SetPlayerId).name] = function(_, p0) --[[ line: 7 ]]
		return p0.playerId
	end
})