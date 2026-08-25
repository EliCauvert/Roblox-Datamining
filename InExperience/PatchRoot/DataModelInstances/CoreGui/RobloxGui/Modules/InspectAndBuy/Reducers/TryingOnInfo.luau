return require(game:GetService("CorePackages").Packages.Rodux).createReducer({ tryingOn = false, assetId = nil, assetTypeId = nil }, {
	[require(script.Parent.Parent.Actions.SetTryingOnInfo).name] = function(_, p0)
		return {
			tryingOn = p0.tryingOn,
			assetId = p0.assetId,
			assetTypeId = p0.assetTypeId
		}
	end
})