return require(game:GetService("CorePackages").Packages.Rodux).createReducer({ tryingOn = false, assetId = nil, assetTypeId = nil }, {
	[require(script.Parent.Parent.Actions.SetTryingOnInfo).name] = function(_, p1)
		return {
			tryingOn = p1.tryingOn,
			assetId = p1.assetId,
			assetTypeId = p1.assetTypeId
		}
	end
})