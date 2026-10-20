local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local ReactModule = require(ProfilePlatform.Parent.React)
local EnumsModule = require(ProfilePlatform.Common.Enums)
local _ = require(ProfilePlatform.Common.Types)
local UseInspectAvatarDataModule = require(ProfilePlatform.Components.InspectAvatar.useInspectAvatarData)
local UseRecentActivityPurchaseModule = require(script.Parent.useRecentActivityPurchase)

return function(p1)
	-- upvalues: ReactModule (copy), EnumsModule (copy), UseInspectAvatarDataModule (copy), UseRecentActivityPurchaseModule (copy)
	local AssetIds = p1.assetIds
	local UseInspectAvatarDataModuleResult = UseInspectAvatarDataModule((ReactModule.useMemo(function()
		-- upvalues: AssetIds (copy), EnumsModule (upval)
		local List = {}
		
		for _, assetId in AssetIds do
			table.insert(List, {
				assetId = assetId,
				itemType = EnumsModule.ItemTypes.Asset
			})
		end
		return List
	end, { AssetIds })))
	local DisplayItems = UseInspectAvatarDataModuleResult.displayItems
	local UseRecentActivityPurchaseModuleResult = UseRecentActivityPurchaseModule({
		displayItems = DisplayItems,
		localUserId = UseInspectAvatarDataModuleResult.localUserId,
		onClose = p1.onClose
	})
	
	return {
		displayItems = DisplayItems,
		selectedItems = UseRecentActivityPurchaseModuleResult.selectedItems,
		isLoading = UseInspectAvatarDataModuleResult.isLoading,
		purchaseSummary = UseRecentActivityPurchaseModuleResult.purchaseSummary,
		isPurchasing = UseRecentActivityPurchaseModuleResult.isPurchasing,
		isConfirmingPurchase = UseRecentActivityPurchaseModuleResult.isConfirmingPurchase,
		isShowingInsufficientRobux = UseRecentActivityPurchaseModuleResult.isShowingInsufficientRobux,
		robuxBalance = UseRecentActivityPurchaseModuleResult.robuxBalance,
		onToggleItem = UseRecentActivityPurchaseModuleResult.onToggleItem,
		onBuyAll = UseRecentActivityPurchaseModuleResult.onBuyAll,
		onConfirmPurchase = UseRecentActivityPurchaseModuleResult.onConfirmPurchase,
		onCancelPurchase = UseRecentActivityPurchaseModuleResult.onCancelPurchase,
		onDismissInsufficientRobux = UseRecentActivityPurchaseModuleResult.onDismissInsufficientRobux,
		onClose = p1.onClose,
		openItemDetails = ReactModule.useCallback(function(_, _, _) end, {})
	}
end