local playersService = game:GetService("Players")
local purchaseErrorModule = require(script.Parent.Parent.Enums.PurchaseError)

return function(p1, p2, p3, p4, _)
	-- upvalues: purchaseErrorModule (ref), playersService (ref)
	local collectibleItemDetail = p1.collectibleItemDetail
	local var1 = collectibleItemDetail and (collectibleItemDetail.collectibleItemId ~= nil and collectibleItemDetail.collectibleItemId ~= "")
	local var2 = collectibleItemDetail and (collectibleItemDetail.collectibleItemType ~= nil and collectibleItemDetail.collectibleItemType == "Limited")
	
	if var1 then
		if not var2 and p4 then
			return false, purchaseErrorModule.AlreadyOwn
		end
	elseif p4 then
		return false, purchaseErrorModule.AlreadyOwn
	end
	local var3
	local _ = nil
	
	if var1 then
		local _ = collectibleItemDetail.saleStatus == "OnSale"
	else
		var3 = p1.product and p1.product.isForSale
	end
	if not var3 and not (var1 and (collectibleItemDetail.lowestAvailableResaleProductId ~= nil and collectibleItemDetail.lowestAvailableResaleProductId ~= "")) then
		return false, purchaseErrorModule.NotForSale
	elseif p3 ~= nil and p2.robux ~= nil and p2.robux < p3 then
		return false, purchaseErrorModule.NotEnoughRobux
	elseif p1.itemRestrictions ~= nil then
		for i, v in p1.itemRestrictions do
			if v == "ThirteenPlus" then
				if not playersService.LocalPlayer:GetUnder13() then break end
				return false, purchaseErrorModule.Under13
			end
		end
	end
	return true, nil
end