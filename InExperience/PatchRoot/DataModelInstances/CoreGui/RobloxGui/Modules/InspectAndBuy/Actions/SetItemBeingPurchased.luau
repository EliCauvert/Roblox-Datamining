local fFlagAXIaBSinglePurchaseUnifiedEventsModule = require(script.Parent.Parent.Flags.FFlagAXIaBSinglePurchaseUnifiedEvents)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(p1, p2, p3)
	-- upvalues: fFlagAXIaBSinglePurchaseUnifiedEventsModule (ref)
	return {
		itemId = p1,
		itemType = p2,
		resalePrice = if fFlagAXIaBSinglePurchaseUnifiedEventsModule then p3 else nil
	}
end)