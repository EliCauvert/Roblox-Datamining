local parent = script.Parent.Parent
local playersService = game:GetService("Players")
local workspaceService = game:GetService("Workspace")
local parent_1 = parent.Parent
local constantsModule = require(parent.Misc.Constants)
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local productTypeEnum = require(parent.types).ProductTypeEnum
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent_1.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local getFFlagEnableCreatorStorePurchasingCutoverModule = require(parent.Flags.GetFFlagEnableCreatorStorePurchasingCutover)

return function(p0, p1, p2, p3, p4)
	-- upvalues: constantsModule (ref), purchaseErrorModule (ref), getFFlagEnableCreatorStorePurchasingCutoverModule (ref), playersService (ref), workspaceService (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), productTypeEnum (ref)
	local var5 = p0.ProductType == constantsModule.ProductType.CollectibleItem
	local var6 = if p0.CollectiblesItemDetails then p0.CollectiblesItemDetails.IsLimited else nil
	
	if var5 then
		if not var6 and p1 then
			return false, purchaseErrorModule.AlreadyOwn
		elseif p4 == nil and not p0.IsForSale and not p0.IsPublicDomain then
			return false, purchaseErrorModule.NotForSale
		elseif getFFlagEnableCreatorStorePurchasingCutoverModule() and p0.IsFiatPriced == true then
			return false, purchaseErrorModule.NotForSale
		elseif p4 == nil and p0.CanBeSoldInThisGame == false then
			return false, purchaseErrorModule.NotForSaleHere
		elseif p4 == nil and (var5 and var6 or (p0.IsLimited or p0.IsLimitedUnique)) and (p0.Remaining == nil or p0.Remaining == 0) then
			return false, purchaseErrorModule.Limited
		elseif p0.MinimumMembershipLevel == Enum.MembershipType.Premium.Value and playersService.LocalPlayer.MembershipType ~= Enum.MembershipType.Premium then
			return false, purchaseErrorModule.PremiumOnly
		elseif p0.ContentRatingTypeId == 1 and playersService.LocalPlayer:GetUnder13() then
			return false, purchaseErrorModule.Under13
		elseif p0.ProductType ~= constantsModule.ProductType.DeveloperProduct and not (fFlagEnableUnifiedPurchaseFlowForDevSubs and p0.ProductType == productTypeEnum.DeveloperSubscription) and (p2 and not (if p3.getLuaUseThirdPartyPermissions() then p3.isThirdPartyPurchaseAllowed() else workspaceService.AllowThirdPartySales)) then
			local var7 = game.CreatorType == Enum.CreatorType.Group
			local var8 = tonumber(p0.Creator.CreatorTargetId)
			
			if var8 == 1 or var7 == (p0.Creator.CreatorType == "Group") and var8 == game.CreatorId then
				return true, nil
			else
				warn(("AllowThirdPartySales has blocked the purchase prompt for %d created by %d. To sell this asset made by a different %s, you will need to enable AllowThirdPartySales."):format(p0.AssetId, var8, if var7 then "group" else "user"))
				
				return false, purchaseErrorModule.ThirdPartyDisabled
			end
		end
	elseif p1 then
		return false, purchaseErrorModule.AlreadyOwn
	end
end