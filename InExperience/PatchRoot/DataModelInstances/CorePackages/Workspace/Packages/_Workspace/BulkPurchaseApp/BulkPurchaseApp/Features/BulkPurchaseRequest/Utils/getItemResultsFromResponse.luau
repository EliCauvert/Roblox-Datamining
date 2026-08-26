local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types)
local filterPurchasableItemsModule = require(script.Parent.filterPurchasableItems)
local getLineItemsFromPurchaseResponseModule = require(script.Parent.getLineItemsFromPurchaseResponse)
local lineItemToStatusModule = require(script.Parent.lineItemToStatus)

return function(p1, p2)
	-- upvalues: filterPurchasableItemsModule (ref), getLineItemsFromPurchaseResponseModule (ref), lineItemToStatusModule (ref)
	local var1 = filterPurchasableItemsModule(p2)
	local var2 = getLineItemsFromPurchaseResponseModule(p1)
	local t = {}
	
	for i, v in var1 do
		local var3 = var2[i]
		
		if var3 then
			t[v.id] = lineItemToStatusModule(var3)
		end
	end
	return t
end