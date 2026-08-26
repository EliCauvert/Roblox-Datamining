local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local dashModule = require(parent.Dash)
local buyActionBar = require(parent.AvatarExperienceInspectAndBuy).Components.BuyActionBar
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(profilePlatform.Common.Types)
local inspectAvatarUtilsModule = require(profilePlatform.Components.InspectAvatar.InspectAvatarUtils)
local itemDisplayHelpersModule = require(profilePlatform.Components.InspectAvatar.ItemDisplayHelpers)
local catalogItemRowCardContainerModule = require(profilePlatform.Components.InspectAvatar.CatalogItemRowCardContainer)
local recentActivityPurchaseConfirmationDialogModule = require(script.Parent.RecentActivityPurchaseConfirmationDialog)
local recentActivityInsufficientRobuxDialogModule = require(script.Parent.RecentActivityInsufficientRobuxDialog)
local sheet = foundationModule.Sheet
local view = foundationModule.View
local text = foundationModule.Text
local skeleton = foundationModule.Skeleton
local dialogSize = foundationModule.Enums.DialogSize
local buttonVariant = foundationModule.Enums.ButtonVariant
local isItemPurchasable = inspectAvatarUtilsModule.isItemPurchasable

return function(p1)
	-- upvalues: useLocalization (ref), itemDisplayHelpersModule (ref), reactModule (ref), dashModule (ref), catalogItemRowCardContainerModule (ref), isItemPurchasable (ref), skeleton (ref), sheet (ref), dialogSize (ref), text (ref), view (ref), buyActionBar (ref), buttonVariant (ref), recentActivityPurchaseConfirmationDialogModule (ref), recentActivityInsufficientRobuxDialogModule (ref)
	local var1 = useLocalization({
		title = "Feature.Catalog.Label.BuyItems",
		buyWholeLook = "Feature.Profile.Header.BuyWholeLook",
		bundle = "Feature.Catalog.Label.Bundle",
		buyHeader = {
			"Feature.Profile.Header.InspectAndBuy.BuySection",
			numberOfSelectedItems = p1.purchaseSummary.count,
			totalNumberOfItems = #p1.displayItems
		}
	})
	local var2 = useLocalization(itemDisplayHelpersModule.PRICE_STATUS_LOCALIZATION_KEYS)
	local var3 = useLocalization(itemDisplayHelpersModule.ASSET_TYPE_LOCALIZATION_KEYS)
	local var4 = useLocalization(itemDisplayHelpersModule.BUNDLE_TYPE_LOCALIZATION_KEYS)
	local var5 = reactModule.useMemo(function()
		-- upvalues: var1 (ref), dashModule (copy), var3 (ref), var4 (ref)
		return {
			bundleParts = nil,
			bundle = var1.bundle,
			assetTypeNames = dashModule.join(var3, var4)
		}
	end, { var1.bundle, var3, var4 })
	local t = {}
	
	for i, v in p1.displayItems do
		local id = v.id
		t[`item_{id}`] = reactModule.createElement(catalogItemRowCardContainerModule, {
			rowHeight = 72,
			asset = v,
			index = i,
			isChecked = p1.selectedItems[id] == true,
			isPurchasable = isItemPurchasable(v),
			localizedStrings = var5,
			priceStatusLocalized = var2,
			onToggleItem = p1.onToggleItem,
			openItemDetails = p1.openItemDetails
		})
	end
	return reactModule.createElement(reactModule.Fragment, nil, {
		SheetRoot = reactModule.createElement(sheet.Root, {
			onClose = p1.onClose,
			snapPoints = { 1 },
			size = dialogSize.Large
		}, {
			Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
				HeaderTitle = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-title-large text-align-x-center",
					Text = var1.title
				})
			}),
			Content = reactModule.createElement(sheet.Content, nil, {
				ItemList = if not p1.isLoading then reactModule.createElement(view, {
					tag = "col gap-large size-full-0 auto-y padding-bottom-large padding-top-medium"
				}, t) else nil,
				LoadingShimmer = if p1.isLoading then reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, reactModule.useMemo(function()
					-- upvalues: reactModule (copy), skeleton (copy)
					local t = {}
					
					for i = 1, 4 do
						t[`Shimmer{i}`] = reactModule.createElement(skeleton, { Size = UDim2.new(1, 0, 0, 72), LayoutOrder = i })
					end
					return t
				end, {})) else nil
			}),
			Actions = reactModule.createElement(sheet.Actions, nil, {
				ActionBar = reactModule.createElement(view, { tag = "size-full-2500" }, {
					BuyBar = reactModule.createElement(buyActionBar, {
						priceLabel = {
							leftLabel = var1.buyHeader,
							priceInRobux = tostring(p1.purchaseSummary.totalPrice)
						},
						purchaseButtonProps = {
							purchaseButtonText = var1.buyWholeLook,
							onPurchase = p1.onBuyAll,
							isDisabled = p1.isLoading or p1.purchaseSummary.count == 0,
							variant = buttonVariant.Emphasis
						}
					})
				})
			})
		}),
		PurchaseConfirmation = if p1.isConfirmingPurchase then reactModule.createElement(recentActivityPurchaseConfirmationDialogModule, {
			totalPrice = p1.purchaseSummary.totalPrice,
			isPurchasing = p1.isPurchasing,
			onConfirm = p1.onConfirmPurchase,
			onCancel = p1.onCancelPurchase
		}) else nil,
		InsufficientRobux = if p1.isShowingInsufficientRobux then reactModule.createElement(recentActivityInsufficientRobuxDialogModule, {
			totalPrice = p1.purchaseSummary.totalPrice,
			robuxBalance = p1.robuxBalance,
			onClose = p1.onDismissInsufficientRobux
		}) else nil
	})
end