local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local CatalogRowItemCard = AvatarExperienceCommonModule.Components.CatalogItemCard.CatalogRowItemCard
local ItemCardThumbnail = require(Parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local _ = require(AvatarExperienceCatalog.Stores.createAXShoppingCartStore)
local PurchaseItemsErrorStatusMapModule = require(AvatarExperienceCatalog.Enums.PurchaseItemsErrorStatusMap)
local ConstantsModule = require(AvatarExperienceCatalog.Constants)
local UseCheckoutRowItemCardViewModelModule = require(script.Parent.useCheckoutRowItemCardViewModel)
local AvatarExperienceGiftingModule = require(Parent.AvatarExperienceGifting)
local AvatarItemGiftEntryPoint = AvatarExperienceGiftingModule.Components.AvatarItemGiftEntryPoint
local UseAvatarItemGiftEligibilityFunction = AvatarExperienceGiftingModule.Hooks.useAvatarItemGiftEligibility
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXGifting = AvatarExperienceFlagsModule.FFlagAXGifting
local FFlagAXDurablesForMIS = AvatarExperienceFlagsModule.FFlagAXDurablesForMIS
local FFlagAXDurables2Option = AvatarExperienceFlagsModule.FFlagAXDurables2Option
local FFlagAXMISOffersChip = AvatarExperienceFlagsModule.FFlagAXMISOffersChip
local FFlagAXMISSmallUIChanges = AvatarExperienceFlagsModule.FFlagAXMISSmallUIChanges
local FFlagAXMISWithOffers = AvatarExperienceFlagsModule.FFlagAXMISWithOffers
local AvatarExperienceTimedOptionsModule = require(Parent.AvatarExperienceTimedOptions)
local WearTimeSelectedOptionInList = AvatarExperienceTimedOptionsModule.WearTimeSelectedOptionInList
local WearTimeOptionButton = AvatarExperienceTimedOptionsModule.WearTimeOptionButton
local Constants = AvatarExperienceCommonModule.Constants
local ASSETTYPELOCALIZED = ConstantsModule.ASSET_TYPE_LOCALIZED
local BUNDLETYPELOCALIZED = ConstantsModule.BUNDLE_TYPE_LOCALIZED
local OFFERSLOCALIZED = ConstantsModule.OFFERS_LOCALIZED
local config = {
	[tostring(PurchaseItemsErrorStatusMapModule.SOLD_OUT)] = "Feature.Catalog.Label.Checkout.SoldOut",
	[tostring(PurchaseItemsErrorStatusMapModule.ALREADY_OWNED)] = "Feature.Catalog.Label.Owned",
	[tostring(PurchaseItemsErrorStatusMapModule.EXPERIENCE_LINK)] = "Feature.Catalog.Label.Checkout.InExperienceOnly",
	[tostring(PurchaseItemsErrorStatusMapModule.QUANTITY_LIMIT_EXCEEDED)] = "Feature.Catalog.Label.Checkout.LimitReached",
	[tostring(PurchaseItemsErrorStatusMapModule.NOT_AVAILABLE_FOR_PURCHASER)] = "Feature.Catalog.Label.Checkout.Unavailable",
	[tostring(PurchaseItemsErrorStatusMapModule.NOT_FOR_SALE)] = "Feature.Catalog.Label.Checkout.OffSale",
	[tostring(PurchaseItemsErrorStatusMapModule.PURCHASER_IS_SELLER)] = "Feature.Catalog.Label.Checkout.Unavailable",
	[tostring(PurchaseItemsErrorStatusMapModule.PURCHASE_PLACE_INVALID)] = "Feature.Catalog.Label.Checkout.InExperienceOnly",
	[tostring(PurchaseItemsErrorStatusMapModule.PRICE_MISMATCH)] = "Feature.Catalog.Label.Checkout.PriceChanged",
	Unvailable = "Feature.Catalog.Label.Checkout.Unavailable"
}

local function _(Name, p1): boolean --[[ Line: 56 | Named "hasAssetTypeLocalizedString" ]]
	-- upvalues: ASSETTYPELOCALIZED (copy)
	return Name == Enum.AvatarItemType.Asset.Name and ASSETTYPELOCALIZED[tostring(p1)] ~= nil
end

local _ = function(Name, p1): boolean --[[ Line: 60 | Named "hasBundleTypeLocalizedString" ]]
	-- upvalues: BUNDLETYPELOCALIZED (copy)
	return Name == Enum.AvatarItemType.Bundle.Name and BUNDLETYPELOCALIZED[tostring(p1)] ~= nil
end

local _ = function(Name): string --[[ Line: 64 | Named "getThumbnailType" ]]
	return if Name == Enum.AvatarItemType.Bundle.Name then "BundleThumbnail" else "Asset"
end

return ReactModule.memo(function(Frame) --[[ Line: 81 | Named "CheckoutRowItemCard" ]]
	-- upvalues: FoundationModule (copy), FFlagAXDurablesForMIS (copy), UseCheckoutRowItemCardViewModelModule (copy), FFlagAXDurables2Option (copy), UseLocalizationFunction (copy), ASSETTYPELOCALIZED (copy), BUNDLETYPELOCALIZED (copy), config (copy), FFlagAXMISOffersChip (copy), OFFERSLOCALIZED (copy), ReactModule (copy), FFlagAXMISWithOffers (copy), PurchaseItemsErrorStatusMapModule (copy), WearTimeOptionButton (copy), FFlagAXGifting (copy), Constants (copy), UseAvatarItemGiftEligibilityFunction (copy), AvatarItemGiftEntryPoint (copy), CatalogRowItemCard (copy), ItemCardThumbnail (copy), FFlagAXMISSmallUIChanges (copy), WearTimeSelectedOptionInList (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local ThumbnailSize = Frame.thumbnailSize or UseTokensResult.Size.Size_2100
	local SelectedTimedOptionPrice = nil
	local SetSelectedTimedOptionPriceFunction = nil
	local ShowOfferPillTooltip = nil
	
	if FFlagAXDurablesForMIS then
		local UseCheckoutRowItemCardViewModelModuleResult = UseCheckoutRowItemCardViewModelModule(Frame)
		SelectedTimedOptionPrice = UseCheckoutRowItemCardViewModelModuleResult.selectedTimedOptionPrice
		SetSelectedTimedOptionPriceFunction = UseCheckoutRowItemCardViewModelModuleResult.setSelectedTimedOptionPrice
		ShowOfferPillTooltip = if FFlagAXDurables2Option then UseCheckoutRowItemCardViewModelModuleResult.showOfferPillTooltip else nil
	end
	local UseLocalizationResult = UseLocalizationFunction(ASSETTYPELOCALIZED)
	local UseLocalizationResult1 = UseLocalizationFunction(BUNDLETYPELOCALIZED)
	local UseLocalizationResult2 = UseLocalizationFunction(config)
	local UseLocalizationResult3 = if FFlagAXMISOffersChip then UseLocalizationFunction(OFFERSLOCALIZED) else nil
	local BundleThumbnail: string = if Frame.itemType == Enum.AvatarItemType.Bundle.Name then "BundleThumbnail" else "Asset"
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 103 ]]
		-- upvalues: Frame (copy), ASSETTYPELOCALIZED (upval), UseLocalizationResult (copy), BUNDLETYPELOCALIZED (upval), UseLocalizationResult1 (copy)
		local ItemType = Frame.itemType
		local ItemSubType = Frame.itemSubType
		
		if ItemType == Enum.AvatarItemType.Asset.Name and ASSETTYPELOCALIZED[tostring(ItemSubType)] ~= nil then
			return UseLocalizationResult[tostring(ItemSubType)]
		else
			local HasBUNDLETYPELOCALIZEDEntry: boolean = ItemType == Enum.AvatarItemType.Bundle.Name and BUNDLETYPELOCALIZED[tostring(ItemSubType)] ~= nil
			
			return if HasBUNDLETYPELOCALIZEDEntry then UseLocalizationResult1[tostring(ItemSubType)] else ""
		end
	end, {
		UseLocalizationResult,
		UseLocalizationResult1,
		Frame.itemType,
		Frame.itemSubType
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 116 ]]
		-- upvalues: Frame (copy), FFlagAXMISWithOffers (upval), PurchaseItemsErrorStatusMapModule (upval), UseTokensResult (copy), UseLocalizationResult2 (copy), config (upval)
		local List = {}
		
		if Frame.status == nil then
			table.insert(List, {
				type = "price",
				price = Frame.priceInRobux,
				priceInRobuxDiscountedByOffers = if FFlagAXMISWithOffers then Frame.priceInRobuxDiscountedByOffers else nil
			})
			
			if Frame.discountInformation and (not FFlagAXMISWithOffers or FFlagAXMISWithOffers and Frame.discountInformation.totalDiscountAmount and Frame.discountInformation.totalDiscountAmount > 0) then
				table.insert(List, {
					type = "price",
					strikethrough = true,
					isOriginalPrice = true,
					price = Frame.discountInformation.originalPrice,
					shouldShowOriginalPrice = if FFlagAXMISWithOffers then Frame.priceInRobuxDiscountedByOffers ~= nil else nil
				})
				
				return List
			end
		elseif Frame.status == PurchaseItemsErrorStatusMapModule.PRICE_MISMATCH then
			if not Frame.priceMismatchMetadata then
				table.insert(List, {
					type = "text",
					text = UseLocalizationResult2[tostring(PurchaseItemsErrorStatusMapModule.PRICE_MISMATCH)]
				})
				
				return List
			end
			table.insert(List, {
				type = "price",
				price = Frame.priceInRobux,
				priceInRobuxDiscountedByOffers = if FFlagAXMISWithOffers then Frame.priceInRobuxDiscountedByOffers else nil,
				colorStyle = UseTokensResult.Color.System.Warning
			})
			
			if not FFlagAXMISWithOffers or not Frame.priceInRobuxDiscountedByOffers then
				table.insert(List, {
					type = "price",
					strikethrough = true,
					price = Frame.priceMismatchMetadata.oldPriceInRobux
				})
				
				return List
			end
		else
			if Frame.status == PurchaseItemsErrorStatusMapModule.ALREADY_OWNED then
				table.insert(List, {
					type = "text",
					text = UseLocalizationResult2[tostring(PurchaseItemsErrorStatusMapModule.ALREADY_OWNED)]
				})
				
				return List
			end
			if Frame.status == PurchaseItemsErrorStatusMapModule.QUANTITY_LIMIT_EXCEEDED then
				table.insert(List, {
					type = "text",
					text = UseLocalizationResult2[tostring(PurchaseItemsErrorStatusMapModule.QUANTITY_LIMIT_EXCEEDED)]
				})
				
				return List
			end
			table.insert(List, {
				type = "text",
				text = if config[tostring(Frame.status)] then UseLocalizationResult2[tostring(Frame.status)] else UseLocalizationResult2.Unvailable,
				colorStyle = UseTokensResult.Color.System.Warning
			})
		end
		return List
	end, {
		Frame.priceInRobux, Frame.status, Frame.priceMismatchMetadata,
		UseLocalizationResult2, UseTokensResult, Frame.discountInformation,
		if FFlagAXMISWithOffers then Frame.priceInRobuxDiscountedByOffers else nil
	})
	local Element = if FFlagAXDurables2Option then ReactModule.createElement(FoundationModule.View, {
		tag = "row gap-medium align-y-center size-full-0 auto-y",
		LayoutOrder = 2
	}, (ReactModule.useMemo(function() --[[ Line: 206 ]]
		-- upvalues: Frame (copy), ReactModule (upval), FoundationModule (upval), WearTimeOptionButton (upval), SetSelectedTimedOptionPriceFunction (ref)
		local Elements = {}
		
		if Frame.timedOptions then
			for i, timedOption in Frame.timedOptions do
				if timedOption.days == 3 or timedOption.days == 0 then
					Elements[`Option{i}`] = ReactModule.createElement(FoundationModule.View, {
						tag = "fill auto-y padding-top-small",
						LayoutOrder = #Frame.timedOptions - i + 1
					}, {
						Button = ReactModule.createElement(WearTimeOptionButton, {
							isFullWidth = true,
							option = {
								days = timedOption.days,
								price = timedOption.price,
								discountInformation = timedOption.discountInformation,
								selected = if Frame.selectedTimedOptionIndexInReducer then i == Frame.selectedTimedOptionIndexInReducer else timedOption.selected,
								priceInRobuxDiscountedByOffers = Frame.priceInRobuxDiscountedByOffers
							},
							onActivated = function() --[[ Line: 226 ]]
								-- upvalues: Frame (upval), i (copy), SetSelectedTimedOptionPriceFunction (upval)
								local TimedOption = Frame.timedOptions[i]
								
								if TimedOption then
									if SetSelectedTimedOptionPriceFunction then
										SetSelectedTimedOptionPriceFunction(TimedOption.price)
									end
									if Frame.onTimedOptionPriceChanged then
										Frame.onTimedOptionPriceChanged(TimedOption.price, if TimedOption.days == 0 then nil else TimedOption.days)
									end
								end
							end
						})
					})
				end
			end
		end
		return Elements
	end, {
		Frame.timedOptions,
		Frame.onTimedOptionPriceChanged,
		Frame.selectedTimedOptionIndexInReducer,
		SetSelectedTimedOptionPriceFunction
	}))) else nil
	local CollectibleItemId = if FFlagAXGifting and Frame.itemId ~= Constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then Frame.collectibleItemId else nil
	local AreItemsGiftable = if FFlagAXGifting then UseAvatarItemGiftEligibilityFunction(CollectibleItemId).areItemsGiftable else false
	local Element1 = if AreItemsGiftable then ReactModule.createElement(AvatarItemGiftEntryPoint, {
		isCircular = true,
		LayoutOrder = 1,
		collectibleItemId = Frame.collectibleItemId
	}) else nil
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = if FFlagAXDurables2Option then "auto-y col size-full-0 gap-xxsmall" else "auto-y row size-full-0 gap-small",
		LayoutOrder = Frame.LayoutOrder,
		testId = `CheckoutRowItemCard-{Frame.itemId}`
	}, {
		RowItemCardContainer = if FFlagAXDurables2Option then nil else ReactModule.createElement(FoundationModule.View, { tag = "auto-xy fill", LayoutOrder = 1 }, {
			CatalogRowItemCard = ReactModule.createElement(CatalogRowItemCard, {
				title = Frame.name,
				presentationSlot = ReactModule.createElement(ItemCardThumbnail, {
					url = `rbxthumb://type={BundleThumbnail}&id={Frame.itemId}&w=150&h=150`
				}),
				onActivated = Frame.onActivated,
				creator = if FFlagAXMISSmallUIChanges then nil else {
					name = Frame.creatorName,
					verified = Frame.creatorVerified
				},
				priceLineContent = UseMemoResult1,
				itemType = Frame.itemRestriction,
				itemSubType = UseMemoResult,
				timedOptions = if FFlagAXDurablesForMIS then Frame.timedOptions else nil,
				expirationTime = if FFlagAXDurablesForMIS then Frame.expirationTime else nil,
				isOwned = if FFlagAXDurablesForMIS then Frame.isOwned else nil,
				onTimedOptionPriceChanged = if FFlagAXDurablesForMIS then Frame.onTimedOptionPriceChanged else nil,
				selectedTimedOptionPrice = if FFlagAXDurablesForMIS then SelectedTimedOptionPrice else nil,
				setSelectedTimedOptionPrice = if FFlagAXDurablesForMIS then SetSelectedTimedOptionPriceFunction else nil,
				selectedTimedOptionIndexInReducer = if FFlagAXDurablesForMIS then Frame.selectedTimedOptionIndexInReducer else nil,
				wearTimeSelectedOptionInList = if FFlagAXDurablesForMIS then WearTimeSelectedOptionInList else nil,
				headerSize = UDim2.fromOffset(ThumbnailSize, ThumbnailSize),
				footerSize = UDim2.fromScale(0, 1),
				footerAutomaticSize = Enum.AutomaticSize.XY,
				AutomaticSize = Enum.AutomaticSize.XY,
				offersLocalized = if FFlagAXMISOffersChip then UseLocalizationResult3 else nil,
				offerApplied = if FFlagAXMISOffersChip then Frame.offerApplied else nil
			})
		}),
		RightSlot = if FFlagAXDurables2Option then nil else ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 2,
			tag = if FFlagAXGifting then {
				["row self-center gap-small anchor-top-right auto-xy"] = true
			} else "auto-xy anchor-top-right self-center"
		}, {
			GiftButton = if FFlagAXGifting then Element1 else nil,
			RemoveButton = if Frame.onRemove then ReactModule.createElement(FoundationModule.IconButton, {
				icon = "x",
				isCircular = true,
				variant = FoundationModule.Enums.ButtonVariant.Standard,
				onActivated = Frame.onRemove,
				LayoutOrder = if FFlagAXGifting then 2 else nil
			}) else nil
		}),
		ItemRow = if FFlagAXDurables2Option then ReactModule.createElement(FoundationModule.View, {
			tag = "auto-y row size-full-0 gap-small",
			LayoutOrder = 1
		}, {
			RowItemCardContainer = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy fill", LayoutOrder = 1 }, {
				CatalogRowItemCard = ReactModule.createElement(CatalogRowItemCard, {
					hideTimedOptionSelections = true,
					title = Frame.name,
					presentationSlot = ReactModule.createElement(ItemCardThumbnail, {
						url = `rbxthumb://type={BundleThumbnail}&id={Frame.itemId}&w=150&h=150`
					}),
					onActivated = Frame.onActivated,
					onRemove = Frame.onRemove,
					giftButton = if FFlagAXGifting then Element1 else nil,
					creator = if FFlagAXMISSmallUIChanges then nil else {
						name = Frame.creatorName,
						verified = Frame.creatorVerified
					},
					priceLineContent = UseMemoResult1,
					itemStatusInCheckout = Frame.status,
					itemType = Frame.itemRestriction,
					itemSubType = UseMemoResult,
					timedOptions = if FFlagAXDurablesForMIS then Frame.timedOptions else nil,
					expirationTime = if FFlagAXDurablesForMIS then Frame.expirationTime else nil,
					isOwned = if FFlagAXDurablesForMIS then Frame.isOwned else nil,
					onTimedOptionPriceChanged = if FFlagAXDurablesForMIS then Frame.onTimedOptionPriceChanged else nil,
					selectedTimedOptionPrice = if FFlagAXDurablesForMIS then SelectedTimedOptionPrice else nil,
					setSelectedTimedOptionPrice = if FFlagAXDurablesForMIS then SetSelectedTimedOptionPriceFunction else nil,
					selectedTimedOptionIndexInReducer = if FFlagAXDurablesForMIS then Frame.selectedTimedOptionIndexInReducer else nil,
					wearTimeSelectedOptionInList = if FFlagAXDurablesForMIS then WearTimeSelectedOptionInList else nil,
					headerSize = UDim2.fromOffset(ThumbnailSize, ThumbnailSize),
					footerSize = UDim2.fromScale(0, 1),
					footerAutomaticSize = Enum.AutomaticSize.XY,
					AutomaticSize = Enum.AutomaticSize.XY,
					offersLocalized = UseLocalizationResult3,
					showOfferPillTooltip = ShowOfferPillTooltip,
					offerApplied = Frame.offerApplied
				})
			})
		}) else nil,
		OptionsButtonsView = if FFlagAXDurables2Option and (not Frame.isOwned or Frame.expirationTime ~= nil) then Element else nil,
		OptionsButtonsDivider = if FFlagAXDurables2Option then ReactModule.createElement(FoundationModule.View, {
			tag = "col size-full-0 auto-y padding-y-medium",
			LayoutOrder = 3
		}, {
			Divider = ReactModule.createElement(FoundationModule.Divider)
		}) else nil
	})
end, require(Parent.tutils).deepEqual)