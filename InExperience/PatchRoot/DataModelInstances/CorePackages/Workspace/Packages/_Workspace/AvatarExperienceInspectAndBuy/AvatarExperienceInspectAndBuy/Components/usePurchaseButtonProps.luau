local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local useConvertedItemDataModule = require(avatarExperienceInspectAndBuy.Hooks.useConvertedItemData)
local useItemStatusLocalizationModule = require(avatarExperienceInspectAndBuy.Hooks.useItemStatusLocalization)
local getPriceStatusModule = require(avatarExperienceInspectAndBuy.Utils.getPriceStatus)
local _ = require(avatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local foundationModule = require(parent.Foundation)
local _ = require(avatarExperienceInspectAndBuy.Types)
local priceStatusModule = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local itemDetailsUtilsModule = require(avatarExperienceInspectAndBuy.Utils.itemDetailsUtils)
local isCollectible = itemDetailsUtilsModule.isCollectible
local calculatePurchaseStatusForItem = itemDetailsUtilsModule.calculatePurchaseStatusForItem
local getPriceInRobux = itemDetailsUtilsModule.getPriceInRobux
local formatNumberModule = require(avatarExperienceInspectAndBuy.Utils.formatNumber)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXFormatPDPPriceLabel = avatarExperienceFlagsModule.FFlagAXFormatPDPPriceLabel
local fFlagAXHideInspectAndBuyPriceIfUnavailable = avatarExperienceFlagsModule.FFlagAXHideInspectAndBuyPriceIfUnavailable

return function(p0) --[[ line: 43 | named "usePurchaseButtonProps" ]]
	-- upvalues: useConvertedItemDataModule (ref), getPriceStatusModule (ref), useItemStatusLocalizationModule (ref), reactModule (ref), foundationModule (ref), priceStatusModule (ref), isCollectible (ref), calculatePurchaseStatusForItem (ref), fFlagAXFormatPDPPriceLabel (ref), formatNumberModule (ref), getPriceInRobux (ref), fFlagAXHideInspectAndBuyPriceIfUnavailable (ref)
	local var10 = useConvertedItemDataModule(p0.selectedItem)
	local var11 = getPriceStatusModule(var10)
	local var12 = useItemStatusLocalizationModule(var10)
	
	return if p0.selectedItem then {
		purchaseButtonProps = reactModule.useMemo(function() --[[ line: 60 ]]
			-- upvalues: var11 (ref), priceStatusModule (copy), var12 (ref), foundationModule (copy), var10 (ref), isCollectible (copy), calculatePurchaseStatusForItem (copy), p0 (ref)
			local var13 = if var11 ~= priceStatusModule.Free then if var11 ~= priceStatusModule.PurchaseFromRoblox then var11 == priceStatusModule.PurchaseFromResale else true else true
			
			return {
				purchaseButtonText = var12[var11],
				isDisabled = not var13,
				variant = if not var13 then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Emphasis,
				onPurchase = function() --[[ line: 73 ]]
					-- upvalues: var10 (copy), isCollectible (copy), calculatePurchaseStatusForItem (copy), var11 (copy), p0 (copy)
					if var10 then
						local var14 = calculatePurchaseStatusForItem(var10, var11)
						p0.onPromptPurchase(var10.id, var10.itemType, var14.collectibleItemId, var14.collectibleLowestAvailableResaleProductId, var14.collectibleLowestAvailableResaleItemInstanceId, var14.collectibleLowestResalePrice, isCollectible(var10))
					end
				end
			}
		end, { p0, var11, var10 }),
		priceLabel = {
			leftLabel = p0.localizedStrings.total or "",
			priceInRobux = if fFlagAXFormatPDPPriceLabel then formatNumberModule(getPriceInRobux(var10, var11)) else tostring(getPriceInRobux(var10, var11))
		},
		priceStatus = if fFlagAXHideInspectAndBuyPriceIfUnavailable then var11 else nil
	} else {
		purchaseButtonProps = reactModule.useMemo(function() --[[ line: 49 ]]
			-- upvalues: p0 (ref), foundationModule (copy)
			return {
				showRobuxIcon = false,
				purchaseButtonText = p0.purchaseButtonText,
				onPurchase = p0.onBulkPurchase,
				isDisabled = p0.isDisabled,
				variant = foundationModule.Enums.ButtonVariant.Emphasis
			}
		end, { p0 }),
		priceLabel = {
			leftLabel = p0.localizedStrings.totalItems or "",
			priceInRobux = p0.formattedTotalPrice
		}
	}
end