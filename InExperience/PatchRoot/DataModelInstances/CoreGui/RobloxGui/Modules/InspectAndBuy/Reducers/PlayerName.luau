return require(game:GetService("CorePackages").Packages.Rodux).createReducer("", {
	[require(script.Parent.Parent.Actions.SetPlayerName).name] = function(_, p0) --[[ line: 7 ]]
		return p0.playerName
	end
})