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
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local getItemPurchaseActionType = avatarExperienceCommonModule.Utils.getItemPurchaseActionType
local itemPurchaseActionTypeEnum = avatarExperienceCommonModule.Enums.ItemPurchaseActionTypeEnum

local function _(p1)
	-- upvalues: itemTileEnums (ref)
	local var1 = if p1 then p1.tileRestrictionsMap else nil
	
	if var1 then
		return if var1[itemTileEnums.Restriction.Limited] then "Limited" elseif var1[itemTileEnums.Restriction.LimitedUnique] or var1[itemTileEnums.Restriction.Collectible] then "Collectible" else nil
	end
end

local _ = {
	UNKNOWN = "UNKNOWN",
	PENDING = "PENDING",
	RESERVED = "RESERVED",
	SUCCEEDED = "SUCCEEDED",
	FAILED = "FAILED"
}

local function getItemCartData(p1, p2)
	-- upvalues: constants (ref), fFlagAXMISWithOffers (ref), fFlagAXMISSmallUIChanges (ref), purchaseItemsErrorStatusMapModule (ref), tutilsModule (ref), getItemPurchaseActionType (ref), itemPurchaseActionTypeEnum (ref), fFlagAXDurablesForMIS (ref), itemTileEnums (ref)
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
	local var1 = getItemPurchaseActionType(itemData, collectibleItemInfo, if resellableInstances then tutilsModule.fieldCount(resellableInstances) else 0, not (p2 and collectibleItemId))
	local var2 = var1 == itemPurchaseActionTypeEnum.PurchaseFromResale
	local var3 = if var2 then itemData.lowestResalePrice else itemData.priceInRobux
	local var4 = if collectibleItemInfo then if var2 then collectibleItemInfo.lowestAvailableResaleProductId else collectibleItemInfo.collectibleProductId else nil
	local var5 = if p1.itemType == Enum.AvatarItemType.Asset.Name then itemData.assetType else itemData.bundleType
	local creator = itemData.creator or {}
	local name = creator.name
	local hasVerifiedBadge = creator.hasVerifiedBadge
	local name_1 = itemData.name
	local QUANTITY_LIMIT_EXCEEDED = nil
	
	if var1 == itemPurchaseActionTypeEnum.SoldOut then
		QUANTITY_LIMIT_EXCEEDED = purchaseItemsErrorStatusMapModule.SOLD_OUT
	elseif var1 == itemPurchaseActionTypeEnum.CustomizeLink then
		QUANTITY_LIMIT_EXCEEDED = purchaseItemsErrorStatusMapModule.ALREADY_OWNED
	elseif var1 == itemPurchaseActionTypeEnum.ExperienceLink then
		QUANTITY_LIMIT_EXCEEDED = purchaseItemsErrorStatusMapModule.EXPERIENCE_LINK
	elseif var1 == itemPurchaseActionTypeEnum.Disabled then
		QUANTITY_LIMIT_EXCEEDED = purchaseItemsErrorStatusMapModule.NOT_FOR_SALE
	elseif var1 == itemPurchaseActionTypeEnum.QuantityLimitExceeded then
		QUANTITY_LIMIT_EXCEEDED = purchaseItemsErrorStatusMapModule.QUANTITY_LIMIT_EXCEEDED
	end
	local days = nil
	
	if fFlagAXDurablesForMIS and itemData.timedOptions then
		if p1.selectedTimedOptionIndex == nil then
			for i, v in itemData.timedOptions do
				if v.selected then
					days = v.days
					var3 = v.price
					break
				end
			end
		else
			local selectedTimedOptionIndex = itemData.timedOptions[p1.selectedTimedOptionIndex]
			
			if selectedTimedOptionIndex then
				days = selectedTimedOptionIndex.days
				var3 = selectedTimedOptionIndex.price
			end
		end
	end
	local var6
	local t = {
		itemId = p1.itemId,
		itemType = p1.itemType,
		expirationTime = itemData.expirationTime,
		isOwned = itemData.isOwned,
		discountInformation = itemData.discountInformation,
		itemSubType = var5
	}
	local var7 = if itemData then itemData.tileRestrictionsMap else nil
	
	if var7 then
		var6 = if var7[itemTileEnums.Restriction.Limited] then "Limited" elseif var7[itemTileEnums.Restriction.LimitedUnique] or var7[itemTileEnums.Restriction.Collectible] then "Collectible" else nil
	end
	t.itemRestriction = var6
	t.ordering = p1.ordering
	t.creatorName = if fFlagAXMISSmallUIChanges then nil else name
	t.creatorVerified = if fFlagAXMISSmallUIChanges then nil else hasVerifiedBadge
	t.collectibleProductId = var4
	t.collectibleItemId = if fFlagAXMISWithOffers then collectibleItemId else nil
	t.status = QUANTITY_LIMIT_EXCEEDED
	t.priceInRobux = var3
	t.name = name_1
	t.timedOptions = if fFlagAXDurablesForMIS then itemData.timedOptions else nil
	t.selectedTimedOptionDays = if fFlagAXDurablesForMIS then days else nil
	t.selectedTimedOptionIndexInReducer = if fFlagAXDurablesForMIS then p1.selectedTimedOptionIndex else nil
	
	return t
end

local _ = function(p3, p4)
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

return function()
	-- upvalues: createSignal (ref), fFlagAXMISWithBlackbird (ref), createComputed (ref), purchaseItemsErrorStatusMapModule (ref), tutilsModule (ref), getTryOnItemReducerKey (ref), getItemCartData (ref), cryoModule (ref), fFlagAXDurablesForMIS (ref)
	local var8, var9 = createSignal({})
	local var10, var11 = createSignal(0)
	local var12 = nil
	local var13 = nil
	
	if fFlagAXMISWithBlackbird then
		local var14, var15 = createSignal({})
		var12 = var14
		var13 = var15
	end
	return {
		getCanPurchase = createComputed(function(p5)
			-- upvalues: var8 (ref), purchaseItemsErrorStatusMapModule (copy), tutilsModule (copy)
			local var16 = var8(p5)
			local var17 = 0
			
			for i, v in var16 do
				if v.status == purchaseItemsErrorStatusMapModule.ALREADY_OWNED then
					var17 += 1
				end
				if v.status ~= nil and v.status ~= purchaseItemsErrorStatusMapModule.ALREADY_OWNED and v.status ~= purchaseItemsErrorStatusMapModule.PRICE_MISMATCH then
					return false
				end
			end
			return var17 ~= tutilsModule.fieldCount(var16)
		end),
		getErroredItemCount = createComputed(function(p6)
			-- upvalues: var10 (ref)
			return var10(p6)
		end),
		getItems = createComputed(function(p6)
			-- upvalues: var8 (ref), purchaseItemsErrorStatusMapModule (copy)
			local t = {}
			
			for i, v in var8(p6) do
				table.insert(t, v)
			end
			table.sort(t, function(p7, p8)
				-- upvalues: purchaseItemsErrorStatusMapModule (copy)
				return if p7.status == purchaseItemsErrorStatusMapModule.ALREADY_OWNED and p8.status ~= purchaseItemsErrorStatusMapModule.ALREADY_OWNED then false else p8.status == purchaseItemsErrorStatusMapModule.ALREADY_OWNED and p7.status ~= purchaseItemsErrorStatusMapModule.ALREADY_OWNED or p8.ordering < p7.ordering
			end)
			
			return t
		end, tutilsModule.deepEqual),
		getDiscounts = if fFlagAXMISWithBlackbird then if fFlagAXMISWithBlackbird then createComputed(function(p7)
			-- upvalues: var12 (write)
			return var12(p7)
		end) else nil else nil,
		getPurchasableItemsTotalPriceInRobux = createComputed(function(p7)
			-- upvalues: var8 (ref), purchaseItemsErrorStatusMapModule (copy)
			local var18 = 0
			
			for i, v in var8(p7) do
				if v.status ~= purchaseItemsErrorStatusMapModule.ALREADY_OWNED then
					var18 += v.priceInRobux
				end
			end
			return var18
		end),
		getPurchasableItemsTotalOriginalPriceInRobux = createComputed(function(p8)
			-- upvalues: var8 (ref), purchaseItemsErrorStatusMapModule (copy)
			local var19
			local var20 = 0
			
			for i, v in var8(p8) do
				if v.status ~= purchaseItemsErrorStatusMapModule.ALREADY_OWNED then
					if not v.discountInformation then
						var20 += v.priceInRobux
					elseif v.selectedTimedOptionDays == nil or not v.timedOptions then
						var20 += v.discountInformation.originalPrice
					else
						var19 = nil
						
						for i_1, v_1 in v.timedOptions do
							if v_1.days == v.selectedTimedOptionDays then
								var19 = v_1
								break
							end
						end
						var20 = if var19 and var19.discountInformation then var20 + var19.discountInformation.originalPrice elseif var19 and not var19.discountInformation and var19.days ~= 0 then var20 + var19.price else var20 + v.discountInformation.originalPrice
					end
				end
			end
			return var20
		end),
		syncFromTryOns = function(p9, p10)
			-- upvalues: var8 (ref), getTryOnItemReducerKey (copy), getItemCartData (copy), cryoModule (copy), fFlagAXMISWithBlackbird (copy), var13 (write), tutilsModule (copy), var9 (ref), var11 (ref)
			local var21 = var8(false)
			local t = {}
			local discounts = nil
			
			for i, v in p9 do
				local var22 = getTryOnItemReducerKey(v.itemId, v.itemType)
				local var23 = var21[var22]
				local var24 = getItemCartData(v, p10)
				t[var22] = if var23 then cryoModule.Dictionary.join(var23, var24) else var24
				
				if fFlagAXMISWithBlackbird and v.itemData and (v.itemData.discountInformation and not discounts) then
					discounts = v.itemData.discountInformation.discounts
				end
			end
			local var25
			if fFlagAXMISWithBlackbird and discounts then
				var13(discounts)
			end
			if not tutilsModule.deepEqual(var21, t) then
				var9(t)
			end
			if tutilsModule.fieldCount(var21) == tutilsModule.fieldCount(t) then
				for i_1, v_1 in t do
					if var21[i_1] == nil then
						var25 = true
					end
				end
				var25 = false
			else
				var25 = true
			end
			if var25 then
				var11(0)
			end
		end,
		updateCartFromPurchaseResponse = function(p11)
			-- upvalues: var8 (ref), purchaseItemsErrorStatusMapModule (copy), cryoModule (copy), var9 (ref), var11 (ref)
			local var26 = var8(false)
			local t = {}
			local t_1 = {}
			local t_2 = {}
			local t_3 = {}
			local var27 = 0
			local lineItems = p11.lineItems
			
			for i, v in var26 do
				local var28 = lineItems[i]
				local var29 = v.status == purchaseItemsErrorStatusMapModule.ALREADY_OWNED
				
				if var28 and var28.status ~= "SUCCEEDED" and not var29 then
					local errorReason = purchaseItemsErrorStatusMapModule[var28.errorReason] or purchaseItemsErrorStatusMapModule.UNKNOWN
					local t_4 = nil
					
					if errorReason == purchaseItemsErrorStatusMapModule.PRICE_MISMATCH then
						t_4 = { oldPriceInRobux = v.priceInRobux }
						table.insert(t_3, v)
					end
					t[i] = cryoModule.Dictionary.join(v, { status = errorReason, priceMismatchMetadata = t_4 })
					var27 += 1
				else
					table.insert(t_2, v)
					
					if not var29 then
						table.insert(t_1, v)
					end
				end
			end
			var9(t)
			var11(var27)
			
			return {
				boughtItems = t_1,
				equippableItems = t_2,
				needDataRefeshItems = t_3
			}
		end,
		updateItemPrice = if fFlagAXDurablesForMIS then function(p12, p13, p14, p15)
			-- upvalues: fFlagAXDurablesForMIS (copy), var8 (ref), getTryOnItemReducerKey (copy), var9 (ref), cryoModule (copy)
			if not fFlagAXDurablesForMIS then return end
			local var30 = var8(false)
			local var31 = getTryOnItemReducerKey(p12, p13)
			local var32 = var30[var31]
			
			if var32 and (var32.priceInRobux ~= p14 or var32.selectedTimedOptionDays ~= p15) then
				var9(cryoModule.Dictionary.join(var30, {
					[var31] = cryoModule.Dictionary.join(var32, {
						priceInRobux = p14,
						selectedTimedOptionDays = if p15 == nil then cryoModule.None else p15
					})
				}))
			end
		end else nil
	}
end