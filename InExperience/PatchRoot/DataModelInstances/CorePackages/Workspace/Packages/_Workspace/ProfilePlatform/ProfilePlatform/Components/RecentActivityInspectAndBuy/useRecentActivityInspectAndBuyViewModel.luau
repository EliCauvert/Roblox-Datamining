local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local reactModule = require(profilePlatform.Parent.React)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Common.Types)
local useInspectAvatarDataModule = require(profilePlatform.Components.InspectAvatar.useInspectAvatarData)
local useRecentActivityPurchaseModule = require(script.Parent.useRecentActivityPurchase)

return function(p1)
	-- upvalues: reactModule (ref), enumsModule (ref), useInspectAvatarDataModule (ref), useRecentActivityPurchaseModule (ref)
	local assetIds = p1.assetIds
	local var1 = useInspectAvatarDataModule(reactModule.useMemo(function()
		-- upvalues: assetIds (ref), enumsModule (copy)
		local t = {}
		
		for i, v in assetIds do
			table.insert(t, { assetId = v, itemType = enumsModule.ItemTypes.Asset })
		end
		return t
	end, { assetIds }))
	local displayItems = var1.displayItems
	local var2 = useRecentActivityPurchaseModule({
		displayItems = displayItems,
		localUserId = var1.localUserId,
		onClose = p1.onClose
	})
	
	return {
		displayItems = displayItems,
		selectedItems = var2.selectedItems,
		isLoading = var1.isLoading,
		purchaseSummary = var2.purchaseSummary,
		isPurchasing = var2.isPurchasing,
		isConfirmingPurchase = var2.isConfirmingPurchase,
		isShowingInsufficientRobux = var2.isShowingInsufficientRobux,
		robuxBalance = var2.robuxBalance,
		onToggleItem = var2.onToggleItem,
		onBuyAll = var2.onBuyAll,
		onConfirmPurchase = var2.onConfirmPurchase,
		onCancelPurchase = var2.onCancelPurchase,
		onDismissInsufficientRobux = var2.onDismissInsufficientRobux,
		onClose = p1.onClose,
		openItemDetails = reactModule.useCallback(function(_, _, _) end, {})
	}
end