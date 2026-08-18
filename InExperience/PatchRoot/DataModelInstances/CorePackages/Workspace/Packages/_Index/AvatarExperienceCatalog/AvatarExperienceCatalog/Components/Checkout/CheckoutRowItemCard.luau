local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local catalogRowItemCard = require(parent.AvatarExperienceCommon).Components.CatalogItemCard.CatalogRowItemCard
local itemCardThumbnail = require(parent.AvatarExperienceUIKit).ItemCardComponents.ItemCardThumbnail
local tutilsModule = require(parent.tutils)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local _ = require(avatarExperienceCatalog.Stores.createAXShoppingCartStore)
local purchaseItemsErrorStatusMapModule = require(avatarExperienceCatalog.Enums.PurchaseItemsErrorStatusMap)
local constantsModule = require(avatarExperienceCatalog.Constants)
local useCheckoutRowItemCardViewModelModule = require(script.Parent.useCheckoutRowItemCardViewModel)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXDurablesForMIS = avatarExperienceFlagsModule.FFlagAXDurablesForMIS
local fFlagAXDurables2Option = avatarExperienceFlagsModule.FFlagAXDurables2Option
local fFlagAXDurables2OptionFixes = avatarExperienceFlagsModule.FFlagAXDurables2OptionFixes
local fFlagAXMISSmallUIChanges = avatarExperienceFlagsModule.FFlagAXMISSmallUIChanges
local fFlagAXMISWithOffers = avatarExperienceFlagsModule.FFlagAXMISWithOffers
local fFlagAXAddLimitedLabelForCheckout = avatarExperienceFlagsModule.FFlagAXAddLimitedLabelForCheckout
local avatarExperienceTimedOptionsModule = require(parent.AvatarExperienceTimedOptions)
local wearTimeSelectedOptionInList = avatarExperienceTimedOptionsModule.WearTimeSelectedOptionInList
local wearTimeOptionButton = avatarExperienceTimedOptionsModule.WearTimeOptionButton
local ASSET_TYPE_LOCALIZED = constantsModule.ASSET_TYPE_LOCALIZED
local BUNDLE_TYPE_LOCALIZED = constantsModule.BUNDLE_TYPE_LOCALIZED
local OFFERS_LOCALIZED = constantsModule.OFFERS_LOCALIZED
local t = {
	[tostring(purchaseItemsErrorStatusMapModule.SOLD_OUT)] = "Feature.Catalog.Label.Checkout.SoldOut",
	[tostring(purchaseItemsErrorStatusMapModule.ALREADY_OWNED)] = "Feature.Catalog.Label.Owned",
	[tostring(purchaseItemsErrorStatusMapModule.EXPERIENCE_LINK)] = "Feature.Catalog.Label.Checkout.InExperienceOnly",
	[tostring(purchaseItemsErrorStatusMapModule.QUANTITY_LIMIT_EXCEEDED)] = "Feature.Catalog.Label.Checkout.LimitReached",
	[tostring(purchaseItemsErrorStatusMapModule.NOT_AVAILABLE_FOR_PURCHASER)] = "Feature.Catalog.Label.Checkout.Unavailable",
	[tostring(purchaseItemsErrorStatusMapModule.NOT_FOR_SALE)] = "Feature.Catalog.Label.Checkout.OffSale",
	[tostring(purchaseItemsErrorStatusMapModule.PURCHASER_IS_SELLER)] = "Feature.Catalog.Label.Checkout.Unavailable",
	[tostring(purchaseItemsErrorStatusMapModule.PURCHASE_PLACE_INVALID)] = "Feature.Catalog.Label.Checkout.InExperienceOnly",
	[tostring(purchaseItemsErrorStatusMapModule.PRICE_MISMATCH)] = "Feature.Catalog.Label.Checkout.PriceChanged",
	Unvailable = "Feature.Catalog.Label.Checkout.Unavailable"
}

local function _(value, p0) --[[ line: 50 | named "hasAssetTypeLocalizedString" ]]
	-- upvalues: ASSET_TYPE_LOCALIZED (ref)
	return value == Enum.AvatarItemType.Asset.Name and ASSET_TYPE_LOCALIZED[tostring(p0)] ~= nil
end

local _ = function(p1, p2) --[[ line: 54 | named "hasBundleTypeLocalizedString" ]]
	-- upvalues: BUNDLE_TYPE_LOCALIZED (ref)
	return p1 == Enum.AvatarItemType.Bundle.Name and BUNDLE_TYPE_LOCALIZED[tostring(p2)] ~= nil
end

local _ = function(p3) --[[ line: 58 | named "getThumbnailType" ]]
	return if p3 == Enum.AvatarItemType.Bundle.Name then "BundleThumbnail" else "Asset"
end

return reactModule.memo(function(p4) --[[ line: 75 | named "CheckoutRowItemCard" ]]
	-- upvalues: foundationModule (ref), fFlagAXDurablesForMIS (ref), useCheckoutRowItemCardViewModelModule (ref), fFlagAXDurables2Option (ref), useLocalization (ref), ASSET_TYPE_LOCALIZED (ref), BUNDLE_TYPE_LOCALIZED (ref), t (ref), OFFERS_LOCALIZED (ref), reactModule (ref), fFlagAXMISWithOffers (ref), purchaseItemsErrorStatusMapModule (ref), fFlagAXAddLimitedLabelForCheckout (ref), wearTimeOptionButton (ref), catalogRowItemCard (ref), itemCardThumbnail (ref), fFlagAXMISSmallUIChanges (ref), wearTimeSelectedOptionInList (ref), fFlagAXDurables2OptionFixes (ref)
	local var10 = foundationModule.Hooks.useTokens()
	local thumbnailSize = p4.thumbnailSize or var10.Size.Size_2100
	local selectedTimedOptionPrice = nil
	local setSelectedTimedOptionPrice = nil
	local var12 = nil
	
	if fFlagAXDurablesForMIS then
		local var13 = useCheckoutRowItemCardViewModelModule(p4)
		selectedTimedOptionPrice = var13.selectedTimedOptionPrice
		setSelectedTimedOptionPrice = var13.setSelectedTimedOptionPrice
		var12 = if fFlagAXDurables2Option then var13.showOfferPillTooltip else nil
	end
	local var14 = useLocalization(ASSET_TYPE_LOCALIZED)
	local var15 = useLocalization(BUNDLE_TYPE_LOCALIZED)
	local var16 = useLocalization(t)
	local var17 = if fFlagAXDurables2Option then useLocalization(OFFERS_LOCALIZED) else nil
	local var18 = if p4.itemType == Enum.AvatarItemType.Bundle.Name then "BundleThumbnail" else "Asset"
	local var19 = reactModule.useMemo(function() --[[ line: 97 ]]
		-- upvalues: p4 (ref), ASSET_TYPE_LOCALIZED (copy), var14 (ref), BUNDLE_TYPE_LOCALIZED (copy), var15 (ref)
		local itemType = p4.itemType
		local itemSubType = p4.itemSubType
		
		return if itemType == Enum.AvatarItemType.Asset.Name and ASSET_TYPE_LOCALIZED[tostring(itemSubType)] ~= nil then var14[tostring(itemSubType)] elseif itemType == Enum.AvatarItemType.Bundle.Name and BUNDLE_TYPE_LOCALIZED[tostring(itemSubType)] ~= nil then var15[tostring(itemSubType)] else ""
	end, { var14, var15, p4.itemType, p4.itemSubType })
	local var20 = reactModule.useMemo(function() --[[ line: 110 ]]
		-- upvalues: p4 (ref), fFlagAXMISWithOffers (copy), purchaseItemsErrorStatusMapModule (copy), var10 (ref), var16 (ref), fFlagAXAddLimitedLabelForCheckout (copy), t (copy)
		local t_1 = {}
		
		if p4.status == nil then
			table.insert(t_1, {
				type = "price",
				price = p4.priceInRobux,
				priceInRobuxDiscountedByOffers = if fFlagAXMISWithOffers then p4.priceInRobuxDiscountedByOffers else nil
			})
			
			if not p4.discountInformation or fFlagAXMISWithOffers and (not fFlagAXMISWithOffers or not p4.discountInformation.totalDiscountAmount or p4.discountInformation.totalDiscountAmount <= 0) then
				return t_1
			end
			local var23
			local t_2 = {
				type = "price",
				strikethrough = true,
				isOriginalPrice = true,
				price = p4.discountInformation.originalPrice
			}
			
			if fFlagAXMISWithOffers then
				var23 = p4.priceInRobuxDiscountedByOffers ~= nil
				var23 = nil
			else
				var23 = nil
			end
			t_2.shouldShowOriginalPrice = var23
			table.insert(t_1, t_2)
			
			return t_1
		elseif p4.status == purchaseItemsErrorStatusMapModule.PRICE_MISMATCH then
			if p4.priceMismatchMetadata then
				table.insert(t_1, {
					type = "price",
					price = p4.priceInRobux,
					priceInRobuxDiscountedByOffers = if fFlagAXMISWithOffers then p4.priceInRobuxDiscountedByOffers else nil,
					colorStyle = var10.Color.System.Warning
				})
				
				if fFlagAXMISWithOffers and p4.priceInRobuxDiscountedByOffers then
				else
					table.insert(t_1, {
						type = "price",
						strikethrough = true,
						price = p4.priceMismatchMetadata.oldPriceInRobux
					})
					
					return t_1
				end
			else
				table.insert(t_1, {
					type = "text",
					text = var16[tostring(purchaseItemsErrorStatusMapModule.PRICE_MISMATCH)]
				})
				
				return t_1
			end
		elseif p4.status == purchaseItemsErrorStatusMapModule.ALREADY_OWNED then
			table.insert(t_1, {
				type = "text",
				text = var16[tostring(purchaseItemsErrorStatusMapModule.ALREADY_OWNED)]
			})
			
			return t_1
		elseif fFlagAXAddLimitedLabelForCheckout and p4.status == purchaseItemsErrorStatusMapModule.QUANTITY_LIMIT_EXCEEDED then
			table.insert(t_1, {
				type = "text",
				text = var16[tostring(purchaseItemsErrorStatusMapModule.QUANTITY_LIMIT_EXCEEDED)]
			})
			
			return t_1
		end
		table.insert(t_1, {
			type = "text",
			text = if t[tostring(p4.status)] then var16[tostring(p4.status)] else var16.Unvailable,
			colorStyle = var10.Color.System.Warning
		})
	end, {
		p4.priceInRobux, p4.status, p4.priceMismatchMetadata, var16, var10,
		p4.discountInformation,
		if fFlagAXMISWithOffers then p4.priceInRobuxDiscountedByOffers else nil
	})
	
	return reactModule.createElement(foundationModule.View, {
		tag = if fFlagAXDurables2Option then "auto-y col size-full-0 gap-xxsmall" else "auto-y row size-full-0 gap-small",
		LayoutOrder = p4.LayoutOrder,
		testId = `CheckoutRowItemCard-{p4.itemId}`
	}, {
		RowItemCardContainer = if not fFlagAXDurables2Option then reactModule.createElement(foundationModule.View, { tag = "auto-xy fill", LayoutOrder = 1 }, {
			CatalogRowItemCard = reactModule.createElement(catalogRowItemCard, {
				title = p4.name,
				presentationSlot = reactModule.createElement(itemCardThumbnail, {
					url = `rbxthumb://type={var18}&id={p4.itemId}&w=150&h=150`
				}),
				onActivated = p4.onActivated,
				creator = if fFlagAXMISSmallUIChanges then nil else { name = p4.creatorName, verified = p4.creatorVerified },
				priceLineContent = var20,
				itemType = p4.itemRestriction,
				itemSubType = var19,
				timedOptions = if fFlagAXDurablesForMIS then p4.timedOptions else nil,
				expirationTime = if fFlagAXDurablesForMIS then p4.expirationTime else nil,
				isOwned = if fFlagAXDurablesForMIS then p4.isOwned else nil,
				onTimedOptionPriceChanged = if fFlagAXDurablesForMIS then p4.onTimedOptionPriceChanged else nil,
				selectedTimedOptionPrice = if fFlagAXDurablesForMIS then selectedTimedOptionPrice else nil,
				setSelectedTimedOptionPrice = if fFlagAXDurablesForMIS then setSelectedTimedOptionPrice else nil,
				selectedTimedOptionIndexInReducer = if fFlagAXDurablesForMIS then p4.selectedTimedOptionIndexInReducer else nil,
				wearTimeSelectedOptionInList = if fFlagAXDurablesForMIS then wearTimeSelectedOptionInList else nil,
				headerSize = UDim2.fromOffset(thumbnailSize, thumbnailSize),
				footerSize = UDim2.fromScale(0, 1),
				footerAutomaticSize = Enum.AutomaticSize.XY,
				AutomaticSize = Enum.AutomaticSize.XY
			})
		}) else nil,
		RightSlot = if not fFlagAXDurables2Option then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy anchor-top-right self-center",
			LayoutOrder = 2
		}, {
			RemoveButton = if p4.onRemove then reactModule.createElement(foundationModule.IconButton, {
				icon = "x",
				isCircular = true,
				variant = foundationModule.Enums.ButtonVariant.Standard,
				onActivated = p4.onRemove
			}) else nil
		}) else nil,
		ItemRow = if fFlagAXDurables2Option then reactModule.createElement(foundationModule.View, {
			tag = "auto-y row size-full-0 gap-small",
			LayoutOrder = 1
		}, {
			RowItemCardContainer = reactModule.createElement(foundationModule.View, { tag = "auto-xy fill", LayoutOrder = 1 }, {
				CatalogRowItemCard = reactModule.createElement(catalogRowItemCard, {
					hideTimedOptionSelections = true,
					title = p4.name,
					presentationSlot = reactModule.createElement(itemCardThumbnail, {
						url = `rbxthumb://type={var18}&id={p4.itemId}&w=150&h=150`
					}),
					onActivated = p4.onActivated,
					onRemove = p4.onRemove,
					creator = if fFlagAXMISSmallUIChanges then nil else { name = p4.creatorName, verified = p4.creatorVerified },
					priceLineContent = var20,
					itemStatusInCheckout = p4.status,
					itemType = p4.itemRestriction,
					itemSubType = var19,
					timedOptions = if fFlagAXDurablesForMIS then p4.timedOptions else nil,
					expirationTime = if fFlagAXDurablesForMIS then p4.expirationTime else nil,
					isOwned = if fFlagAXDurablesForMIS then p4.isOwned else nil,
					onTimedOptionPriceChanged = if fFlagAXDurablesForMIS then p4.onTimedOptionPriceChanged else nil,
					selectedTimedOptionPrice = if fFlagAXDurablesForMIS then selectedTimedOptionPrice else nil,
					setSelectedTimedOptionPrice = if fFlagAXDurablesForMIS then setSelectedTimedOptionPrice else nil,
					selectedTimedOptionIndexInReducer = if fFlagAXDurablesForMIS then p4.selectedTimedOptionIndexInReducer else nil,
					wearTimeSelectedOptionInList = if fFlagAXDurablesForMIS then wearTimeSelectedOptionInList else nil,
					headerSize = UDim2.fromOffset(thumbnailSize, thumbnailSize),
					footerSize = UDim2.fromScale(0, 1),
					footerAutomaticSize = Enum.AutomaticSize.XY,
					AutomaticSize = Enum.AutomaticSize.XY,
					offersLocalized = var17,
					showOfferPillTooltip = var12,
					offerApplied = p4.offerApplied
				})
			})
		}) else nil,
		OptionsButtonsView = if not fFlagAXDurables2Option then if fFlagAXDurables2OptionFixes and p4.isOwned and p4.expirationTime == nil then nil elseif fFlagAXDurables2Option then reactModule.createElement(foundationModule.View, {
			tag = "row gap-medium align-y-center size-full-0 auto-y",
			LayoutOrder = 2
		}, reactModule.useMemo(function() --[[ line: 203 ]]
			-- upvalues: p4 (ref), reactModule (copy), foundationModule (copy), wearTimeOptionButton (copy), setSelectedTimedOptionPrice (write)
			local t = {}
			
			if p4.timedOptions then
				for i, v in p4.timedOptions do
					if v.days == 3 or v.days == 0 then
						local var31
						local var25 = `Option{i}`
						local createElement = reactModule.createElement
						local view = foundationModule.View
						local t_1 = {
							tag = "fill auto-y padding-top-small",
							LayoutOrder = #p4.timedOptions - i + 1
						}
						local t_2 = {}
						local createElement_1 = reactModule.createElement
						local var28 = wearTimeOptionButton
						local t_3 = { isFullWidth = true }
						local t_4 = {
							days = v.days,
							price = v.price,
							discountInformation = v.discountInformation
						}
						
						if p4.selectedTimedOptionIndexInReducer then
							var31 = i == p4.selectedTimedOptionIndexInReducer
							var31 = nil
						else
							var31 = v.selected
						end
						t_4.selected = var31
						t_4.priceInRobuxDiscountedByOffers = p4.priceInRobuxDiscountedByOffers
						t_3.option = t_4
						
						function t_3.onActivated() --[[ line: 223 ]]
							-- upvalues: p4 (copy), i (ref), setSelectedTimedOptionPrice (copy)
							local var32 = p4.timedOptions[i]
							
							if var32 then
								if setSelectedTimedOptionPrice then
									setSelectedTimedOptionPrice(var32.price)
								end
								if p4.onTimedOptionPriceChanged then
									p4.onTimedOptionPriceChanged(var32.price, if var32.days == 0 then nil else var32.days)
								end
							end
						end
						
						t_2.Button = createElement_1(var28, t_3)
						t[var25] = createElement(view, t_1, t_2)
					end
				end
			end
			return t
		end, {
			p4.timedOptions,
			p4.onTimedOptionPriceChanged,
			p4.selectedTimedOptionIndexInReducer,
			setSelectedTimedOptionPrice
		})) else nil else nil,
		OptionsButtonsDivider = if fFlagAXDurables2Option then reactModule.createElement(foundationModule.View, {
			tag = "col size-full-0 auto-y padding-y-medium",
			LayoutOrder = 3
		}, {
			Divider = reactModule.createElement(foundationModule.Divider)
		}) else nil
	})
end, tutilsModule.deepEqual)