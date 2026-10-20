local _ = require(script:FindFirstAncestor("BulkPurchaseApp").Store.Types)
local FilterPurchasableItemsModule = require(script.Parent.filterPurchasableItems)
local GetLineItemsFromPurchaseResponseModule = require(script.Parent.getLineItemsFromPurchaseResponse)
local LineItemToStatusModule = require(script.Parent.lineItemToStatus)

return function(p1, p2)
	-- upvalues: FilterPurchasableItemsModule (copy), GetLineItemsFromPurchaseResponseModule (copy), LineItemToStatusModule (copy)
	local FilterPurchasableItemsModuleResult = FilterPurchasableItemsModule(p2)
	local LineItemsFromPurchaseResponseModule = GetLineItemsFromPurchaseResponseModule(p1)
	local t = {}
	
	for i, value in FilterPurchasableItemsModuleResult do
		local LineItemsFromPurchaseResponseModuleEntry = LineItemsFromPurchaseResponseModule[i]
		
		if LineItemsFromPurchaseResponseModuleEntry then
			t[value.id] = LineItemToStatusModule(LineItemsFromPurchaseResponseModuleEntry)
		end
	end
	return t
end