local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Store.Types)
local purchasableStateEnumModule = require(bulkPurchaseApp.Enums.PurchasableStateEnum)

return function(p0) --[[ line: 8 | named "filterPurchasableItems" ]]
	-- upvalues: purchasableStateEnumModule (ref)
	local t = {}
	
	for i, v in p0 do
		if v.purchasableState == purchasableStateEnumModule.Purchasable then
			table.insert(t, v)
		end
	end
	return t
end