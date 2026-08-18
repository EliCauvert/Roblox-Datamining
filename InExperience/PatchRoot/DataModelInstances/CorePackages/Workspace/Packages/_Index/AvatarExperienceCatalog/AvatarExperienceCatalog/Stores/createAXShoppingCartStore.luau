local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local signalsModule = require(parent.Signals)
local tutilsModule = require(parent.tutils)
local avatarExperienceCommonModule = require(parent.AvatarExperienceCommon)
local purchaseItemsErrorStatusMapModule = require(avatarExperienceCatalog.Enums.PurchaseItemsErrorStatusMap)
local cryoModule = require(parent.Cryo)
local sharedFlagsModule = require(parent.SharedFlags)
local itemTileEnums = require(parent.UIBlox).Tile.ItemTileEnums
local getTryOnItemReducerKey = avatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local constants = avatarExperienceCommonModule.Constants
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXDurablesForMIS = avatarExperienceFlagsModule.FFlagAXDurablesForMIS
local fFlagAXMISWithBlackbird = sharedFlagsModule.FFlagAXMISWithBlackbird
local fFlagAXMISSmallUIChanges = avatarExperienceFlagsModule.FFlagAXMISSmallUIChanges
local fFlagAXMISWithOffers = avatarExperienceFlagsModule.FFlagAXMISWithOffers
local fFlagAXAddLimitedLabelForCheckout = avatarExperienceFlagsModule.FFlagAXAddLimitedLabelForCheckout
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local getItemPurchaseActionType = avatarExperienceCommonModule.Utils.getItemPurchaseActionType
local itemPurchaseActionTypeEnum = avatarExperienceCommonModule.Enums.ItemPurchaseActionTypeEnum

local function _(p0) --[[ line: 28 | named "getItemRestrictionFromItemData" ]]
	-- upvalues: itemTileEnums (ref)
	local var9 = if p0 then p0.tileRestrictionsMap else nil
	
	if var9 then
		return if var9[itemTileEnums.Restriction.Limited] then "Limited" elseif var9[itemTileEnums.Restriction.LimitedUnique] or var9[itemTileEnums.Restriction.Collectible] then "Collectible" else nil
	end
end

local _ = {
	UNKNOWN = "UNKNOWN",
	PENDING = "PENDING",
	RESERVED = "RESERVED",
	SUCCEEDED = "SUCCEEDED",
	FAILED = "FAILED"
}

local function getItemCartData(p1, p2) --[[ line: 118 ]]
	-- upvalues: constants (ref), fFlagAXMISWithOffers (ref), fFlagAXMISSmallUIChanges (ref), purchaseItemsErrorStatusMapModule (ref), tutilsModule (ref), getItemPurchaseActionType (ref), itemPurchaseActionTypeEnum (ref), fFlagAXAddLimitedLabelForCheckout (ref), fFlagAXDurablesForMIS (ref), itemTileEnums (ref)
	if p1.itemId == constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
		return {
			itemSubType = "1",
			priceInRobux = 0,
			name = "Default Body",
			isOwned = true,
			itemId = p1.itemId,
			collectibleItemId = if fFlagAXMISWithOffers then "n/a" else nil,
			itemType = p1.itemType,
			ordering = p1.ordering,
			creatorName = if fFlagAXMISSmallUIChanges then nil else "Roblox",
			creatorVerified = if fFlagAXMISSmallUIChanges then nil else true,
			collectibleProductId = p1.itemId,
			status = purchaseItemsErrorStatusMapModule.ALREADY_OWNED
		}
	end
	local itemData = p1.itemData
	local collectibleItemId = p1.collectibleItemId
	local collectibleItemInfo = p1.collectibleItemInfo
	local resellableInstances = p1.resellableInstances
	local var10 = getItemPurchaseActionType(itemData, collectibleItemInfo, if resellableInstances then tutilsModule.fieldCount(resellableInstances) else 0, not (p2 and collectibleItemId))
	local var11 = var10 == itemPurchaseActionTypeEnum.PurchaseFromResale
	local var12 = if var11 then itemData.lowestResalePrice else itemData.priceInRobux
	local var13 = if collectibleItemInfo then if var11 then collectibleItemInfo.lowestAvailableResaleProductId else collectibleItemInfo.collectibleProductId else nil
	local var14 = if p1.itemType == Enum.AvatarItemType.Asset.Name then itemData.assetType else itemData.bundleType
	local creator = itemData.creator or {}
	local name = creator.name
	local hasVerifiedBadge = creator.hasVerifiedBadge
	local name_1 = itemData.name
	local QUANTITY_LIMIT_EXCEEDED = nil
	
	if var10 == itemPurchaseActionTypeEnum.SoldOut then
		QUANTITY_LIMIT_EXCEEDED = purchaseItemsErrorStatusMapModule.SOLD_OUT
	elseif var10 == itemPurchaseActionTypeEnum.CustomizeLink then
		QUANTITY_LIMIT_EXCEEDED = purchaseItemsErrorStatusMapModule.ALREADY_OWNED
	elseif var10 == itemPurchaseActionTypeEnum.ExperienceLink then
		QUANTITY_LIMIT_EXCEEDED = purchaseItemsErrorStatusMapModule.EXPERIENCE_LINK
	elseif var10 == itemPurchaseActionTypeEnum.Disabled then
		QUANTITY_LIMIT_EXCEEDED = purchaseItemsErrorStatusMapModule.NOT_FOR_SALE
	elseif fFlagAXAddLimitedLabelForCheckout and var10 == itemPurchaseActionTypeEnum.QuantityLimitExceeded then
		QUANTITY_LIMIT_EXCEEDED = purchaseItemsErrorStatusMapModule.QUANTITY_LIMIT_EXCEEDED
	end
	local days = nil
	
	if fFlagAXDurablesForMIS and itemData.timedOptions then
		if p1.selectedTimedOptionIndex == nil then
			for i, v in itemData.timedOptions do
				if v.selected then
					days = v.days
					var12 = v.price
					break
				end
			end
		else
			local selectedTimedOptionIndex = itemData.timedOptions[p1.selectedTimedOptionIndex]
			
			if selectedTimedOptionIndex then
				days = selectedTimedOptionIndex.days
				var12 = selectedTimedOptionIndex.price
			end
		end
	end
	local var18
	local t = {
		itemId = p1.itemId,
		itemType = p1.itemType,
		expirationTime = itemData.expirationTime,
		isOwned = itemData.isOwned,
		discountInformation = itemData.discountInformation,
		itemSubType = var14
	}
	local var17 = if itemData then itemData.tileRestrictionsMap else nil
	
	if var17 then
		var18 = if var17[itemTileEnums.Restriction.Limited] then "Limited" elseif var17[itemTileEnums.Restriction.LimitedUnique] or var17[itemTileEnums.Restriction.Collectible] then "Collectible" else nil
	end
	t.itemRestriction = var18
	t.ordering = p1.ordering
	t.creatorName = if fFlagAXMISSmallUIChanges then nil else name
	t.creatorVerified = if fFlagAXMISSmallUIChanges then nil else hasVerifiedBadge
	t.collectibleProductId = var13
	t.collectibleItemId = if fFlagAXMISWithOffers then collectibleItemId else nil
	t.status = QUANTITY_LIMIT_EXCEEDED
	t.priceInRobux = var12
	t.name = name_1
	t.timedOptions = if fFlagAXDurablesForMIS then itemData.timedOptions else nil
	t.selectedTimedOptionDays = if fFlagAXDurablesForMIS then days else nil
	t.selectedTimedOptionIndexInReducer = if fFlagAXDurablesForMIS then p1.selectedTimedOptionIndex else nil
	
	return t
end

local _ = function(p3, p4) --[[ line: 225 | named "areCartItemsDifferent" ]]
	-- upvalues: tutilsModule (ref)
	if tutilsModule.fieldCount(p3) ~= tutilsModule.fieldCount(p4) then
		return true
	end
	for i, v in p4 do
		if p3[i] == nil then
			return true
		end
	end
	return false
end

return function() --[[ line: 240 | named "createAXShoppingCartStore" ]]
	-- upvalues: createSignal (ref), fFlagAXMISWithBlackbird (ref), createComputed (ref), purchaseItemsErrorStatusMapModule (ref), tutilsModule (ref), getTryOnItemReducerKey (ref), getItemCartData (ref), cryoModule (ref), fFlagAXDurablesForMIS (ref)
	local var19, var20 = createSignal({})
	local var21, var22 = createSignal(0)
	local var23 = nil
	local var24 = nil
	
	if fFlagAXMISWithBlackbird then
		local var25, var26 = createSignal({})
		var23 = var25
		var24 = var26
	end
	return {
		getCanPurchase = createComputed(function(p5) --[[ line: 285 ]]
			-- upvalues: var19 (ref), purchaseItemsErrorStatusMapModule (copy), tutilsModule (copy)
			local var27 = var19(p5)
			local var28 = 0
			
			for i, v in var27 do
				if v.status == purchaseItemsErrorStatusMapModule.ALREADY_OWNED then
					var28 += 1
				end
				if v.status ~= nil and v.status ~= purchaseItemsErrorStatusMapModule.ALREADY_OWNED and v.status ~= purchaseItemsErrorStatusMapModule.PRICE_MISMATCH then
					return false
				end
			end
			return var28 ~= tutilsModule.fieldCount(var27)
		end),
		getErroredItemCount = createComputed(function(p6) --[[ line: 248 ]]
			-- upvalues: var21 (ref)
			return var21(p6)
		end),
		getItems = createComputed(function(p7) --[[ line: 258 ]]
			-- upvalues: var19 (ref), purchaseItemsErrorStatusMapModule (copy)
			local t = {}
			
			for i, v in var19(p7) do
				table.insert(t, v)
			end
			table.sort(t, function(p8, p9) --[[ line: 267 ]]
				-- upvalues: purchaseItemsErrorStatusMapModule (copy)
				return if p8.status == purchaseItemsErrorStatusMapModule.ALREADY_OWNED and p9.status ~= purchaseItemsErrorStatusMapModule.ALREADY_OWNED then false else p9.status == purchaseItemsErrorStatusMapModule.ALREADY_OWNED and p8.status ~= purchaseItemsErrorStatusMapModule.ALREADY_OWNED or p9.ordering < p8.ordering
			end)
			
			return t
		end, tutilsModule.deepEqual),
		getDiscounts = if fFlagAXMISWithBlackbird then if fFlagAXMISWithBlackbird then createComputed(function(p10) --[[ line: 253 ]]
			-- upvalues: var23 (write)
			return var23(p10)
		end) else nil else nil,
		getPurchasableItemsTotalPriceInRobux = createComputed(function(p11) --[[ line: 319 ]]
			-- upvalues: var19 (ref), purchaseItemsErrorStatusMapModule (copy)
			local var30 = 0
			
			for i, v in var19(p11) do
				if v.status ~= purchaseItemsErrorStatusMapModule.ALREADY_OWNED then
					var30 += v.priceInRobux
				end
			end
			return var30
		end),
		getPurchasableItemsTotalOriginalPriceInRobux = createComputed(function(p12) --[[ line: 331 ]]
			-- upvalues: var19 (ref), purchaseItemsErrorStatusMapModule (copy)
			local var32
			local var31 = 0
			
			for i, v in var19(p12) do
				if v.status ~= purchaseItemsErrorStatusMapModule.ALREADY_OWNED then
					if not v.discountInformation then
						var31 += v.priceInRobux
					elseif v.selectedTimedOptionDays == nil or not v.timedOptions then
						var31 += v.discountInformation.originalPrice
					else
						var32 = nil
						
						for i_1, v_1 in v.timedOptions do
							if v_1.days == v.selectedTimedOptionDays then
								var32 = v_1
								break
							end
						end
						var31 = if var32 and var32.discountInformation then var31 + var32.discountInformation.originalPrice elseif var32 and not var32.discountInformation and var32.days ~= 0 then var31 + var32.price else var31 + v.discountInformation.originalPrice
					end
				end
			end
			return var31
		end),
		syncFromTryOns = function(p13, p14) --[[ line: 372 ]]
			-- upvalues: var19 (ref), getTryOnItemReducerKey (copy), getItemCartData (copy), cryoModule (copy), fFlagAXMISWithBlackbird (copy), var24 (write), tutilsModule (copy), var20 (ref), var22 (ref)
			local var33 = var19(false)
			local t = {}
			local discounts = nil
			
			for i, v in p13 do
				local var36 = getTryOnItemReducerKey(v.itemId, v.itemType)
				local var37 = var33[var36]
				local var38 = getItemCartData(v, p14)
				t[var36] = if var37 then cryoModule.Dictionary.join(var37, var38) else var38
				
				if fFlagAXMISWithBlackbird and v.itemData and (v.itemData.discountInformation and not discounts) then
					discounts = v.itemData.discountInformation.discounts
				end
			end
			local var35
			if fFlagAXMISWithBlackbird and discounts then
				var24(discounts)
			end
			if not tutilsModule.deepEqual(var33, t) then
				var20(t)
			end
			if tutilsModule.fieldCount(var33) == tutilsModule.fieldCount(t) then
				for i_1, v_1 in t do
					if var33[i_1] == nil then
						var35 = true
					end
				end
				var35 = false
			else
				var35 = true
			end
			if var35 then
				var22(0)
			end
		end,
		updateCartFromPurchaseResponse = function(p15) --[[ line: 406 ]]
			-- upvalues: var19 (ref), purchaseItemsErrorStatusMapModule (copy), cryoModule (copy), var20 (ref), var22 (ref)
			local var39 = var19(false)
			local t = {}
			local t_1 = {}
			local t_2 = {}
			local t_3 = {}
			local var44 = 0
			local lineItems = p15.lineItems
			
			for i, v in var39 do
				local var45 = lineItems[i]
				local var46 = v.status == purchaseItemsErrorStatusMapModule.ALREADY_OWNED
				
				if var45 and var45.status ~= "SUCCEEDED" and not var46 then
					local errorReason = purchaseItemsErrorStatusMapModule[var45.errorReason] or purchaseItemsErrorStatusMapModule.UNKNOWN
					local t_4 = nil
					
					if errorReason == purchaseItemsErrorStatusMapModule.PRICE_MISMATCH then
						t_4 = { oldPriceInRobux = v.priceInRobux }
						table.insert(t_3, v)
					end
					t[i] = cryoModule.Dictionary.join(v, { status = errorReason, priceMismatchMetadata = t_4 })
					var44 += 1
				else
					table.insert(t_2, v)
					
					if not var46 then
						table.insert(t_1, v)
					end
				end
			end
			var20(t)
			var22(var44)
			
			return {
				boughtItems = t_1,
				equippableItems = t_2,
				needDataRefeshItems = t_3
			}
		end,
		updateItemPrice = if fFlagAXDurablesForMIS then function(p16, p17, p18, p19) --[[ line: 456 | named "updateItemPrice" ]]
			-- upvalues: fFlagAXDurablesForMIS (copy), var19 (ref), getTryOnItemReducerKey (copy), var20 (ref), cryoModule (copy)
			if not fFlagAXDurablesForMIS then return end
			local var49 = var19(false)
			local var50 = getTryOnItemReducerKey(p16, p17)
			local var51 = var49[var50]
			
			if var51 and (var51.priceInRobux ~= p18 or var51.selectedTimedOptionDays ~= p19) then
				var20(cryoModule.Dictionary.join(var49, {
					[var50] = cryoModule.Dictionary.join(var51, {
						priceInRobux = p18,
						selectedTimedOptionDays = if p19 == nil then cryoModule.None else p19
					})
				}))
			end
		end else nil
	}
end