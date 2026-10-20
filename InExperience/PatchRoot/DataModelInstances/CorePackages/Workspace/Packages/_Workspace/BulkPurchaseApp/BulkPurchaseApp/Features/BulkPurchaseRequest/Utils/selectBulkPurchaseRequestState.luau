local BulkPurchaseApp = script:FindFirstAncestor("BulkPurchaseApp")
local _ = require(BulkPurchaseApp.Store.Types)
local PurchasableStateEnumModule = require(BulkPurchaseApp.Enums.PurchasableStateEnum)
local CreatePurchasableItemModule = require(script.Parent.createPurchasableItem)
local CreateOwnedItemModule = require(script.Parent.createOwnedItem)
local CreateUnpurchasableItemModule = require(script.Parent.createUnpurchasableItem)
local FFlagAXAddPlusUpsellToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddPlusUpsellToBulkPurchase)
local FFlagAXAddOffersToBulkPurchaseModule = require(BulkPurchaseApp.Flags.FFlagAXAddOffersToBulkPurchase)

return function(p1)
	-- upvalues: PurchasableStateEnumModule (copy), CreatePurchasableItemModule (copy), CreateOwnedItemModule (copy), CreateUnpurchasableItemModule (copy), FFlagAXAddOffersToBulkPurchaseModule (copy), FFlagAXAddPlusUpsellToBulkPurchaseModule (copy)
	local Items = {}
	local OwnedItems = {}
	local UnpurchasableItems = {}
	
	if p1.itemData then
		for _, value in p1.itemData do
			if value.purchasableState == PurchasableStateEnumModule.Purchasable then
				table.insert(Items, CreatePurchasableItemModule(value))
				
				if value.ownedCount and value.ownedCount > 0 then
					table.insert(OwnedItems, CreateOwnedItemModule(value))
				end
			else
				table.insert(UnpurchasableItems, CreateUnpurchasableItemModule(value))
			end
		end
	end
	return {
		totalCost = p1.totalCost or 0,
		items = Items,
		ownedItems = OwnedItems,
		unpurchasableItems = UnpurchasableItems,
		balance = p1.balance or 0,
		discountInformation = p1.discountInformation,
		offerData = if FFlagAXAddOffersToBulkPurchaseModule then p1.offerData else nil,
		disablePurchase = if FFlagAXAddPlusUpsellToBulkPurchaseModule then p1.disablePurchase else nil
	}
end