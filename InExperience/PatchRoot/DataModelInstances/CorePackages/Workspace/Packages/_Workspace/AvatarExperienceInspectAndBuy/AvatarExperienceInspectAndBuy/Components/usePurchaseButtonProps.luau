local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local UseConvertedItemDataModule = require(AvatarExperienceInspectAndBuy.Hooks.useConvertedItemData)
local UseItemStatusLocalizationModule = require(AvatarExperienceInspectAndBuy.Hooks.useItemStatusLocalization)
local GetPriceStatusModule = require(AvatarExperienceInspectAndBuy.Utils.getPriceStatus)
local _ = require(AvatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local FoundationModule = require(Parent.Foundation)
local _ = require(AvatarExperienceInspectAndBuy.Types)
local PriceStatusModule = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)
local ItemDetailsUtilsModule = require(AvatarExperienceInspectAndBuy.Utils.itemDetailsUtils)
local IsCollectibleFunction = ItemDetailsUtilsModule.isCollectible
local CalculatePurchaseStatusForItemFunction = ItemDetailsUtilsModule.calculatePurchaseStatusForItem
local GetPriceInRobuxFunction = ItemDetailsUtilsModule.getPriceInRobux
local FormatNumberModule = require(AvatarExperienceInspectAndBuy.Utils.formatNumber)

return function(p1) --[[ Line: 40 | Named "usePurchaseButtonProps" ]]
	-- upvalues: UseConvertedItemDataModule (copy), GetPriceStatusModule (copy), UseItemStatusLocalizationModule (copy), ReactModule (copy), FoundationModule (copy), PriceStatusModule (copy), IsCollectibleFunction (copy), CalculatePurchaseStatusForItemFunction (copy), FormatNumberModule (copy), GetPriceInRobuxFunction (copy)
	local UseConvertedItemDataModuleResult = UseConvertedItemDataModule(p1.selectedItem)
	local PriceStatusModule1 = GetPriceStatusModule(UseConvertedItemDataModuleResult)
	local UseItemStatusLocalizationModuleResult = UseItemStatusLocalizationModule(UseConvertedItemDataModuleResult)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 46 ]]
		-- upvalues: p1 (copy), FoundationModule (upval)
		return {
			showRobuxIcon = false,
			purchaseButtonText = p1.purchaseButtonText,
			onPurchase = p1.onBulkPurchase,
			isDisabled = p1.isDisabled,
			variant = FoundationModule.Enums.ButtonVariant.Emphasis
		}
	end, { p1 })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 57 ]]
		-- upvalues: PriceStatusModule1 (copy), PriceStatusModule (upval), UseItemStatusLocalizationModuleResult (copy), FoundationModule (upval), UseConvertedItemDataModuleResult (copy), IsCollectibleFunction (upval), CalculatePurchaseStatusForItemFunction (upval), p1 (copy)
		local IsPriceStatusModuleMatch: boolean = PriceStatusModule1 == PriceStatusModule.Free or (PriceStatusModule1 == PriceStatusModule.PurchaseFromRoblox or PriceStatusModule1 == PriceStatusModule.PurchaseFromResale)
		
		return {
			purchaseButtonText = UseItemStatusLocalizationModuleResult[PriceStatusModule1],
			isDisabled = not IsPriceStatusModuleMatch,
			variant = if IsPriceStatusModuleMatch then FoundationModule.Enums.ButtonVariant.Emphasis else FoundationModule.Enums.ButtonVariant.Standard,
			onPurchase = function() --[[ Line: 70 ]]
				-- upvalues: UseConvertedItemDataModuleResult (upval), IsCollectibleFunction (upval), CalculatePurchaseStatusForItemFunction (upval), PriceStatusModule1 (upval), p1 (upval)
				if UseConvertedItemDataModuleResult then
					local IsCollectible = IsCollectibleFunction(UseConvertedItemDataModuleResult)
					local PurchaseStatusForItem = CalculatePurchaseStatusForItemFunction(UseConvertedItemDataModuleResult, PriceStatusModule1)
					p1.onPromptPurchase(UseConvertedItemDataModuleResult.id, UseConvertedItemDataModuleResult.itemType, PurchaseStatusForItem.collectibleItemId, PurchaseStatusForItem.collectibleLowestAvailableResaleProductId, PurchaseStatusForItem.collectibleLowestAvailableResaleItemInstanceId, PurchaseStatusForItem.collectibleLowestResalePrice, IsCollectible)
				end
			end
		}
	end, { p1, PriceStatusModule1, UseConvertedItemDataModuleResult })
	
	return if p1.selectedItem then {
		purchaseButtonProps = UseMemoResult1,
		priceLabel = {
			leftLabel = p1.localizedStrings.total or "",
			priceInRobux = FormatNumberModule(GetPriceInRobuxFunction(UseConvertedItemDataModuleResult, PriceStatusModule1))
		},
		priceStatus = PriceStatusModule1
	} else {
		purchaseButtonProps = UseMemoResult,
		priceLabel = {
			leftLabel = p1.localizedStrings.totalItems or "",
			priceInRobux = p1.formattedTotalPrice
		}
	}
end