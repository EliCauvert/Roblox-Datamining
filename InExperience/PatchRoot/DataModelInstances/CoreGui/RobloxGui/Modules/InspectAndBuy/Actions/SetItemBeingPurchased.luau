local FFlagAXIaBSinglePurchaseUnifiedEventsModule = require(script.Parent.Parent.Flags.FFlagAXIaBSinglePurchaseUnifiedEvents)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(ItemId, ItemType, p1)
	-- upvalues: FFlagAXIaBSinglePurchaseUnifiedEventsModule (copy)
	return {
		itemId = ItemId,
		itemType = ItemType,
		resalePrice = if FFlagAXIaBSinglePurchaseUnifiedEventsModule then p1 else nil
	}
end)