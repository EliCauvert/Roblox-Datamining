local Players = game:GetService("Players")
local PurchaseErrorModule = require(script.Parent.Parent.Enums.PurchaseError)

return function(p1, p2, p3, p4, _)
	-- upvalues: PurchaseErrorModule (copy), Players (copy)
	local CollectibleItemDetail = p1.collectibleItemDetail
	local IsNotCollectibleItemIdMatch: boolean = CollectibleItemDetail and (CollectibleItemDetail.collectibleItemId ~= nil and CollectibleItemDetail.collectibleItemId ~= "")
	local IsLimited: boolean = CollectibleItemDetail and (CollectibleItemDetail.collectibleItemType ~= nil and CollectibleItemDetail.collectibleItemType == "Limited")
	
	if IsNotCollectibleItemIdMatch then
		if not IsLimited and p4 then
			return false, PurchaseErrorModule.AlreadyOwn
		end
	elseif p4 then
		return false, PurchaseErrorModule.AlreadyOwn
	end
	local IsNotLowestAvailableResaleProductIdMatch: boolean = IsNotCollectibleItemIdMatch and (CollectibleItemDetail.lowestAvailableResaleProductId ~= nil and CollectibleItemDetail.lowestAvailableResaleProductId ~= "")
	
	if not (if IsNotCollectibleItemIdMatch then CollectibleItemDetail.saleStatus == "OnSale" else p1.product and p1.product.isForSale) and not IsNotLowestAvailableResaleProductIdMatch then
		return false, PurchaseErrorModule.NotForSale
	end
	if p3 ~= nil and p2.robux ~= nil and p2.robux < p3 then
		return false, PurchaseErrorModule.NotEnoughRobux
	end
	if p1.itemRestrictions ~= nil then
		for _, itemRestriction in p1.itemRestrictions do
			if itemRestriction == "ThirteenPlus" then
				if not Players.LocalPlayer:GetUnder13() then break end
				return false, PurchaseErrorModule.Under13
			else
				continue
			end
		end
	end
	return true, nil
end