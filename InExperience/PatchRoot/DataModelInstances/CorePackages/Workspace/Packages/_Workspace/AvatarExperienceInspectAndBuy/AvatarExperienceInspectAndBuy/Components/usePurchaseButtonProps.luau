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

return function(p1)
	-- upvalues: useConvertedItemDataModule (ref), getPriceStatusModule (ref), useItemStatusLocalizationModule (ref), reactModule (ref), foundationModule (ref), priceStatusModule (ref), isCollectible (ref), calculatePurchaseStatusForItem (ref), formatNumberModule (ref), getPriceInRobux (ref)
	local var1 = useConvertedItemDataModule(p1.selectedItem)
	local var2 = getPriceStatusModule(var1)
	local var3 = useItemStatusLocalizationModule(var1)
	
	return if p1.selectedItem then {
		purchaseButtonProps = reactModule.useMemo(function()
			-- upvalues: var2 (ref), priceStatusModule (copy), var3 (ref), foundationModule (copy), var1 (ref), isCollectible (copy), calculatePurchaseStatusForItem (copy), p1 (ref)
			local var4 = if var2 ~= priceStatusModule.Free then if var2 ~= priceStatusModule.PurchaseFromRoblox then var2 == priceStatusModule.PurchaseFromResale else true else true
			
			return {
				purchaseButtonText = var3[var2],
				isDisabled = not var4,
				variant = if not var4 then foundationModule.Enums.ButtonVariant.Standard else foundationModule.Enums.ButtonVariant.Emphasis,
				onPurchase = function()
					-- upvalues: var1 (copy), isCollectible (copy), calculatePurchaseStatusForItem (copy), var2 (copy), p1 (copy)
					if var1 then
						local var5 = calculatePurchaseStatusForItem(var1, var2)
						p1.onPromptPurchase(var1.id, var1.itemType, var5.collectibleItemId, var5.collectibleLowestAvailableResaleProductId, var5.collectibleLowestAvailableResaleItemInstanceId, var5.collectibleLowestResalePrice, isCollectible(var1))
					end
				end
			}
		end, { p1, var2, var1 }),
		priceLabel = {
			leftLabel = p1.localizedStrings.total or "",
			priceInRobux = formatNumberModule(getPriceInRobux(var1, var2))
		},
		priceStatus = var2
	} else {
		purchaseButtonProps = reactModule.useMemo(function()
			-- upvalues: p1 (ref), foundationModule (copy)
			return {
				showRobuxIcon = false,
				purchaseButtonText = p1.purchaseButtonText,
				onPurchase = p1.onBulkPurchase,
				isDisabled = p1.isDisabled,
				variant = foundationModule.Enums.ButtonVariant.Emphasis
			}
		end, { p1 }),
		priceLabel = {
			leftLabel = p1.localizedStrings.totalItems or "",
			priceInRobux = p1.formattedTotalPrice
		}
	}
end