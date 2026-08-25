return require(game:GetService("CorePackages").Packages.Rodux).createReducer({ viewingDetails = false, assetId = nil }, {
	[require(script.Parent.Parent.Actions.SetDetailsInformation).name] = function(_, p0)
		return { viewingDetails = p0.viewingDetails, assetId = p0.assetId }
	end
})