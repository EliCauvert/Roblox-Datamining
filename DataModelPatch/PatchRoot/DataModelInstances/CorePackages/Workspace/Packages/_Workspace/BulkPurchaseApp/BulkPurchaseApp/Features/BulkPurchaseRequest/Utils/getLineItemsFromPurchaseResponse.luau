local BulkPurchaseHandleMissingFulfillmentGroupsKey = game:DefineFastFlag("BulkPurchaseHandleMissingFulfillmentGroupsKey", false)

return function(p1)
	-- upvalues: BulkPurchaseHandleMissingFulfillmentGroupsKey (copy)
	return if BulkPurchaseHandleMissingFulfillmentGroupsKey then if p1.fulfillmentGroups and p1.fulfillmentGroups[1] and p1.fulfillmentGroups[1].lineItems then p1.fulfillmentGroups[1].lineItems else {} elseif p1.fulfillmentGroups[1] then p1.fulfillmentGroups[1].lineItems else {}
end