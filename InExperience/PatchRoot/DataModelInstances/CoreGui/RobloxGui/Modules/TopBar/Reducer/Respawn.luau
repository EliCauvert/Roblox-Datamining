return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateRespawnRodux) then nil else require(game:GetService("CorePackages").Packages.Rodux).createReducer({ enabled = true, customCallback = nil }, {
	[require(script.Parent.Parent.Actions.SetRespawnBehaviour).name] = function(_, p0) --[[ line: 20 ]]
		return {
			enabled = p0.respawnEnabled,
			customCallback = p0.customCallback
		}
	end
})