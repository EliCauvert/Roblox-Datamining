local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local reactModule = require(profilePlatform.Parent.React)
local enumsModule = require(profilePlatform.Common.Enums)
local _ = require(profilePlatform.Common.Types)
local useInspectAvatarDataModule = require(profilePlatform.Components.InspectAvatar.useInspectAvatarData)
local useRecentActivityPurchaseModule = require(script.Parent.useRecentActivityPurchase)

return function(p0)
	-- upvalues: reactModule (ref), enumsModule (ref), useInspectAvatarDataModule (ref), useRecentActivityPurchaseModule (ref)
	local assetIds = p0.assetIds
	local var5 = useInspectAvatarDataModule(reactModule.useMemo(function()
		-- upvalues: assetIds (ref), enumsModule (copy)
		local t = {}
		
		for i, v in assetIds do
			table.insert(t, { assetId = v, itemType = enumsModule.ItemTypes.Asset })
		end
		return t
	end, { assetIds }))
	local displayItems = var5.displayItems
	local var6 = useRecentActivityPurchaseModule({
		displayItems = displayItems,
		localUserId = var5.localUserId,
		onClose = p0.onClose
	})
	
	return {
		displayItems = displayItems,
		selectedItems = var6.selectedItems,
		isLoading = var5.isLoading,
		purchaseSummary = var6.purchaseSummary,
		isPurchasing = var6.isPurchasing,
		isConfirmingPurchase = var6.isConfirmingPurchase,
		isShowingInsufficientRobux = var6.isShowingInsufficientRobux,
		robuxBalance = var6.robuxBalance,
		onToggleItem = var6.onToggleItem,
		onBuyAll = var6.onBuyAll,
		onConfirmPurchase = var6.onConfirmPurchase,
		onCancelPurchase = var6.onCancelPurchase,
		onDismissInsufficientRobux = var6.onDismissInsufficientRobux,
		onClose = p0.onClose,
		openItemDetails = reactModule.useCallback(function(_, _, _) end, {})
	}
end