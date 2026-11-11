return require(game:GetService("CorePackages").Packages.Rodux).createReducer({ itemType = nil, itemId = nil }, {
	[require(script.Parent.Parent.Actions.SetItemBeingPurchased).name] = function(_, p1)
		return { itemType = p1.itemType, itemId = p1.itemId }
	end
})