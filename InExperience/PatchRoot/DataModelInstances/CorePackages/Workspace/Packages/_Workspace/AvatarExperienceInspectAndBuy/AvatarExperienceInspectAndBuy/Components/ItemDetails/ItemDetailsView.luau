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

local var1 = function(p1, p2)
	-- upvalues: viewTypeModule (ref)
	return if p1 == viewTypeModule.WideLandscape then {
		PaddingTop = UDim.new(0, p2.Padding.XSmall),
		PaddingLeft = UDim.new(0, p2.Padding.Medium),
		PaddingRight = UDim.new(0, p2.Padding.Medium),
		PaddingBottom = UDim.new(0, p2.Padding.XXLarge)
	} elseif p1 == viewTypeModule.Wide then {
		PaddingTop = UDim.new(0, p2.Padding.XSmall),
		PaddingBottom = UDim.new(0, p2.Padding.XLarge),
		PaddingLeft = UDim.new(0, p2.Margin.Large * 2),
		PaddingRight = UDim.new(0, p2.Margin.Large * 2)
	} else {
		PaddingTop = UDim.new(0, p2.Padding.XSmall),
		PaddingBottom = UDim.new(0, p2.Padding.XLarge),
		PaddingLeft = UDim.new(0, p2.Padding.XXLarge),
		PaddingRight = UDim.new(0, p2.Padding.XXLarge)
	}
end

local var2 = function(p1, p2)
	-- upvalues: viewTypeModule (ref)
	return if p1 == viewTypeModule.WideLandscape then {
		left = UDim.new(0, p2.Padding.Large),
		right = UDim.new(0, p2.Padding.Large),
		bottom = UDim.new(0, p2.Padding.XXLarge)
	} else { bottom = UDim.new(0, p2.Padding.XXLarge) }
end

local var3 = function(p1, p2, p3)
	-- upvalues: viewTypeModule (ref)
	return if p1 == viewTypeModule.Compact then UDim2.new(1, 0, 1, (-p2.buyActionBarOffset) - p2.backButtonOffset - p3.Padding.Small) else UDim2.new(1, 0, 1, (-p2.backButtonOffset) - p3.Padding.Small)
end

local _ = function(p1)
	-- upvalues: viewTypeModule (ref)
	return if p1 == viewTypeModule.Wide then 2.5 else 2
end

return function(p1)
	-- upvalues: useTokens (ref), useConvertedItemDataModule (ref), useItemExperienceInfoModule (ref), getPriceStatusModule (ref), viewTypeModule (ref), useItemStatusLocalizationModule (ref), var1 (ref), isCollectible (ref), getQuantitySold (ref), getOriginalPrice (ref), isTradeable (ref), isInExperienceCreationPlayable (ref), reactModule (ref), foundationModule (ref), enums (ref), backButtonModule (ref), var3 (ref), viewportLayoutModule (ref), getItemThumbnailUrlModule (ref), itemHeaderModule (ref), var2 (ref), subheaderLabelPriceModule (ref), getCreatorName (ref), formatNumberModule (ref), getPriceInRobux (ref), controlBarModule (ref), numberLocalization (ref), localizationService (ref), isItemAvailableForTryOnModule (ref), resellableInstancesLabelModule (ref), itemInfoLabelsModule (ref), bundleAssetsListModule (ref)
	local var4 = useTokens()
	local var5 = useConvertedItemDataModule(p1.item)
	local var6 = useItemExperienceInfoModule(if var5 then var5.creatingUniverseId else nil)
	local var7 = getPriceStatusModule(var5)
	local var8 = p1.view == viewTypeModule.WideLandscape
	local var9 = p1.view == viewTypeModule.Compact
	local var10 = p1.view == viewTypeModule.Wide
	local var11 = useItemStatusLocalizationModule(var5)
	local var12 = var1(p1.view, var4)
	local buyActionBarOffset = p1.buyActionBarOffset or 0
	local size1000 = var4.Size.Size_1000
	local list = {
		{
			key = "Category",
			isVisible = true,
			labelProps = {
				leftLabel = var11.category,
				rightLabel = if var5 then var11[var5.itemSubType] else ""
			}
		},
		{
			key = "QuantitySold",
			isVisible = isCollectible(var5),
			labelProps = {
				leftLabel = var11.quantitySold,
				rightLabel = getQuantitySold(var5, p1.formatNumber)
			}
		},
		{
			key = "OriginalPrice",
			isVisible = isCollectible(var5),
			labelProps = {
				leftLabel = var11.originalPrice,
				rightLabel = getOriginalPrice(var5, var11.na, p1.formatNumber)
			}
		},
		{
			key = "Tradeable",
			isVisible = isCollectible(var5),
			labelProps = {
				leftLabel = var11.tradeable,
				rightLabel = if isTradeable(var5) then var11.yes else var11.no
			}
		}
	}
	table.insert(list, {
		key = "MadeIn",
		isVisible = isInExperienceCreationPlayable(var6),
		labelProps = {
			leftLabel = var11.madein,
			rightLabel = reactModule.createElement(foundationModule.View, {
				LayoutOrder = 2,
				tag = "auto-xy",
				onActivated = function()
					-- upvalues: p1 (ref), var6 (ref)
					if p1.openAttributionOverlay then
						p1.openAttributionOverlay(var6)
					end
				end
			}, {
				AttributionLabel = reactModule.createElement(foundationModule.View, { tag = "auto-xy row gap-small align-y-center" }, {
					ExperienceName = var6 and reactModule.createElement(foundationModule.Text, {
						LayoutOrder = 1,
						tag = "auto-xy text-title-medium content-default",
						Text = var6.name
					}) or nil,
					ArrowIcon = var6 and reactModule.createElement(foundationModule.Icon, {
						LayoutOrder = 2,
						name = enums.IconName.ArrowSmallRight,
						variant = enums.IconVariant.Filled,
						size = enums.IconSize.Medium,
						style = var4.Color.Content.Default
					}) or nil
				})
			})
		}
	})
	
	return reactModule.createElement(foundationModule.View, { tag = "size-full" }, {
		ButtonContainer = reactModule.createElement(foundationModule.View, {}, {
			BackButton = reactModule.createElement(backButtonModule, {
				onBackButtonClick = p1.onItemDetailsClosed,
				Size = UDim2.new(0, size1000, 1, 0),
				Position = UDim2.new(0, var4.Padding.Small, 0, var4.Padding.Small)
			})
		}),
		ScrollingFrame = reactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			BorderSizePixel = 0,
			Size = var3(p1.view, {
				buyActionBarOffset = buyActionBarOffset,
				backButtonOffset = size1000
			}, var4),
			Position = UDim2.new(0, 0, 0, size1000 + var4.Padding.Medium),
			CanvasSize = UDim2.new(1, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollingDirection = Enum.ScrollingDirection.Y
		}, {
			UIPadding = reactModule.createElement("UIPadding", var12),
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, var4.Padding.Small)
			}),
			ViewportLayout = if var9 or var10 then reactModule.createElement(viewportLayoutModule, {
				LayoutOrder = 1,
				view = p1.view,
				thumbnailUrl = getItemThumbnailUrlModule(p1.item) or "",
				viewportProps = {
					Size = UDim2.new(0, var4.Size.Size_3000 * (if p1.view == viewTypeModule.Wide then 2.5 else 2), 0, var4.Size.Size_3000 * (if p1.view == viewTypeModule.Wide then 2.5 else 2))
				},
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				renderTryOnViewport = p1.renderTryOnViewport,
				tryOnState = p1.tryOnState
			}) else nil,
			Header = reactModule.createElement(itemHeaderModule, {
				LayoutOrder = 1,
				headerHeight = var4.Size.Size_1300,
				purchaseButtonProps = p1.purchaseButtonProps,
				padding = var2(p1.view, var4),
				header = reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-heading-small content-emphasis text-truncate-end",
					Text = if var5 then var5.name else ""
				}),
				subheader = if var10 then reactModule.createElement(subheaderLabelPriceModule, {
					LayoutOrder = 2,
					subheaderText = {
						leftSlotLabel = getCreatorName(var5),
						rightSlotPrice = formatNumberModule(getPriceInRobux(var5, var7))
					},
					priceStatus = var7
				}) else reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-large content-emphasis text-truncate-end",
					Text = getCreatorName(var5)
				})
			}),
			DetailsContainer = reactModule.createElement(foundationModule.View, {
				tag = "auto-xy col align-x-left align-y-top gap-small",
				LayoutOrder = 2
			}, {
				UIPadding = if var8 then reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, var4.Padding.Large),
					PaddingRight = UDim.new(0, var4.Padding.Large)
				}) else nil,
				ControlBar = reactModule.createElement(controlBarModule, {
					LayoutOrder = 1,
					favoritesBadge = {
						LayoutOrder = 1,
						text = if var5 and var5.favoritesDetails and var5.favoritesDetails.numFavorites then numberLocalization.abbreviate(var5.favoritesDetails.numFavorites, localizationService.RobloxLocaleId) else nil,
						iconVariant = if var5 and var5.favoritesDetails and var5.favoritesDetails.isFavorited then enums.IconVariant.Filled else enums.IconVariant.Regular,
						onActivated = function()
							-- upvalues: var5 (ref), p1 (ref)
							if var5 and var5.favoritesDetails then
								p1.onToggleFavorite(p1.item, var5.favoritesDetails.isFavorited or false)
							end
						end
					},
					tryOnBadge = if var5 and isItemAvailableForTryOnModule(p1.localPlayerModel, var5) then {
						LayoutOrder = 2,
						text = var11.tryOn,
						iconVariant = if p1.tryOnState.isTryOnEnabled then enums.IconVariant.Filled else enums.IconVariant.Regular,
						onActivated = function()
							-- upvalues: var5 (ref), p1 (ref)
							if var5 then
								p1.onToggleTryOn({
									itemId = var5.id,
									itemType = var5.itemType,
									itemSubType = var5.itemSubType,
									assetsInBundle = var5.assetsInBundle
								})
							end
						end
					} else nil
				}),
				DescriptionLabel = reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 3,
					tag = "auto-xy text-body-medium content-emphasis text-truncate-end text-align-x-left text-wrap padding-bottom-large padding-top-large",
					Text = if var5 then var5.description else ""
				}),
				ResellableInstancesLabel = if isCollectible(var5) and var5 and (var5.collectibleItemDetails and var5.collectibleItemDetails.resellableCount > 0) then reactModule.createElement(resellableInstancesLabelModule, {
					LayoutOrder = 3,
					ownedItemsLabel = var11.ownedItems,
					padding = { top = UDim.new(0, var4.Padding.Large) }
				}) else nil,
				ItemInfoLabels = reactModule.createElement(itemInfoLabelsModule, { LayoutOrder = 5, itemInfoLabels = list }),
				BundleAssetsList = if var5 and var5.assetsInBundle and #var5.assetsInBundle > 0 then reactModule.createElement(bundleAssetsListModule, {
					LayoutOrder = 6,
					itemData = var5,
					headerLabel = var11.includedParts,
					view = p1.view
				}) else nil
			})
		})
	})
end