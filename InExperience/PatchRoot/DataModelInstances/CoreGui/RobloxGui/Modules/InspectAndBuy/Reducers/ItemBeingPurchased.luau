return require(game:GetService("CorePackages").Packages.Rodux).createReducer({ itemType = nil, itemId = nil }, {
	[require(script.Parent.Parent.Actions.SetItemBeingPurchased).name] = function(_, p0)
		return { itemType = p0.itemType, itemId = p0.itemId }
	end
})