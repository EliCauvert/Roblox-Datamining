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

return function(p0) --[[ line: 53 | named "RecentActivityInspectAndBuyView" ]]
	-- upvalues: useLocalization (ref), itemDisplayHelpersModule (ref), reactModule (ref), dashModule (ref), catalogItemRowCardContainerModule (ref), isItemPurchasable (ref), skeleton (ref), sheet (ref), dialogSize (ref), text (ref), view (ref), buyActionBar (ref), buttonVariant (ref), recentActivityPurchaseConfirmationDialogModule (ref), recentActivityInsufficientRobuxDialogModule (ref)
	local var9 = useLocalization({
		title = "Feature.Catalog.Label.BuyItems",
		buyWholeLook = "Feature.Profile.Header.BuyWholeLook",
		bundle = "Feature.Catalog.Label.Bundle",
		buyHeader = {
			"Feature.Profile.Header.InspectAndBuy.BuySection",
			numberOfSelectedItems = p0.purchaseSummary.count,
			totalNumberOfItems = #p0.displayItems
		}
	})
	local var10 = useLocalization(itemDisplayHelpersModule.PRICE_STATUS_LOCALIZATION_KEYS)
	local var11 = useLocalization(itemDisplayHelpersModule.ASSET_TYPE_LOCALIZATION_KEYS)
	local var12 = useLocalization(itemDisplayHelpersModule.BUNDLE_TYPE_LOCALIZATION_KEYS)
	local var13 = reactModule.useMemo(function() --[[ line: 69 ]]
		-- upvalues: var9 (ref), dashModule (copy), var11 (ref), var12 (ref)
		return {
			bundleParts = nil,
			bundle = var9.bundle,
			assetTypeNames = dashModule.join(var11, var12)
		}
	end, { var9.bundle, var11, var12 })
	local t = {}
	
	for i, v in p0.displayItems do
		local id = v.id
		t[`item_{id}`] = reactModule.createElement(catalogItemRowCardContainerModule, {
			rowHeight = 72,
			asset = v,
			index = i,
			isChecked = p0.selectedItems[id] == true,
			isPurchasable = isItemPurchasable(v),
			localizedStrings = var13,
			priceStatusLocalized = var10,
			onToggleItem = p0.onToggleItem,
			openItemDetails = p0.openItemDetails
		})
	end
	return reactModule.createElement(reactModule.Fragment, nil, {
		SheetRoot = reactModule.createElement(sheet.Root, {
			onClose = p0.onClose,
			snapPoints = { 1 },
			size = dialogSize.Large
		}, {
			Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
				HeaderTitle = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-title-large text-align-x-center",
					Text = var9.title
				})
			}),
			Content = reactModule.createElement(sheet.Content, nil, {
				ItemList = if not p0.isLoading then reactModule.createElement(view, {
					tag = "col gap-large size-full-0 auto-y padding-bottom-large padding-top-medium"
				}, t) else nil,
				LoadingShimmer = if p0.isLoading then reactModule.createElement(view, { tag = "col size-full-0 auto-y" }, reactModule.useMemo(function() --[[ line: 93 ]]
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
							leftLabel = var9.buyHeader,
							priceInRobux = tostring(p0.purchaseSummary.totalPrice)
						},
						purchaseButtonProps = {
							purchaseButtonText = var9.buyWholeLook,
							onPurchase = p0.onBuyAll,
							isDisabled = p0.isLoading or p0.purchaseSummary.count == 0,
							variant = buttonVariant.Emphasis
						}
					})
				})
			})
		}),
		PurchaseConfirmation = if p0.isConfirmingPurchase then reactModule.createElement(recentActivityPurchaseConfirmationDialogModule, {
			totalPrice = p0.purchaseSummary.totalPrice,
			isPurchasing = p0.isPurchasing,
			onConfirm = p0.onConfirmPurchase,
			onCancel = p0.onCancelPurchase
		}) else nil,
		InsufficientRobux = if p0.isShowingInsufficientRobux then reactModule.createElement(recentActivityInsufficientRobuxDialogModule, {
			totalPrice = p0.purchaseSummary.totalPrice,
			robuxBalance = p0.robuxBalance,
			onClose = p0.onDismissInsufficientRobux
		}) else nil
	})
end