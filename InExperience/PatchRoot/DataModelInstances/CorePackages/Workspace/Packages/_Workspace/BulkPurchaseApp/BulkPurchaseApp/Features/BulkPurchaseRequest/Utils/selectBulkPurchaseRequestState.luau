local bulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(bulkPurchaseApp.Store.Types)
local purchasableStateEnumModule = require(bulkPurchaseApp.Enums.PurchasableStateEnum)
local createPurchasableItemModule = require(script.Parent.createPurchasableItem)
local createOwnedItemModule = require(script.Parent.createOwnedItem)
local createUnpurchasableItemModule = require(script.Parent.createUnpurchasableItem)

return function(p1)
	-- upvalues: purchasableStateEnumModule (ref), createPurchasableItemModule (ref), createOwnedItemModule (ref), createUnpurchasableItemModule (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	if p1.itemData then
		for i, v in p1.itemData do
			if v.purchasableState == purchasableStateEnumModule.Purchasable then
				table.insert(t, createPurchasableItemModule(v))
				
				if v.ownedCount and v.ownedCount > 0 then
					table.insert(t_1, createOwnedItemModule(v))
				end
			else
				table.insert(t_2, createUnpurchasableItemModule(v))
			end
		end
	end
	return {
		totalCost = p1.totalCost or 0,
		items = t,
		ownedItems = t_1,
		unpurchasableItems = t_2,
		balance = p1.balance or 0,
		discountInformation = p1.discountInformation
	}
end