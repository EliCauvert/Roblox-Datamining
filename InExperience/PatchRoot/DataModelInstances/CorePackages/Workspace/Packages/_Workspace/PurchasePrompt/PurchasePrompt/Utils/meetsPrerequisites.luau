local parent = script.Parent.Parent
local playersService = game:GetService("Players")
local workspaceService = game:GetService("Workspace")
local parent_1 = parent.Parent
local constantsModule = require(parent.Misc.Constants)
local purchaseErrorModule = require(parent.Enums.PurchaseError)
local productTypeEnum = require(parent.types).ProductTypeEnum
local fFlagEnableUnifiedPurchaseFlowForDevSubs = require(parent_1.SharedFlags).FFlagEnableUnifiedPurchaseFlowForDevSubs
local getFFlagEnableCreatorStorePurchasingCutoverModule = require(parent.Flags.GetFFlagEnableCreatorStorePurchasingCutover)

return function(p1, p2, p3, p4, p5)
	-- upvalues: constantsModule (ref), purchaseErrorModule (ref), getFFlagEnableCreatorStorePurchasingCutoverModule (ref), playersService (ref), workspaceService (ref), fFlagEnableUnifiedPurchaseFlowForDevSubs (ref), productTypeEnum (ref)
	local var1 = p1.ProductType == constantsModule.ProductType.CollectibleItem
	local var2 = if p1.CollectiblesItemDetails then p1.CollectiblesItemDetails.IsLimited else nil
	
	if var1 then
		if not var2 and p2 then
			return false, purchaseErrorModule.AlreadyOwn
		elseif p5 == nil and not p1.IsForSale and not p1.IsPublicDomain then
			return false, purchaseErrorModule.NotForSale
		elseif getFFlagEnableCreatorStorePurchasingCutoverModule() and p1.IsFiatPriced == true then
			return false, purchaseErrorModule.NotForSale
		elseif p5 == nil and p1.CanBeSoldInThisGame == false then
			return false, purchaseErrorModule.NotForSaleHere
		elseif p5 == nil and (var1 and var2 or (p1.IsLimited or p1.IsLimitedUnique)) and (p1.Remaining == nil or p1.Remaining == 0) then
			return false, purchaseErrorModule.Limited
		elseif p1.MinimumMembershipLevel == Enum.MembershipType.Premium.Value and playersService.LocalPlayer.MembershipType ~= Enum.MembershipType.Premium then
			return false, purchaseErrorModule.PremiumOnly
		elseif p1.ContentRatingTypeId == 1 and playersService.LocalPlayer:GetUnder13() then
			return false, purchaseErrorModule.Under13
		elseif p1.ProductType ~= constantsModule.ProductType.DeveloperProduct and not (fFlagEnableUnifiedPurchaseFlowForDevSubs and p1.ProductType == productTypeEnum.DeveloperSubscription) and (p3 and not (if p4.getLuaUseThirdPartyPermissions() then p4.isThirdPartyPurchaseAllowed() else workspaceService.AllowThirdPartySales)) then
			local var3 = game.CreatorType == Enum.CreatorType.Group
			local var4 = tonumber(p1.Creator.CreatorTargetId)
			
			if var4 == 1 or var3 == (p1.Creator.CreatorType == "Group") and var4 == game.CreatorId then
				return true, nil
			else
				warn(("AllowThirdPartySales has blocked the purchase prompt for %d created by %d. To sell this asset made by a different %s, you will need to enable AllowThirdPartySales."):format(p1.AssetId, var4, if var3 then "group" else "user"))
				
				return false, purchaseErrorModule.ThirdPartyDisabled
			end
		end
	elseif p2 then
		return false, purchaseErrorModule.AlreadyOwn
	end
end