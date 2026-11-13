local AvatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local LocalizationService = game:GetService("LocalizationService")
local Parent = AvatarExperienceInspectAndBuy.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local BundleAssetsListModule = require(AvatarExperienceInspectAndBuy.Components.ItemDetails.BundleAssetsList)
local Enums = FoundationModule.Enums
local ItemHeaderModule = require(AvatarExperienceInspectAndBuy.Components.Common.ItemHeader)
local UseConvertedItemDataModule = require(AvatarExperienceInspectAndBuy.Hooks.useConvertedItemData)
local UseItemExperienceInfoModule = require(AvatarExperienceInspectAndBuy.Hooks.useItemExperienceInfo)
local ControlBarModule = require(AvatarExperienceInspectAndBuy.Components.ItemDetails.ControlBar)
local ResellableInstancesLabelModule = require(AvatarExperienceInspectAndBuy.Components.ItemDetails.ResellableInstancesLabel)
local ItemInfoLabelsModule = require(AvatarExperienceInspectAndBuy.Components.ItemDetails.ItemInfoLabels)
local NumberLocalization = require(Parent.Localization).NumberLocalization
local UseItemStatusLocalizationModule = require(AvatarExperienceInspectAndBuy.Hooks.useItemStatusLocalization)
local ItemDetailsUtilsModule = require(AvatarExperienceInspectAndBuy.Utils.itemDetailsUtils)
local IsCollectibleFunction = ItemDetailsUtilsModule.isCollectible
local IsInExperienceCreationPlayableFunction = ItemDetailsUtilsModule.isInExperienceCreationPlayable
local IsTradeableFunction = ItemDetailsUtilsModule.isTradeable
local GetCreatorNameFunction = ItemDetailsUtilsModule.getCreatorName
local GetOriginalPriceFunction = ItemDetailsUtilsModule.getOriginalPrice
local GetQuantitySoldFunction = ItemDetailsUtilsModule.getQuantitySold
local ViewportLayoutModule = require(AvatarExperienceInspectAndBuy.Components.ItemsView.ViewportLayout)
local GetItemThumbnailUrlModule = require(AvatarExperienceInspectAndBuy.Utils.getItemThumbnailUrl)
local SubheaderLabelPriceModule = require(AvatarExperienceInspectAndBuy.Components.Common.SubheaderLabelPrice)
local GetPriceStatusModule = require(AvatarExperienceInspectAndBuy.Utils.getPriceStatus)
local GetPriceInRobuxFunction = ItemDetailsUtilsModule.getPriceInRobux
local IsItemAvailableForTryOnModule = require(AvatarExperienceInspectAndBuy.Utils.isItemAvailableForTryOn)
local BackButtonModule = require(AvatarExperienceInspectAndBuy.Components.Common.BackButton)
local FormatNumberModule = require(AvatarExperienceInspectAndBuy.Utils.formatNumber)
local _ = require(AvatarExperienceInspectAndBuy.Types)
local ViewTypeModule = require(AvatarExperienceInspectAndBuy.Enums.ViewType)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = require(AvatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local _ = require(AvatarExperienceInspectAndBuy.Enums.PriceStatus)

local function v27(View, p1)
	-- upvalues: ViewTypeModule (copy)
	return if View == ViewTypeModule.WideLandscape then {
		PaddingTop = UDim.new(0, p1.Padding.XSmall),
		PaddingLeft = UDim.new(0, p1.Padding.Medium),
		PaddingRight = UDim.new(0, p1.Padding.Medium),
		PaddingBottom = UDim.new(0, p1.Padding.XXLarge)
	} elseif View == ViewTypeModule.Wide then {
		PaddingTop = UDim.new(0, p1.Padding.XSmall),
		PaddingBottom = UDim.new(0, p1.Padding.XLarge),
		PaddingLeft = UDim.new(0, p1.Margin.Large * 2),
		PaddingRight = UDim.new(0, p1.Margin.Large * 2)
	} else {
		PaddingTop = UDim.new(0, p1.Padding.XSmall),
		PaddingBottom = UDim.new(0, p1.Padding.XLarge),
		PaddingLeft = UDim.new(0, p1.Padding.XXLarge),
		PaddingRight = UDim.new(0, p1.Padding.XXLarge)
	}
end

local function v28(View, p1)
	-- upvalues: ViewTypeModule (copy)
	return if View == ViewTypeModule.WideLandscape then {
		left = UDim.new(0, p1.Padding.Large),
		right = UDim.new(0, p1.Padding.Large),
		bottom = UDim.new(0, p1.Padding.XXLarge)
	} else { bottom = UDim.new(0, p1.Padding.XXLarge) }
end

local function v29(View, p1, p2): UDim2
	-- upvalues: ViewTypeModule (copy)
	return if View == ViewTypeModule.Compact then UDim2.new(1, 0, 1, -p1.buyActionBarOffset - p1.backButtonOffset - p2.Padding.Small) else UDim2.new(1, 0, 1, -p1.backButtonOffset - p2.Padding.Small)
end

local function _(Wide): number
	-- upvalues: ViewTypeModule (copy)
	return if Wide == ViewTypeModule.Wide then 2.5 else 2
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseConvertedItemDataModule (copy), UseItemExperienceInfoModule (copy), GetPriceStatusModule (copy), ViewTypeModule (copy), UseItemStatusLocalizationModule (copy), v27 (copy), IsCollectibleFunction (copy), GetQuantitySoldFunction (copy), GetOriginalPriceFunction (copy), IsTradeableFunction (copy), IsInExperienceCreationPlayableFunction (copy), ReactModule (copy), FoundationModule (copy), Enums (copy), BackButtonModule (copy), v29 (copy), ViewportLayoutModule (copy), GetItemThumbnailUrlModule (copy), ItemHeaderModule (copy), v28 (copy), SubheaderLabelPriceModule (copy), GetCreatorNameFunction (copy), FormatNumberModule (copy), GetPriceInRobuxFunction (copy), ControlBarModule (copy), NumberLocalization (copy), LocalizationService (copy), IsItemAvailableForTryOnModule (copy), ResellableInstancesLabelModule (copy), ItemInfoLabelsModule (copy), BundleAssetsListModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseConvertedItemDataModuleResult = UseConvertedItemDataModule(p1.item)
	local UseItemExperienceInfoModuleResult = UseItemExperienceInfoModule(if UseConvertedItemDataModuleResult then UseConvertedItemDataModuleResult.creatingUniverseId else nil)
	local PriceStatusModule = GetPriceStatusModule(UseConvertedItemDataModuleResult)
	local IsViewMatch = p1.view == ViewTypeModule.WideLandscape
	local IsViewMatch1 = p1.view == ViewTypeModule.Compact
	local IsViewMatch2 = p1.view == ViewTypeModule.Wide
	local UseItemStatusLocalizationModuleResult = UseItemStatusLocalizationModule(UseConvertedItemDataModuleResult)
	local v1 = v27(p1.view, UseTokensResult)
	local BuyActionBarOffset = p1.buyActionBarOffset or 0
	local Size1000 = UseTokensResult.Size.Size_1000
	local ItemInfoLabels = {
		{
			key = "Category",
			isVisible = true,
			labelProps = {
				leftLabel = UseItemStatusLocalizationModuleResult.category,
				rightLabel = if UseConvertedItemDataModuleResult then UseItemStatusLocalizationModuleResult[UseConvertedItemDataModuleResult.itemSubType] else ""
			}
		},
		{
			key = "QuantitySold",
			isVisible = IsCollectibleFunction(UseConvertedItemDataModuleResult),
			labelProps = {
				leftLabel = UseItemStatusLocalizationModuleResult.quantitySold,
				rightLabel = GetQuantitySoldFunction(UseConvertedItemDataModuleResult, p1.formatNumber)
			}
		},
		{
			key = "OriginalPrice",
			isVisible = IsCollectibleFunction(UseConvertedItemDataModuleResult),
			labelProps = {
				leftLabel = UseItemStatusLocalizationModuleResult.originalPrice,
				rightLabel = GetOriginalPriceFunction(UseConvertedItemDataModuleResult, UseItemStatusLocalizationModuleResult.na, p1.formatNumber)
			}
		},
		{
			key = "Tradeable",
			isVisible = IsCollectibleFunction(UseConvertedItemDataModuleResult),
			labelProps = {
				leftLabel = UseItemStatusLocalizationModuleResult.tradeable,
				rightLabel = if IsTradeableFunction(UseConvertedItemDataModuleResult) then UseItemStatusLocalizationModuleResult.yes else UseItemStatusLocalizationModuleResult.no
			}
		}
	}
	table.insert(ItemInfoLabels, {
		key = "MadeIn",
		isVisible = IsInExperienceCreationPlayableFunction(UseItemExperienceInfoModuleResult),
		labelProps = {
			leftLabel = UseItemStatusLocalizationModuleResult.madein,
			rightLabel = ReactModule.createElement(FoundationModule.View, {
				LayoutOrder = 2,
				tag = "auto-xy",
				onActivated = function()
					-- upvalues: p1 (copy), UseItemExperienceInfoModuleResult (copy)
					if p1.openAttributionOverlay then
						p1.openAttributionOverlay(UseItemExperienceInfoModuleResult)
					end
				end
			}, {
				AttributionLabel = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy row gap-small align-y-center" }, {
					ExperienceName = UseItemExperienceInfoModuleResult and ReactModule.createElement(FoundationModule.Text, {
						LayoutOrder = 1,
						tag = "auto-xy text-title-medium content-default",
						Text = UseItemExperienceInfoModuleResult.name
					}) or nil,
					ArrowIcon = UseItemExperienceInfoModuleResult and ReactModule.createElement(FoundationModule.Icon, {
						LayoutOrder = 2,
						name = Enums.IconName.ArrowSmallRight,
						variant = Enums.IconVariant.Filled,
						size = Enums.IconSize.Medium,
						style = UseTokensResult.Color.Content.Default
					}) or nil
				})
			})
		}
	})
	
	return ReactModule.createElement(FoundationModule.View, { tag = "size-full" }, {
		ButtonContainer = ReactModule.createElement(FoundationModule.View, {}, {
			BackButton = ReactModule.createElement(BackButtonModule, {
				onBackButtonClick = p1.onItemDetailsClosed,
				Size = UDim2.new(0, Size1000, 1, 0),
				Position = UDim2.new(0, UseTokensResult.Padding.Small, 0, UseTokensResult.Padding.Small)
			})
		}),
		ScrollingFrame = ReactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			BorderSizePixel = 0,
			Size = v29(p1.view, {
				buyActionBarOffset = BuyActionBarOffset,
				backButtonOffset = Size1000
			}, UseTokensResult),
			Position = UDim2.new(0, 0, 0, Size1000 + UseTokensResult.Padding.Medium),
			CanvasSize = UDim2.new(1, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollingDirection = Enum.ScrollingDirection.Y
		}, {
			UIPadding = ReactModule.createElement("UIPadding", v1),
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, UseTokensResult.Padding.Small)
			}),
			ViewportLayout = if IsViewMatch1 or IsViewMatch2 then ReactModule.createElement(ViewportLayoutModule, {
				LayoutOrder = 1,
				view = p1.view,
				thumbnailUrl = GetItemThumbnailUrlModule(p1.item) or "",
				viewportProps = {
					Size = UDim2.new(0, UseTokensResult.Size.Size_3000 * (if p1.view == ViewTypeModule.Wide then 2.5 else 2), 0, UseTokensResult.Size.Size_3000 * (if p1.view == ViewTypeModule.Wide then 2.5 else 2))
				},
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				renderTryOnViewport = p1.renderTryOnViewport,
				tryOnState = p1.tryOnState
			}) else nil,
			Header = ReactModule.createElement(ItemHeaderModule, {
				LayoutOrder = 1,
				headerHeight = UseTokensResult.Size.Size_1300,
				purchaseButtonProps = p1.purchaseButtonProps,
				padding = v28(p1.view, UseTokensResult),
				header = ReactModule.createElement(FoundationModule.Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-heading-small content-emphasis text-truncate-end",
					Text = UseConvertedItemDataModuleResult and UseConvertedItemDataModuleResult.name or ""
				}),
				subheader = if IsViewMatch2 then ReactModule.createElement(SubheaderLabelPriceModule, {
					LayoutOrder = 2,
					subheaderText = {
						leftSlotLabel = GetCreatorNameFunction(UseConvertedItemDataModuleResult),
						rightSlotPrice = FormatNumberModule(GetPriceInRobuxFunction(UseConvertedItemDataModuleResult, PriceStatusModule))
					},
					priceStatus = PriceStatusModule
				}) else ReactModule.createElement(FoundationModule.Text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-large content-emphasis text-truncate-end",
					Text = GetCreatorNameFunction(UseConvertedItemDataModuleResult)
				})
			}),
			DetailsContainer = ReactModule.createElement(FoundationModule.View, {
				tag = "auto-xy col align-x-left align-y-top gap-small",
				LayoutOrder = 2
			}, {
				UIPadding = if IsViewMatch then ReactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, UseTokensResult.Padding.Large),
					PaddingRight = UDim.new(0, UseTokensResult.Padding.Large)
				}) else nil,
				ControlBar = ReactModule.createElement(ControlBarModule, {
					LayoutOrder = 1,
					favoritesBadge = {
						LayoutOrder = 1,
						text = if UseConvertedItemDataModuleResult and UseConvertedItemDataModuleResult.favoritesDetails and UseConvertedItemDataModuleResult.favoritesDetails.numFavorites then NumberLocalization.abbreviate(UseConvertedItemDataModuleResult.favoritesDetails.numFavorites, LocalizationService.RobloxLocaleId) else nil,
						iconVariant = if UseConvertedItemDataModuleResult and UseConvertedItemDataModuleResult.favoritesDetails and UseConvertedItemDataModuleResult.favoritesDetails.isFavorited then Enums.IconVariant.Filled else Enums.IconVariant.Regular,
						onActivated = function()
							-- upvalues: UseConvertedItemDataModuleResult (copy), p1 (copy)
							if UseConvertedItemDataModuleResult and UseConvertedItemDataModuleResult.favoritesDetails then
								p1.onToggleFavorite(p1.item, UseConvertedItemDataModuleResult.favoritesDetails.isFavorited or false)
							end
						end
					},
					tryOnBadge = if UseConvertedItemDataModuleResult and IsItemAvailableForTryOnModule(p1.localPlayerModel, UseConvertedItemDataModuleResult) then {
						LayoutOrder = 2,
						text = UseItemStatusLocalizationModuleResult.tryOn,
						iconVariant = if p1.tryOnState.isTryOnEnabled then Enums.IconVariant.Filled else Enums.IconVariant.Regular,
						onActivated = function()
							-- upvalues: UseConvertedItemDataModuleResult (copy), p1 (copy)
							if UseConvertedItemDataModuleResult then
								p1.onToggleTryOn({
									itemId = UseConvertedItemDataModuleResult.id,
									itemType = UseConvertedItemDataModuleResult.itemType,
									itemSubType = UseConvertedItemDataModuleResult.itemSubType,
									assetsInBundle = UseConvertedItemDataModuleResult.assetsInBundle
								})
							end
						end
					} else nil
				}),
				DescriptionLabel = ReactModule.createElement(FoundationModule.Text, {
					LayoutOrder = 3,
					tag = "auto-xy text-body-medium content-emphasis text-truncate-end text-align-x-left text-wrap padding-bottom-large padding-top-large",
					Text = if UseConvertedItemDataModuleResult then UseConvertedItemDataModuleResult.description else ""
				}),
				ResellableInstancesLabel = if IsCollectibleFunction(UseConvertedItemDataModuleResult) and UseConvertedItemDataModuleResult and UseConvertedItemDataModuleResult.collectibleItemDetails and UseConvertedItemDataModuleResult.collectibleItemDetails.resellableCount > 0 then ReactModule.createElement(ResellableInstancesLabelModule, {
					LayoutOrder = 3,
					ownedItemsLabel = UseItemStatusLocalizationModuleResult.ownedItems,
					padding = { top = UDim.new(0, UseTokensResult.Padding.Large) }
				}) else nil,
				ItemInfoLabels = ReactModule.createElement(ItemInfoLabelsModule, { LayoutOrder = 5, itemInfoLabels = ItemInfoLabels }),
				BundleAssetsList = if UseConvertedItemDataModuleResult and UseConvertedItemDataModuleResult.assetsInBundle and #UseConvertedItemDataModuleResult.assetsInBundle > 0 then ReactModule.createElement(BundleAssetsListModule, {
					LayoutOrder = 6,
					itemData = UseConvertedItemDataModuleResult,
					headerLabel = UseItemStatusLocalizationModuleResult.includedParts,
					view = p1.view
				}) else nil
			})
		})
	})
end