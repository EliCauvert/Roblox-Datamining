local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types)
local filterPurchasableItemsModule = require(script.Parent.filterPurchasableItems)
local getLineItemsFromPurchaseResponseModule = require(script.Parent.getLineItemsFromPurchaseResponse)
local lineItemToStatusModule = require(script.Parent.lineItemToStatus)

return function(p0, p1) --[[ line: 32 | named "getItemResultsFromResponse" ]]
	-- upvalues: filterPurchasableItemsModule (ref), getLineItemsFromPurchaseResponseModule (ref), lineItemToStatusModule (ref)
	local var3 = filterPurchasableItemsModule(p1)
	local var4 = getLineItemsFromPurchaseResponseModule(p0)
	local t = {}
	
	for i, v in var3 do
		local var6 = var4[i]
		
		if var6 then
			t[v.id] = lineItemToStatusModule(var6)
		end
	end
	return t
end