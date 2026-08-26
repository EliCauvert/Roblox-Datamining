local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Store.Types)
local purchasableStateEnumModule = require(bulkPurchaseApp.Enums.PurchasableStateEnum)

return function(p1)
	-- upvalues: purchasableStateEnumModule (ref)
	local t = {}
	
	for i, v in p1 do
		if v.purchasableState == purchasableStateEnumModule.Purchasable then
			table.insert(t, v)
		end
	end
	return t
end