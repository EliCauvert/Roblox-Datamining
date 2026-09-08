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
local fFlagAXMISSmallUIChanges = avatarExperienceFlagsModule.FFlagAXMISSmallUIChanges
local fFlagAXMISWithOffers = avatarExperienceFlagsModule.FFlagAXMISWithOffers
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

local function _(value, p1)
	-- upvalues: ASSET_TYPE_LOCALIZED (ref)
	return value == Enum.AvatarItemType.Asset.Name and ASSET_TYPE_LOCALIZED[tostring(p1)] ~= nil
end

local _ = function(p1, p2)
	-- upvalues: BUNDLE_TYPE_LOCALIZED (ref)
	return p1 == Enum.AvatarItemType.Bundle.Name and BUNDLE_TYPE_LOCALIZED[tostring(p2)] ~= nil
end

local _ = function(p1)
	return if p1 == Enum.AvatarItemType.Bundle.Name then "BundleThumbnail" else "Asset"
end

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), fFlagAXDurablesForMIS (ref), useCheckoutRowItemCardViewModelModule (ref), fFlagAXDurables2Option (ref), useLocalization (ref), ASSET_TYPE_LOCALIZED (ref), BUNDLE_TYPE_LOCALIZED (ref), t (ref), OFFERS_LOCALIZED (ref), reactModule (ref), fFlagAXMISWithOffers (ref), purchaseItemsErrorStatusMapModule (ref), wearTimeOptionButton (ref), catalogRowItemCard (ref), itemCardThumbnail (ref), fFlagAXMISSmallUIChanges (ref), wearTimeSelectedOptionInList (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local thumbnailSize = p1.thumbnailSize or var1.Size.Size_2100
	local selectedTimedOptionPrice = nil
	local setSelectedTimedOptionPrice = nil
	local var2 = nil
	
	if fFlagAXDurablesForMIS then
		local var3 = useCheckoutRowItemCardViewModelModule(p1)
		selectedTimedOptionPrice = var3.selectedTimedOptionPrice
		setSelectedTimedOptionPrice = var3.setSelectedTimedOptionPrice
		var2 = if fFlagAXDurables2Option then var3.showOfferPillTooltip else nil
	end
	local var4 = useLocalization(ASSET_TYPE_LOCALIZED)
	local var5 = useLocalization(BUNDLE_TYPE_LOCALIZED)
	local var6 = useLocalization(t)
	local var7 = if fFlagAXDurables2Option then useLocalization(OFFERS_LOCALIZED) else nil
	local var8 = if p1.itemType == Enum.AvatarItemType.Bundle.Name then "BundleThumbnail" else "Asset"
	local var9 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), ASSET_TYPE_LOCALIZED (copy), var4 (ref), BUNDLE_TYPE_LOCALIZED (copy), var5 (ref)
		local itemType = p1.itemType
		local itemSubType = p1.itemSubType
		
		return if itemType == Enum.AvatarItemType.Asset.Name and ASSET_TYPE_LOCALIZED[tostring(itemSubType)] ~= nil then var4[tostring(itemSubType)] elseif itemType == Enum.AvatarItemType.Bundle.Name and BUNDLE_TYPE_LOCALIZED[tostring(itemSubType)] ~= nil then var5[tostring(itemSubType)] else ""
	end, { var4, var5, p1.itemType, p1.itemSubType })
	local var10 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), fFlagAXMISWithOffers (copy), purchaseItemsErrorStatusMapModule (copy), var1 (ref), var6 (ref), t (copy)
		local t_1 = {}
		
		if p1.status == nil then
			table.insert(t_1, {
				type = "price",
				price = p1.priceInRobux,
				priceInRobuxDiscountedByOffers = if fFlagAXMISWithOffers then p1.priceInRobuxDiscountedByOffers else nil
			})
			
			if not p1.discountInformation or fFlagAXMISWithOffers and (not fFlagAXMISWithOffers or not p1.discountInformation.totalDiscountAmount or p1.discountInformation.totalDiscountAmount <= 0) then
				return t_1
			end
			local var11
			local t_2 = {
				type = "price",
				strikethrough = true,
				isOriginalPrice = true,
				price = p1.discountInformation.originalPrice
			}
			
			if fFlagAXMISWithOffers then
				var11 = p1.priceInRobuxDiscountedByOffers ~= nil
				var11 = nil
			else
				var11 = nil
			end
			t_2.shouldShowOriginalPrice = var11
			table.insert(t_1, t_2)
			
			return t_1
		elseif p1.status == purchaseItemsErrorStatusMapModule.PRICE_MISMATCH then
			if p1.priceMismatchMetadata then
				table.insert(t_1, {
					type = "price",
					price = p1.priceInRobux,
					priceInRobuxDiscountedByOffers = if fFlagAXMISWithOffers then p1.priceInRobuxDiscountedByOffers else nil,
					colorStyle = var1.Color.System.Warning
				})
				
				if fFlagAXMISWithOffers and p1.priceInRobuxDiscountedByOffers then
				else
					table.insert(t_1, {
						type = "price",
						strikethrough = true,
						price = p1.priceMismatchMetadata.oldPriceInRobux
					})
					
					return t_1
				end
			else
				table.insert(t_1, {
					type = "text",
					text = var6[tostring(purchaseItemsErrorStatusMapModule.PRICE_MISMATCH)]
				})
				
				return t_1
			end
		elseif p1.status == purchaseItemsErrorStatusMapModule.ALREADY_OWNED then
			table.insert(t_1, {
				type = "text",
				text = var6[tostring(purchaseItemsErrorStatusMapModule.ALREADY_OWNED)]
			})
			
			return t_1
		elseif p1.status == purchaseItemsErrorStatusMapModule.QUANTITY_LIMIT_EXCEEDED then
			table.insert(t_1, {
				type = "text",
				text = var6[tostring(purchaseItemsErrorStatusMapModule.QUANTITY_LIMIT_EXCEEDED)]
			})
			
			return t_1
		end
		table.insert(t_1, {
			type = "text",
			text = if t[tostring(p1.status)] then var6[tostring(p1.status)] else var6.Unvailable,
			colorStyle = var1.Color.System.Warning
		})
	end, {
		p1.priceInRobux, p1.status, p1.priceMismatchMetadata, var6, var1,
		p1.discountInformation,
		if fFlagAXMISWithOffers then p1.priceInRobuxDiscountedByOffers else nil
	})
	
	return reactModule.createElement(foundationModule.View, {
		tag = if fFlagAXDurables2Option then "auto-y col size-full-0 gap-xxsmall" else "auto-y row size-full-0 gap-small",
		LayoutOrder = p1.LayoutOrder,
		testId = `CheckoutRowItemCard-{p1.itemId}`
	}, {
		RowItemCardContainer = if not fFlagAXDurables2Option then reactModule.createElement(foundationModule.View, { tag = "auto-xy fill", LayoutOrder = 1 }, {
			CatalogRowItemCard = reactModule.createElement(catalogRowItemCard, {
				title = p1.name,
				presentationSlot = reactModule.createElement(itemCardThumbnail, {
					url = `rbxthumb://type={var8}&id={p1.itemId}&w=150&h=150`
				}),
				onActivated = p1.onActivated,
				creator = if fFlagAXMISSmallUIChanges then nil else { name = p1.creatorName, verified = p1.creatorVerified },
				priceLineContent = var10,
				itemType = p1.itemRestriction,
				itemSubType = var9,
				timedOptions = if fFlagAXDurablesForMIS then p1.timedOptions else nil,
				expirationTime = if fFlagAXDurablesForMIS then p1.expirationTime else nil,
				isOwned = if fFlagAXDurablesForMIS then p1.isOwned else nil,
				onTimedOptionPriceChanged = if fFlagAXDurablesForMIS then p1.onTimedOptionPriceChanged else nil,
				selectedTimedOptionPrice = if fFlagAXDurablesForMIS then selectedTimedOptionPrice else nil,
				setSelectedTimedOptionPrice = if fFlagAXDurablesForMIS then setSelectedTimedOptionPrice else nil,
				selectedTimedOptionIndexInReducer = if fFlagAXDurablesForMIS then p1.selectedTimedOptionIndexInReducer else nil,
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
			RemoveButton = if p1.onRemove then reactModule.createElement(foundationModule.IconButton, {
				icon = "x",
				isCircular = true,
				variant = foundationModule.Enums.ButtonVariant.Standard,
				onActivated = p1.onRemove
			}) else nil
		}) else nil,
		ItemRow = if fFlagAXDurables2Option then reactModule.createElement(foundationModule.View, {
			tag = "auto-y row size-full-0 gap-small",
			LayoutOrder = 1
		}, {
			RowItemCardContainer = reactModule.createElement(foundationModule.View, { tag = "auto-xy fill", LayoutOrder = 1 }, {
				CatalogRowItemCard = reactModule.createElement(catalogRowItemCard, {
					hideTimedOptionSelections = true,
					title = p1.name,
					presentationSlot = reactModule.createElement(itemCardThumbnail, {
						url = `rbxthumb://type={var8}&id={p1.itemId}&w=150&h=150`
					}),
					onActivated = p1.onActivated,
					onRemove = p1.onRemove,
					creator = if fFlagAXMISSmallUIChanges then nil else { name = p1.creatorName, verified = p1.creatorVerified },
					priceLineContent = var10,
					itemStatusInCheckout = p1.status,
					itemType = p1.itemRestriction,
					itemSubType = var9,
					timedOptions = if fFlagAXDurablesForMIS then p1.timedOptions else nil,
					expirationTime = if fFlagAXDurablesForMIS then p1.expirationTime else nil,
					isOwned = if fFlagAXDurablesForMIS then p1.isOwned else nil,
					onTimedOptionPriceChanged = if fFlagAXDurablesForMIS then p1.onTimedOptionPriceChanged else nil,
					selectedTimedOptionPrice = if fFlagAXDurablesForMIS then selectedTimedOptionPrice else nil,
					setSelectedTimedOptionPrice = if fFlagAXDurablesForMIS then setSelectedTimedOptionPrice else nil,
					selectedTimedOptionIndexInReducer = if fFlagAXDurablesForMIS then p1.selectedTimedOptionIndexInReducer else nil,
					wearTimeSelectedOptionInList = if fFlagAXDurablesForMIS then wearTimeSelectedOptionInList else nil,
					headerSize = UDim2.fromOffset(thumbnailSize, thumbnailSize),
					footerSize = UDim2.fromScale(0, 1),
					footerAutomaticSize = Enum.AutomaticSize.XY,
					AutomaticSize = Enum.AutomaticSize.XY,
					offersLocalized = var7,
					showOfferPillTooltip = var2,
					offerApplied = p1.offerApplied
				})
			})
		}) else nil,
		OptionsButtonsView = if fFlagAXDurables2Option and (not p1.isOwned or p1.expirationTime ~= nil) then if fFlagAXDurables2Option then reactModule.createElement(foundationModule.View, {
			tag = "row gap-medium align-y-center size-full-0 auto-y",
			LayoutOrder = 2
		}, reactModule.useMemo(function()
			-- upvalues: p1 (ref), reactModule (copy), foundationModule (copy), wearTimeOptionButton (copy), setSelectedTimedOptionPrice (write)
			local t = {}
			
			if p1.timedOptions then
				for i, v in p1.timedOptions do
					if v.days == 3 or v.days == 0 then
						local var11
						local var12 = `Option{i}`
						local createElement = reactModule.createElement
						local view = foundationModule.View
						local t_1 = {
							tag = "fill auto-y padding-top-small",
							LayoutOrder = #p1.timedOptions - i + 1
						}
						local t_2 = {}
						local createElement_1 = reactModule.createElement
						local var13 = wearTimeOptionButton
						local t_3 = { isFullWidth = true }
						local t_4 = {
							days = v.days,
							price = v.price,
							discountInformation = v.discountInformation
						}
						
						if p1.selectedTimedOptionIndexInReducer then
							var11 = i == p1.selectedTimedOptionIndexInReducer
							var11 = nil
						else
							var11 = v.selected
						end
						t_4.selected = var11
						t_4.priceInRobuxDiscountedByOffers = p1.priceInRobuxDiscountedByOffers
						t_3.option = t_4
						
						function t_3.onActivated()
							-- upvalues: p1 (copy), i (ref), setSelectedTimedOptionPrice (copy)
							local var14 = p1.timedOptions[i]
							
							if var14 then
								if setSelectedTimedOptionPrice then
									setSelectedTimedOptionPrice(var14.price)
								end
								if p1.onTimedOptionPriceChanged then
									p1.onTimedOptionPriceChanged(var14.price, if var14.days == 0 then nil else var14.days)
								end
							end
						end
						
						t_2.Button = createElement_1(var13, t_3)
						t[var12] = createElement(view, t_1, t_2)
					end
				end
			end
			return t
		end, {
			p1.timedOptions,
			p1.onTimedOptionPriceChanged,
			p1.selectedTimedOptionIndexInReducer,
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