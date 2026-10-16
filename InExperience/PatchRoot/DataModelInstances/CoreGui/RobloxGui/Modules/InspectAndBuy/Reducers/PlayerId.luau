return require(game:GetService("CorePackages").Packages.Rodux).createReducer("", {
	[require(script.Parent.Parent.Actions.SetPlayerId).name] = function(_, p1) --[[ Line: 7 ]]
		return p1.playerId
	end
})