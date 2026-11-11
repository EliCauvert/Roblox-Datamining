local CorePackages = game:GetService("CorePackages")

return if require(script.Parent.Parent.Flags.FFlagTopBarDeprecateRespawnRodux) then nil else require(CorePackages.Packages.Rodux).createReducer({ enabled = true, customCallback = nil }, {
	[require(script.Parent.Parent.Actions.SetRespawnBehaviour).name] = function(_, p1)
		return {
			enabled = p1.respawnEnabled,
			customCallback = p1.customCallback
		}
	end
})