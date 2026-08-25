local bulkPurchaseHandleMissingFulfillmentGroupsKey = game:DefineFastFlag("BulkPurchaseHandleMissingFulfillmentGroupsKey", false)

return function(p0)
	-- upvalues: bulkPurchaseHandleMissingFulfillmentGroupsKey (ref)
	return if bulkPurchaseHandleMissingFulfillmentGroupsKey then if p0.fulfillmentGroups and p0.fulfillmentGroups[1] and p0.fulfillmentGroups[1].lineItems then p0.fulfillmentGroups[1].lineItems else {} elseif p0.fulfillmentGroups[1] then p0.fulfillmentGroups[1].lineItems else {}
end