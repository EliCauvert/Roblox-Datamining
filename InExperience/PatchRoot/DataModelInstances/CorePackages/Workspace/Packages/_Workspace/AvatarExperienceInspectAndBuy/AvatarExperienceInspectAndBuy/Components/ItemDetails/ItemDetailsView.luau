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
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXFormatPDPPriceLabel = avatarExperienceFlagsModule.FFlagAXFormatPDPPriceLabel
local fFlagAXHideInspectAndBuyPriceIfUnavailable = avatarExperienceFlagsModule.FFlagAXHideInspectAndBuyPriceIfUnavailable
local _ = require(avatarExperienceInspectAndBuy.Types)
local viewTypeModule = require(avatarExperienceInspectAndBuy.Enums.ViewType)
local useTokens = foundationModule.Hooks.useTokens
local _ = require(avatarExperienceInspectAndBuy.Components.Common.BuyActionBar)
local _ = require(avatarExperienceInspectAndBuy.Enums.PriceStatus)
local fFlagIBV2Attribution = require(parent.SharedFlags).FFlagIBV2Attribution

local var22 = function(p0, p1) --[[ line: 75 ]]
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

local var23 = function(p2, p3) --[[ line: 105 ]]
	-- upvalues: viewTypeModule (ref)
	return if p2 == viewTypeModule.WideLandscape then {
		left = UDim.new(0, p3.Padding.Large),
		right = UDim.new(0, p3.Padding.Large),
		bottom = UDim.new(0, p3.Padding.XXLarge)
	} else { bottom = UDim.new(0, p3.Padding.XXLarge) }
end

local var24 = function(p4, p5, p6) --[[ line: 125 ]]
	-- upvalues: viewTypeModule (ref)
	return if p4 == viewTypeModule.Compact then UDim2.new(1, 0, 1, (-p5.buyActionBarOffset) - p5.backButtonOffset - p6.Padding.Small) else UDim2.new(1, 0, 1, (-p5.backButtonOffset) - p6.Padding.Small)
end

local _ = function(p7) --[[ line: 138 ]]
	-- upvalues: viewTypeModule (ref)
	return if p7 == viewTypeModule.Wide then 2.5 else 2
end

return function(p8) --[[ line: 145 | named "ItemDetailsView" ]]
	-- upvalues: useTokens (ref), useConvertedItemDataModule (ref), fFlagIBV2Attribution (ref), useItemExperienceInfoModule (ref), getPriceStatusModule (ref), viewTypeModule (ref), useItemStatusLocalizationModule (ref), var22 (ref), isCollectible (ref), getQuantitySold (ref), getOriginalPrice (ref), isTradeable (ref), isInExperienceCreationPlayable (ref), reactModule (ref), foundationModule (ref), enums (ref), backButtonModule (ref), var24 (ref), viewportLayoutModule (ref), getItemThumbnailUrlModule (ref), itemHeaderModule (ref), var23 (ref), subheaderLabelPriceModule (ref), getCreatorName (ref), fFlagAXFormatPDPPriceLabel (ref), formatNumberModule (ref), getPriceInRobux (ref), fFlagAXHideInspectAndBuyPriceIfUnavailable (ref), controlBarModule (ref), numberLocalization (ref), localizationService (ref), isItemAvailableForTryOnModule (ref), resellableInstancesLabelModule (ref), itemInfoLabelsModule (ref), bundleAssetsListModule (ref)
	local var25 = useTokens()
	local var26 = useConvertedItemDataModule(p8.item)
	local var27 = if fFlagIBV2Attribution then useItemExperienceInfoModule(if fFlagIBV2Attribution and var26 then var26.creatingUniverseId else nil) else nil
	local var28 = getPriceStatusModule(var26)
	local var29 = p8.view == viewTypeModule.WideLandscape
	local var30 = p8.view == viewTypeModule.Compact
	local var31 = p8.view == viewTypeModule.Wide
	local var32 = useItemStatusLocalizationModule(var26)
	local var33 = var22(p8.view, var25)
	local buyActionBarOffset = p8.buyActionBarOffset or 0
	local size1000 = var25.Size.Size_1000
	local list = {
		{
			key = "Category",
			isVisible = true,
			labelProps = {
				leftLabel = var32.category,
				rightLabel = if var26 then var32[var26.itemSubType] else ""
			}
		},
		{
			key = "QuantitySold",
			isVisible = isCollectible(var26),
			labelProps = {
				leftLabel = var32.quantitySold,
				rightLabel = getQuantitySold(var26, p8.formatNumber)
			}
		},
		{
			key = "OriginalPrice",
			isVisible = isCollectible(var26),
			labelProps = {
				leftLabel = var32.originalPrice,
				rightLabel = getOriginalPrice(var26, var32.na, p8.formatNumber)
			}
		},
		{
			key = "Tradeable",
			isVisible = isCollectible(var26),
			labelProps = {
				leftLabel = var32.tradeable,
				rightLabel = if isTradeable(var26) then var32.yes else var32.no
			}
		}
	}
	
	if fFlagIBV2Attribution then
		table.insert(list, {
			key = "MadeIn",
			isVisible = isInExperienceCreationPlayable(var27),
			labelProps = {
				leftLabel = var32.madein,
				rightLabel = reactModule.createElement(foundationModule.View, {
					LayoutOrder = 2,
					tag = "auto-xy",
					onActivated = function() --[[ line: 203 ]]
						-- upvalues: p8 (ref), var27 (ref)
						if p8.openAttributionOverlay then
							p8.openAttributionOverlay(var27)
						end
					end
				}, {
					AttributionLabel = reactModule.createElement(foundationModule.View, { tag = "auto-xy row gap-small align-y-center" }, {
						ExperienceName = var27 and reactModule.createElement(foundationModule.Text, {
							LayoutOrder = 1,
							tag = "auto-xy text-title-medium content-default",
							Text = var27.name
						}) or nil,
						ArrowIcon = var27 and reactModule.createElement(foundationModule.Icon, {
							LayoutOrder = 2,
							name = enums.IconName.ArrowSmallRight,
							variant = enums.IconVariant.Filled,
							size = enums.IconSize.Medium,
							style = var25.Color.Content.Default
						}) or nil
					})
				})
			}
		})
	end
	return reactModule.createElement(foundationModule.View, { tag = "size-full" }, {
		ButtonContainer = reactModule.createElement(foundationModule.View, {}, {
			BackButton = reactModule.createElement(backButtonModule, {
				onBackButtonClick = p8.onItemDetailsClosed,
				Size = UDim2.new(0, size1000, 1, 0),
				Position = UDim2.new(0, var25.Padding.Small, 0, var25.Padding.Small)
			})
		}),
		ScrollingFrame = reactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			ScrollBarThickness = 0,
			BorderSizePixel = 0,
			Size = var24(p8.view, {
				buyActionBarOffset = buyActionBarOffset,
				backButtonOffset = size1000
			}, var25),
			Position = UDim2.new(0, 0, 0, size1000 + var25.Padding.Medium),
			CanvasSize = UDim2.new(1, 0, 0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y,
			ScrollingDirection = Enum.ScrollingDirection.Y
		}, {
			UIPadding = reactModule.createElement("UIPadding", var33),
			UIListLayout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, var25.Padding.Small)
			}),
			ViewportLayout = if var30 or var31 then reactModule.createElement(viewportLayoutModule, {
				LayoutOrder = 1,
				view = p8.view,
				thumbnailUrl = getItemThumbnailUrlModule(p8.item) or "",
				viewportProps = {
					Size = UDim2.new(0, var25.Size.Size_3000 * (if p8.view == viewTypeModule.Wide then 2.5 else 2), 0, var25.Size.Size_3000 * (if p8.view == viewTypeModule.Wide then 2.5 else 2))
				},
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				renderTryOnViewport = p8.renderTryOnViewport,
				tryOnState = p8.tryOnState
			}) else nil,
			Header = reactModule.createElement(itemHeaderModule, {
				LayoutOrder = 1,
				headerHeight = var25.Size.Size_1300,
				purchaseButtonProps = p8.purchaseButtonProps,
				padding = var23(p8.view, var25),
				header = reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-heading-small content-emphasis text-truncate-end",
					Text = if var26 then var26.name else ""
				}),
				subheader = if var31 then reactModule.createElement(subheaderLabelPriceModule, {
					LayoutOrder = 2,
					subheaderText = {
						leftSlotLabel = getCreatorName(var26),
						rightSlotPrice = if fFlagAXFormatPDPPriceLabel then formatNumberModule(getPriceInRobux(var26, var28)) else tostring(getPriceInRobux(var26, var28))
					},
					priceStatus = if fFlagAXHideInspectAndBuyPriceIfUnavailable then var28 else nil
				}) else reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 2,
					tag = "auto-xy text-body-large content-emphasis text-truncate-end",
					Text = getCreatorName(var26)
				})
			}),
			DetailsContainer = reactModule.createElement(foundationModule.View, {
				tag = "auto-xy col align-x-left align-y-top gap-small",
				LayoutOrder = 2
			}, {
				UIPadding = if var29 then reactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, var25.Padding.Large),
					PaddingRight = UDim.new(0, var25.Padding.Large)
				}) else nil,
				ControlBar = reactModule.createElement(controlBarModule, {
					LayoutOrder = 1,
					favoritesBadge = {
						LayoutOrder = 1,
						text = if var26 and var26.favoritesDetails and var26.favoritesDetails.numFavorites then numberLocalization.abbreviate(var26.favoritesDetails.numFavorites, localizationService.RobloxLocaleId) else nil,
						iconVariant = if var26 and var26.favoritesDetails and var26.favoritesDetails.isFavorited then enums.IconVariant.Filled else enums.IconVariant.Regular,
						onActivated = function() --[[ line: 334 ]]
							-- upvalues: var26 (ref), p8 (ref)
							if var26 and var26.favoritesDetails then
								p8.onToggleFavorite(p8.item, var26.favoritesDetails.isFavorited or false)
							end
						end
					},
					tryOnBadge = if var26 and isItemAvailableForTryOnModule(p8.localPlayerModel, var26) then {
						LayoutOrder = 2,
						text = var32.tryOn,
						iconVariant = if p8.tryOnState.isTryOnEnabled then enums.IconVariant.Filled else enums.IconVariant.Regular,
						onActivated = function() --[[ line: 347 ]]
							-- upvalues: var26 (ref), p8 (ref)
							if var26 then
								p8.onToggleTryOn({
									itemId = var26.id,
									itemType = var26.itemType,
									itemSubType = var26.itemSubType,
									assetsInBundle = var26.assetsInBundle
								})
							end
						end
					} else nil
				}),
				DescriptionLabel = reactModule.createElement(foundationModule.Text, {
					LayoutOrder = 3,
					tag = "auto-xy text-body-medium content-emphasis text-truncate-end text-align-x-left text-wrap padding-bottom-large padding-top-large",
					Text = if var26 then var26.description else ""
				}),
				ResellableInstancesLabel = if isCollectible(var26) and var26 and (var26.collectibleItemDetails and var26.collectibleItemDetails.resellableCount > 0) then reactModule.createElement(resellableInstancesLabelModule, {
					LayoutOrder = 3,
					ownedItemsLabel = var32.ownedItems,
					padding = { top = UDim.new(0, var25.Padding.Large) }
				}) else nil,
				ItemInfoLabels = reactModule.createElement(itemInfoLabelsModule, { LayoutOrder = 5, itemInfoLabels = list }),
				BundleAssetsList = if var26 and var26.assetsInBundle and #var26.assetsInBundle > 0 then reactModule.createElement(bundleAssetsListModule, {
					LayoutOrder = 6,
					itemData = var26,
					headerLabel = var32.includedParts,
					view = p8.view
				}) else nil
			})
		})
	})
end