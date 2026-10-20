return require(game:GetService("CorePackages").Packages.Rodux).createReducer({ viewingDetails = false, assetId = nil }, {
	[require(script.Parent.Parent.Actions.SetDetailsInformation).name] = function(_, p1)
		return { viewingDetails = p1.viewingDetails, assetId = p1.assetId }
	end
})