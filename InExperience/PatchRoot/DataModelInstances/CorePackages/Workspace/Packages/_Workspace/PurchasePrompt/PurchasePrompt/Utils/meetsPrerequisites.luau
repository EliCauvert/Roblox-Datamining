local Parent = script.Parent.Parent
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local ConstantsModule = require(Parent.Misc.Constants)
local PurchaseErrorModule = require(Parent.Enums.PurchaseError)
local ProductTypeEnum = require(Parent.types).ProductTypeEnum
local FFlagEnableUnifiedPurchaseFlowForDevSubs = require(Parent.Parent.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local GetFFlagEnableCreatorStorePurchasingCutoverModule = require(Parent.Flags.GetFFlagEnableCreatorStorePurchasingCutover)

return function(p1, p2, p3, p4, p5)
	-- upvalues: ConstantsModule (copy), PurchaseErrorModule (copy), GetFFlagEnableCreatorStorePurchasingCutoverModule (copy), Players (copy), Workspace (copy), FFlagEnableUnifiedPurchaseFlowForDevSubs (copy), ProductTypeEnum (copy)
	local IsProductTypeMatch = p1.ProductType == ConstantsModule.ProductType.CollectibleItem
	local IsLimited = if p1.CollectiblesItemDetails then p1.CollectiblesItemDetails.IsLimited else nil
	
	if IsProductTypeMatch then
		if not IsLimited and p2 then
			return false, PurchaseErrorModule.AlreadyOwn
		end
	elseif p2 then
		return false, PurchaseErrorModule.AlreadyOwn
	end
	if p5 == nil and not p1.IsForSale and not p1.IsPublicDomain then
		return false, PurchaseErrorModule.NotForSale
	end
	if GetFFlagEnableCreatorStorePurchasingCutoverModule() and p1.IsFiatPriced == true then
		return false, PurchaseErrorModule.NotForSale
	end
	if p5 == nil and p1.CanBeSoldInThisGame == false then
		return false, PurchaseErrorModule.NotForSaleHere
	end
	if p5 == nil and (IsProductTypeMatch and IsLimited or (p1.IsLimited or p1.IsLimitedUnique)) and (p1.Remaining == nil or p1.Remaining == 0) then
		return false, PurchaseErrorModule.Limited
	end
	if p1.MinimumMembershipLevel == Enum.MembershipType.Premium.Value and Players.LocalPlayer.MembershipType ~= Enum.MembershipType.Premium then
		return false, PurchaseErrorModule.PremiumOnly
	end
	if p1.ContentRatingTypeId == 1 and Players.LocalPlayer:GetUnder13() then
		return false, PurchaseErrorModule.Under13
	end
	local IsThirdPartyPurchaseAllowed = if p4.getLuaUseThirdPartyPermissions() then p4.isThirdPartyPurchaseAllowed() else Workspace.AllowThirdPartySales
	local IsProductTypeMatch1: boolean = FFlagEnableUnifiedPurchaseFlowForDevSubs and p1.ProductType == ProductTypeEnum.DeveloperSubscription
	
	if p1.ProductType ~= ConstantsModule.ProductType.DeveloperProduct and not IsProductTypeMatch1 and p3 and not IsThirdPartyPurchaseAllowed then
		local IsCreatorTypeMatch = game.CreatorType == Enum.CreatorType.Group
		local IsGroup = p1.Creator.CreatorType == "Group"
		local Number: number? = tonumber(p1.Creator.CreatorTargetId)
		
		if Number ~= 1 and (IsCreatorTypeMatch ~= IsGroup or Number ~= game.CreatorId) then
			warn(("AllowThirdPartySales has blocked the purchase prompt for %d created by %d. To sell this asset made by a different %s, you will need to enable AllowThirdPartySales."):format(p1.AssetId, Number, if IsCreatorTypeMatch then "group" else "user"))
			
			return false, PurchaseErrorModule.ThirdPartyDisabled
		end
	end
	return true, nil
end