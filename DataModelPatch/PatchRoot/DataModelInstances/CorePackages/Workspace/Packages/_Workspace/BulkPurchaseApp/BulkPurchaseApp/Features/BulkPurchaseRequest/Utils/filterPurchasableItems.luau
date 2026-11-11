local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(BulkPurchaseApp.Store.Types)
local PurchasableStateEnumModule = require(BulkPurchaseApp.Enums.PurchasableStateEnum)

return function(List)
	-- upvalues: PurchasableStateEnumModule (copy)
	local List1 = {}
	
	for _, value in List do
		if value.purchasableState == PurchasableStateEnumModule.Purchasable then
			table.insert(List1, value)
		end
	end
	return List1
end