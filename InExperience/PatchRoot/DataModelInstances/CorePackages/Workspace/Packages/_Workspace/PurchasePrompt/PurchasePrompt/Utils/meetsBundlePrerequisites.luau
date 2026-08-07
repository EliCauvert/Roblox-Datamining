local playersService = game:GetService("Players")
local purchaseErrorModule = require(script.Parent.Parent.Enums.PurchaseError)

return function(p0, p1, p2, p3, _) --[[ line: 10 | named "meetsBundlePrerequisites" ]]
	-- upvalues: purchaseErrorModule (ref), playersService (ref)
	local collectibleItemDetail = p0.collectibleItemDetail
	local var2 = collectibleItemDetail and (collectibleItemDetail.collectibleItemId ~= nil and collectibleItemDetail.collectibleItemId ~= "")
	local var3 = collectibleItemDetail and (collectibleItemDetail.collectibleItemType ~= nil and collectibleItemDetail.collectibleItemType == "Limited")
	
	if var2 then
		if not var3 and p3 then
			return false, purchaseErrorModule.AlreadyOwn
		end
	elseif p3 then
		return false, purchaseErrorModule.AlreadyOwn
	end
	local var4
	local _ = nil
	
	if var2 then
		local _ = collectibleItemDetail.saleStatus == "OnSale"
	else
		var4 = p0.product and p0.product.isForSale
	end
	if not var4 and not (var2 and (collectibleItemDetail.lowestAvailableResaleProductId ~= nil and collectibleItemDetail.lowestAvailableResaleProductId ~= "")) then
		return false, purchaseErrorModule.NotForSale
	elseif p2 ~= nil and p1.robux ~= nil and p1.robux < p2 then
		return false, purchaseErrorModule.NotEnoughRobux
	elseif p0.itemRestrictions ~= nil then
		for i, v in p0.itemRestrictions do
			if v == "ThirteenPlus" then
				if not playersService.LocalPlayer:GetUnder13() then break end
				return false, purchaseErrorModule.Under13
			end
		end
	end
	return true, nil
end