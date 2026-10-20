local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local DashModule = require(Parent.Dash)
local BuyActionBar = require(Parent.AvatarExperienceInspectAndBuy).Components.BuyActionBar
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(ProfilePlatform.Common.Types)
local ItemDisplayHelpersModule = require(ProfilePlatform.Components.InspectAvatar.ItemDisplayHelpers)
local CatalogItemRowCardContainerModule = require(ProfilePlatform.Components.InspectAvatar.CatalogItemRowCardContainer)
local RecentActivityPurchaseConfirmationDialogModule = require(script.Parent.RecentActivityPurchaseConfirmationDialog)
local RecentActivityInsufficientRobuxDialogModule = require(script.Parent.RecentActivityInsufficientRobuxDialog)
local Sheet = FoundationModule.Sheet
local View = FoundationModule.View
local Text = FoundationModule.Text
local Skeleton = FoundationModule.Skeleton
local DialogSize = FoundationModule.Enums.DialogSize
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IsItemPurchasableFunction = require(ProfilePlatform.Components.InspectAvatar.InspectAvatarUtils).isItemPurchasable

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ItemDisplayHelpersModule (copy), ReactModule (copy), DashModule (copy), CatalogItemRowCardContainerModule (copy), IsItemPurchasableFunction (copy), Skeleton (copy), Sheet (copy), DialogSize (copy), Text (copy), View (copy), BuyActionBar (copy), ButtonVariant (copy), RecentActivityPurchaseConfirmationDialogModule (copy), RecentActivityInsufficientRobuxDialogModule (copy)
	local FeatureCatalogLabelBuyItems = UseLocalizationFunction({
		title = "Feature.Catalog.Label.BuyItems",
		buyWholeLook = "Feature.Profile.Header.BuyWholeLook",
		bundle = "Feature.Catalog.Label.Bundle",
		buyHeader = {
			"Feature.Profile.Header.InspectAndBuy.BuySection",
			numberOfSelectedItems = p1.purchaseSummary.count,
			totalNumberOfItems = #p1.displayItems
		}
	})
	local UseLocalizationResult = UseLocalizationFunction(ItemDisplayHelpersModule.PRICE_STATUS_LOCALIZATION_KEYS)
	local UseLocalizationResult1 = UseLocalizationFunction(ItemDisplayHelpersModule.ASSET_TYPE_LOCALIZATION_KEYS)
	local UseLocalizationResult2 = UseLocalizationFunction(ItemDisplayHelpersModule.BUNDLE_TYPE_LOCALIZATION_KEYS)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FeatureCatalogLabelBuyItems (copy), DashModule (upval), UseLocalizationResult1 (copy), UseLocalizationResult2 (copy)
		return {
			bundleParts = nil,
			bundle = FeatureCatalogLabelBuyItems.bundle,
			assetTypeNames = DashModule.join(UseLocalizationResult1, UseLocalizationResult2)
		}
	end, {
		FeatureCatalogLabelBuyItems.bundle,
		UseLocalizationResult1,
		UseLocalizationResult2
	})
	local Elements = {}
	
	for Index, displayItem in p1.displayItems do
		local Id = displayItem.id
		Elements[`item_{Id}`] = ReactModule.createElement(CatalogItemRowCardContainerModule, {
			rowHeight = 72,
			asset = displayItem,
			index = Index,
			isChecked = p1.selectedItems[Id] == true,
			isPurchasable = IsItemPurchasableFunction(displayItem),
			localizedStrings = UseMemoResult,
			priceStatusLocalized = UseLocalizationResult,
			onToggleItem = p1.onToggleItem,
			openItemDetails = p1.openItemDetails
		})
	end
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: ReactModule (upval), Skeleton (upval)
		local Elements = {}
		
		for i = 1, 4 do
			Elements[`Shimmer{i}`] = ReactModule.createElement(Skeleton, { Size = UDim2.new(1, 0, 0, 72), LayoutOrder = i })
		end
		return Elements
	end, {})
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		SheetRoot = ReactModule.createElement(Sheet.Root, {
			onClose = p1.onClose,
			snapPoints = { 1 },
			size = DialogSize.Large
		}, {
			Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
				HeaderTitle = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-title-large text-align-x-center",
					Text = FeatureCatalogLabelBuyItems.title
				})
			}),
			Content = ReactModule.createElement(Sheet.Content, nil, {
				ItemList = if p1.isLoading then nil else ReactModule.createElement(View, {
					tag = "col gap-large size-full-0 auto-y padding-bottom-large padding-top-medium"
				}, Elements),
				LoadingShimmer = if p1.isLoading then ReactModule.createElement(View, { tag = "col size-full-0 auto-y" }, UseMemoResult1) else nil
			}),
			Actions = ReactModule.createElement(Sheet.Actions, nil, {
				ActionBar = ReactModule.createElement(View, { tag = "size-full-2500" }, {
					BuyBar = ReactModule.createElement(BuyActionBar, {
						priceLabel = {
							leftLabel = FeatureCatalogLabelBuyItems.buyHeader,
							priceInRobux = tostring(p1.purchaseSummary.totalPrice)
						},
						purchaseButtonProps = {
							purchaseButtonText = FeatureCatalogLabelBuyItems.buyWholeLook,
							onPurchase = p1.onBuyAll,
							isDisabled = p1.isLoading or p1.purchaseSummary.count == 0,
							variant = ButtonVariant.Emphasis
						}
					})
				})
			})
		}),
		PurchaseConfirmation = if p1.isConfirmingPurchase then ReactModule.createElement(RecentActivityPurchaseConfirmationDialogModule, {
			totalPrice = p1.purchaseSummary.totalPrice,
			isPurchasing = p1.isPurchasing,
			onConfirm = p1.onConfirmPurchase,
			onCancel = p1.onCancelPurchase
		}) else nil,
		InsufficientRobux = if p1.isShowingInsufficientRobux then ReactModule.createElement(RecentActivityInsufficientRobuxDialogModule, {
			totalPrice = p1.purchaseSummary.totalPrice,
			robuxBalance = p1.robuxBalance,
			onClose = p1.onDismissInsufficientRobux
		}) else nil
	})
end