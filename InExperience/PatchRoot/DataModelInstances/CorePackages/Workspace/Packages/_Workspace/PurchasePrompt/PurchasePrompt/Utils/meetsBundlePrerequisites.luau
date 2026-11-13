local Parent = script.Parent.Parent
local Players = game:GetService("Players")
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local SaleLocationType = require(Parent.Misc.Constants).SaleLocationType

local function isSoldInUniverse(SaleLocation, Value): boolean
	-- upvalues: SaleLocationType (copy)
	if type(SaleLocation) ~= "table" then
		return true
	end
	local SaleLocationType1 = SaleLocation.saleLocationType
	
	if SaleLocationType1 == SaleLocationType.ShopOnly then
		return false
	elseif SaleLocationType1 == SaleLocationType.ExperiencesById or SaleLocationType1 == SaleLocationType.ShopAndExperiencesById then
		local UniverseIds = SaleLocation.universeIds
		
		return type(UniverseIds) ~= "table" or table.find(UniverseIds, Value) ~= nil
	elseif SaleLocationType1 == SaleLocationType.ExperiencesDevApiOnly then
		local UniverseIds = SaleLocation.universeIds
		
		return type(UniverseIds) ~= "table" or (#UniverseIds == 0 or table.find(UniverseIds, Value) ~= nil)
	else
		return true
	end
end

return function(p1, p2, p3, p4, p5)
	-- upvalues: PurchaseErrorModule (copy), isSoldInUniverse (copy), Players (copy)
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
	local UniverseId = if p5 then p5.universeId else nil
	
	if UniverseId ~= nil and IsNotCollectibleItemIdMatch and not IsNotLowestAvailableResaleProductIdMatch and not isSoldInUniverse(CollectibleItemDetail.saleLocation, UniverseId) then
		return false, PurchaseErrorModule.NotForSaleHere
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