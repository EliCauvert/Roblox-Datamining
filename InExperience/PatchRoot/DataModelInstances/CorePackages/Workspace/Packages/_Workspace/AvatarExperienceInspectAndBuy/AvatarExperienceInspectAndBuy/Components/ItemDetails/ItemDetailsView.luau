local avatarExperienceInspectAndBuy = script:FindFirstAncestor("AvatarExperienceInspectAndBuy")
local localizationService = game:GetService("LocalizationService")
local parent = avatarExperienceInspectAndBuy.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local bundleAssetsListModule = require(avatarExperienceInspectAndBuy.Components.ItemDetails.BundleAssetsList)
local enums = foundationModule.Enums
local itemHeaderModule = require(avatarExperienceInspectAndBuy.Components.Common.ItemHeader)
local useConvertedItemDataModule = require(avatarExperienceInspectAndBuy.Hooks.useConvertedItemData)
local useItemExperienceInfoModule = require(avatarExperienceInspectAndBuy.Hooks.useItemExperienceInfo)
local controlBarModule = require(avatarExperienceInspectAndBuy.Components.ItemDetails.ControlBar)
local resellableInstancesLabelModule = require(avatarExperienceInspectAndBuy.Components.ItemDetails.ResellableInstancesLabel)
local itemInfoLabelsModule = require(avatarExperienceInspectAndBuy.Components.ItemDetails.ItemInfoLabels)
local numberLocalization = require(parent.Localization).NumberLocalization
local useItemStatusLocalizationModule = require(avatarExperienceInspectAndBuy.Hooks.useItemStatusLocalization)
local itemDetailsUtilsModule = require(avatarExperienceInspectAndBuy.Utils.itemDetailsUtils)
local isCollectible = itemDetailsUtilsModule.isCollectible
local isInExperienceCreationPlayable = itemDetailsUtilsModule.isInExperienceCreationPlayable
local isTradeable = itemDetailsUtilsModule.isTradeable
local getCreatorName = itemDetailsUtilsModule.getCreatorName
local getOriginalPrice = itemDetailsUtilsModule.getOriginalPrice
local getQuantitySold = itemDetailsUtilsModule.getQuantitySold
local viewportLayoutModule = require(avatarExperienceInspectAndBuy.Components.ItemsView.ViewportLayout)
local getItemThumbnailUrlModule = require(avatarExperienceInspectAndBuy.Utils.getItemThumbnailUrl)
local subheaderLabelPriceModule = require(avatarExperienceInspectAndBuy.Components.Common.SubheaderLabelPrice)
local getPriceStatusModule = require(avatarExperienceInspectAndBuy.Utils.getPriceStatus)
local getPriceInRobux = itemDetailsUtilsModule.getPriceInRobux
local isItemAvailableForTryOnModule = require(avatarExperienceInspectAndBuy.Utils.isItemAvailableForTryOn)
local backButtonModule = require(avatarExperienceInspectAndBuy.Components.Common.BackButton)
local formatNumberModule = require(avatarExperienceInspectAndBuy.Utils.formatNumber)
local _ = require(avatarExperienceInspectAndBuy.Types)
local viewTypeModule = require(avatarExperienceInspectAndBuy.Enums.ViewType)
local useTokens = foundationModule.Hooks.useTokens
local _ = require(avatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local _ = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)

local var21 = function(p0, p1)
	-- upvalues: viewTypeModule (ref)
	return if p0 == viewTypeModule.WideLandscape then {
		PaddingTop = UDim.new(0, p1.Padding.XSmall),
		PaddingLeft = UDim.new(0, p1.Padding.Medium),
		PaddingRight = UDim.new(0, p1.Padding.Medium),
		PaddingBottom = UDim.new(0, p1.Padding.XXLarge)
	} elseif p0 == viewTypeModule.Wide then {
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

local var22 = function(p2, p3)
	-- upvalues: viewTypeModule (ref)
	return if p2 == viewTypeModule.WideLandscape then {
		left = UDim.new(0, p3.Padding.Large),
		right = UDim.new(0, p3.Padding.Large),
		bottom = UDim.new(0, p3.Padding.XXLarge)
	} else { bottom = UDim.new(0, p3.Padding.XXLarge) }
end

local var23 = function(p4, p5, p6)
	-- upvalues: viewTypeModule (ref)
	return if p4 == viewTypeModule.Compact then UDim2.new(1, 0, 1, (-p5.buyActionBarOffset) - p5.backButtonOffset - p6.Padding.Small) else UDim2.new(1, 0, 1, (-p5.backButtonOffset) - p6.Padding.Small)
end

local _ = function(p7)
	-- upvalues: viewTypeModule (ref)
	return if p7 == viewTypeModule.Wide then 2.5 else 2
end

return function(p8)
	-- upvalues: useTokens (ref), useConvertedItemDataModule (ref), useItemExperienceInfoModule (ref), getPriceStatusModule (ref), viewTypeModule (ref), useItemStatusLocalizationModule (ref), var21 (ref), isCollectible (ref), getQuantitySold (ref), getOriginalPrice (ref), isTradeable (ref), isInExperienceCreationPlayable (ref), reactModule (ref), foundationModule (ref), enums (ref), backButtonModule (ref), var23 (ref), viewportLayoutModule (ref), getItemThumbnailUrlModule (ref), itemHeaderModule (ref), var22 (ref), subheaderLabelPriceModule (ref), getCreatorName (ref), formatNumberModule (ref), getPriceInRobux (ref), controlBarModule (ref), numberLocalization (ref), localizationService (ref), isItemAvailableForTryOnModule (ref), resellableInstancesLabelModule (ref), itemInfoLabelsModule (ref), bundleAssetsListModule (ref)
	local var24 = useTokens()
	local var25 = useConvertedItemDataModule(p8.item)
	local var26 = useItemExperienceInfoModule(if var25 then var25.creatingUniverseId else nil)
	local var27 = getPriceStatusModule(var25)
	local var28 = p8.view == viewTypeModule.WideLandscape
	local var29 = p8.view == viewTypeModule.Compact
	local var30 = p8.view == viewTypeModule.Wide
	local var31 = useItemStatusLocalizationModule(var25)
	local var32 = var21(p8.view, var24)
	local buyActionBarOffset = p8.buyActionBarOffset or 0
	local size1000 = var24.Size.Size_1000
	local list = {
		{
			key = "Category",
			isVisible = true,
			labelProps = {
				leftLabel = var31.category,
				rightLabel = if var25 then var31[var25.itemSubType] else ""
			}
		},
		{
			key = "QuantitySold",
			isVisible = isCollectible(var25),
			labelProps = {
				leftLabel = var31.quantitySold,
				rightLabel = getQuantitySold(var25, p8.formatNumber)
			}
		},
		{
			key = "OriginalPrice",
			isVisible = isCollectible(var25),
			labelProps = {
				leftLabel = var31.originalPrice,
				rightLabel = getOriginalPrice(var25, var31.na, p8.formatNumber)
			}
		},
		{
			key = "Tradeable",
			isVisible = isCollectible(var25),
			labelProps = {
				leftLabel = var31.tradeable,
				rightLabel = if isTradeable(var25) then var31.yes else var31.no
			}
		}
	}
	table.insert(list, {
		key = "MadeIn",
		isVisible = isInExperienceCreationPlayable(var26),
		labelProps = {
			leftLabel = var31.madein,
			rightLabel = reactModule.createElement(foundationModule.View, {
				LayoutOrder = 2,
				tag = "auto-xy",
				onActivated = function()
					-- upvalues: p8 (ref), var26 (ref)
					if p8.openAttributionOverlay then
						p8.openAttributionOverlay(var26)
					end
				end
			}, {
				AttributionLabel = reactModule.createElement(foundationModule.View, { tag = "auto-xy row gap-small align-y-center" }, {
					ExperienceName = var26 and reactModule.createElement(foundationModule.Text, {
						LayoutOrder = 1,
						tag = "auto-xy text-title-medium content-default",
						Text = var26.name
					}) or nil,
					ArrowIcon = var26 and reactModule.createElement(foundationModule.Icon, {
						LayoutOrder = 2,
						name = enums.IconName.ArrowSmallRight,
						variant = enums.IconVariant.Filled,
						size = enums.IconSize.Medium,
						style = var24.Color.Content.Default
					}) or nil
				})
			})
		}
	})
	
	return reactModule.createElement(foundationModule.View, { tag = "size-full" }, {
		ButtonContainer = reactModule.createElement(foundationModule.View, {}, {
			BackButton = reactModule.createElement(backButtonModule, {
				onBackButtonClick = p8.onItemDetailsClosed,
				Size = UDim2.new(0, size1000, 1, 0),
				Position = UDim2.new(0, var24.Padding.Small, 0, var24.Padding.Small)
			})
		}),
		ScrollingFrame = reactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			BorderSizePixel = 0,
			Size = var23(p8.view, {
				buyActionBarOffset = buyActionBarOffset,
				backButtonOffset = size1000
			}, var24),
			Position = UDim2.new(0, 0, 0, size1000 + var24.Padding.Medium),
			CanvasSize = UDim2.new(1, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollingDirection = Enum.ScrollingDirection.Y
		}, {
			UIPadding = reactModule.createElement("UIPadding", var32),
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, var24.Padding.Small)
			}),
			ViewportLayout = if var29 or var30 then reactModule.createElement(viewportLayoutModule, {
				LayoutOrder = 1,
				view = p8.view,
				thumbnailUrl = getItemThumbnailUrlModule(p8.item) or "",
				viewportProps = {
					Size = UDim2.new(0, var24.Size.Size_3000 * (if p8.view == viewTypeModule.Wide then 2.5 else 2), 0, var24.Size.Size_3000 * (if p8.view == viewTypeModule.Wide then 2.5 else 2))
				},
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				renderTryOnViewport = p8.renderTryOnViewport,
				tryOnState = p8.tryOnState
			}) else nil,
			Header = reactModule.createElement(itemHeaderModule, {
				LayoutOrder = 1,
				headerHeight = var24.Size.Size_1300,
				purchaseButtonProps = p8.purchaseButtonProps,
				padding = var22(p8.view, var24),
				header = reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-heading-small content-emphasis text-truncate-end",
					Text = if var25 then var25.name else ""
				}),
				subheader = if var30 then reactModule.createElement(subheaderLabelPriceModule, {
					LayoutOrder = 2,
					subheaderText = {
						leftSlotLabel = getCreatorName(var25),
						rightSlotPrice = formatNumberModule(getPriceInRobux(var25, var27))
					},
					priceStatus = var27
				}) else reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-large content-emphasis text-truncate-end",
					Text = getCreatorName(var25)
				})
			}),
			DetailsContainer = reactModule.createElement(foundationModule.View, {
				tag = "auto-xy col align-x-left align-y-top gap-small",
				LayoutOrder = 2
			}, {
				UIPadding = if var28 then reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, var24.Padding.Large),
					PaddingRight = UDim.new(0, var24.Padding.Large)
				}) else nil,
				ControlBar = reactModule.createElement(controlBarModule, {
					LayoutOrder = 1,
					favoritesBadge = {
						LayoutOrder = 1,
						text = if var25 and var25.favoritesDetails and var25.favoritesDetails.numFavorites then numberLocalization.abbreviate(var25.favoritesDetails.numFavorites, localizationService.RobloxLocaleId) else nil,
						iconVariant = if var25 and var25.favoritesDetails and var25.favoritesDetails.isFavorited then enums.IconVariant.Filled else enums.IconVariant.Regular,
						onActivated = function()
							-- upvalues: var25 (ref), p8 (ref)
							if var25 and var25.favoritesDetails then
								p8.onToggleFavorite(p8.item, var25.favoritesDetails.isFavorited or false)
							end
						end
					},
					tryOnBadge = if var25 and isItemAvailableForTryOnModule(p8.localPlayerModel, var25) then {
						LayoutOrder = 2,
						text = var31.tryOn,
						iconVariant = if p8.tryOnState.isTryOnEnabled then enums.IconVariant.Filled else enums.IconVariant.Regular,
						onActivated = function()
							-- upvalues: var25 (ref), p8 (ref)
							if var25 then
								p8.onToggleTryOn({
									itemId = var25.id,
									itemType = var25.itemType,
									itemSubType = var25.itemSubType,
									assetsInBundle = var25.assetsInBundle
								})
							end
						end
					} else nil
				}),
				DescriptionLabel = reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 3,
					tag = "auto-xy text-body-medium content-emphasis text-truncate-end text-align-x-left text-wrap padding-bottom-large padding-top-large",
					Text = if var25 then var25.description else ""
				}),
				ResellableInstancesLabel = if isCollectible(var25) and var25 and (var25.collectibleItemDetails and var25.collectibleItemDetails.resellableCount > 0) then reactModule.createElement(resellableInstancesLabelModule, {
					LayoutOrder = 3,
					ownedItemsLabel = var31.ownedItems,
					padding = { top = UDim.new(0, var24.Padding.Large) }
				}) else nil,
				ItemInfoLabels = reactModule.createElement(itemInfoLabelsModule, { LayoutOrder = 5, itemInfoLabels = list }),
				BundleAssetsList = if var25 and var25.assetsInBundle and #var25.assetsInBundle > 0 then reactModule.createElement(bundleAssetsListModule, {
					LayoutOrder = 6,
					itemData = var25,
					headerLabel = var31.includedParts,
					view = p8.view
				}) else nil
			})
		})
	})
end