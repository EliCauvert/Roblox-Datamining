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

return function(p0) --[[ line: 40 | named "usePurchaseButtonProps" ]]
	-- upvalues: useConvertedItemDataModule (ref), getPriceStatusModule (ref), useItemStatusLocalizationModule (ref), reactModule (ref), foundationModule (ref), priceStatusModule (ref), isCollectible (ref), calculatePurchaseStatusForItem (ref), formatNumberModule (ref), getPriceInRobux (ref)
	local var9 = useConvertedItemDataModule(p0.selectedItem)
	local var10 = getPriceStatusModule(var9)
	local var11 = useItemStatusLocalizationModule(var9)
	
	return if p0.selectedItem then {
		purchaseButtonProps = reactModule.useMemo(function() --[[ line: 57 ]]
			-- upvalues: var10 (ref), priceStatusModule (copy), var11 (ref), foundationModule (copy), var9 (ref), isCollectible (copy), calculatePurchaseStatusForItem (copy), p0 (ref)
			local var12 = if var10 ~= priceStatusModule.Free then if var10 ~= priceStatusModule.PurchaseFromRoblox then var10 == priceStatusModule.PurchaseFromResale else true else true
			
			return {
				purchaseButtonText = var11[var10],
				isDisabled = not var12,
				variant = if not var12 then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Emphasis,
				onPurchase = function() --[[ line: 70 ]]
					-- upvalues: var9 (copy), isCollectible (copy), calculatePurchaseStatusForItem (copy), var10 (copy), p0 (copy)
					if var9 then
						local var13 = calculatePurchaseStatusForItem(var9, var10)
						p0.onPromptPurchase(var9.id, var9.itemType, var13.collectibleItemId, var13.collectibleLowestAvailableResaleProductId, var13.collectibleLowestAvailableResaleItemInstanceId, var13.collectibleLowestResalePrice, isCollectible(var9))
					end
				end
			}
		end, { p0, var10, var9 }),
		priceLabel = {
			leftLabel = p0.localizedStrings.total or "",
			priceInRobux = formatNumberModule(getPriceInRobux(var9, var10))
		},
		priceStatus = var10
	} else {
		purchaseButtonProps = reactModule.useMemo(function() --[[ line: 46 ]]
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