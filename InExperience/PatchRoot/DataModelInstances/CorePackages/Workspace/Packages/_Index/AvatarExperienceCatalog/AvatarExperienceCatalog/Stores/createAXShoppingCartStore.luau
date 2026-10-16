local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local SignalsModule = require(Parent.Signals)
local TutilsModule = require(Parent.tutils)
local AvatarExperienceCommonModule = require(Parent.AvatarExperienceCommon)
local PurchaseItemsErrorStatusMapModule = require(AvatarExperienceCatalog.Enums.PurchaseItemsErrorStatusMap)
local CryoModule = require(Parent.Cryo)
local ItemTileEnums = require(Parent.UIBlox).Tile.ItemTileEnums
local GetTryOnItemReducerKeyFunction = AvatarExperienceCommonModule.Utils.getTryOnItemReducerKey
local Constants = AvatarExperienceCommonModule.Constants
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXDurablesForMIS = AvatarExperienceFlagsModule.FFlagAXDurablesForMIS
local FFlagAXMISWithBlackbird = require(Parent.SharedFlags).FFlagAXMISWithBlackbird
local FFlagAXMISSmallUIChanges = AvatarExperienceFlagsModule.FFlagAXMISSmallUIChanges
local FFlagAXMISWithOffers = AvatarExperienceFlagsModule.FFlagAXMISWithOffers
local FFlagAXGifting = AvatarExperienceFlagsModule.FFlagAXGifting
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local GetItemPurchaseActionTypeFunction = AvatarExperienceCommonModule.Utils.getItemPurchaseActionType
local ItemPurchaseActionTypeEnum = AvatarExperienceCommonModule.Enums.ItemPurchaseActionTypeEnum

local function _(p1): string? --[[ Line: 28 | Named "getItemRestrictionFromItemData" ]]
	-- upvalues: ItemTileEnums (copy)
	local TileRestrictionsMap = if p1 then p1.tileRestrictionsMap else nil
	
	if TileRestrictionsMap then
		if TileRestrictionsMap[ItemTileEnums.Restriction.Limited] then
			return "Limited"
		elseif TileRestrictionsMap[ItemTileEnums.Restriction.LimitedUnique] or TileRestrictionsMap[ItemTileEnums.Restriction.Collectible] then
			return "Collectible"
		end
	end
	return nil
end

local function getItemCartData(ItemCartData, p1) --[[ Line: 118 ]]
	-- upvalues: Constants (copy), FFlagAXMISWithOffers (copy), FFlagAXMISSmallUIChanges (copy), PurchaseItemsErrorStatusMapModule (copy), TutilsModule (copy), GetItemPurchaseActionTypeFunction (copy), ItemPurchaseActionTypeEnum (copy), FFlagAXDurablesForMIS (copy), ItemTileEnums (copy), FFlagAXGifting (copy)
	if ItemCartData.itemId == Constants.AVATAR_BLOCKY_DEFAULT_BUNDLE_ID then
		return {
			itemSubType = "1",
			priceInRobux = 0,
			name = "Default Body",
			isOwned = true,
			itemId = ItemCartData.itemId,
			collectibleItemId = if FFlagAXMISWithOffers then "n/a" else nil,
			itemType = ItemCartData.itemType,
			ordering = ItemCartData.ordering,
			creatorName = if FFlagAXMISSmallUIChanges then nil else "Roblox",
			creatorVerified = not FFlagAXMISSmallUIChanges or nil,
			collectibleProductId = ItemCartData.itemId,
			status = PurchaseItemsErrorStatusMapModule.ALREADY_OWNED
		}
	end
	local ItemData = ItemCartData.itemData
	local CollectibleItemId = ItemCartData.collectibleItemId
	local CollectibleItemInfo = ItemCartData.collectibleItemInfo
	local ResellableInstances = ItemCartData.resellableInstances
	local ItemPurchaseActionType = GetItemPurchaseActionTypeFunction(ItemData, CollectibleItemInfo, if ResellableInstances then TutilsModule.fieldCount(ResellableInstances) else 0, not (p1 and CollectibleItemId))
	local IsItemPurchaseActionTypeMatch = ItemPurchaseActionType == ItemPurchaseActionTypeEnum.PurchaseFromResale
	local LowestResalePrice = if IsItemPurchaseActionTypeMatch then ItemData.lowestResalePrice else ItemData.priceInRobux
	local LowestAvailableResaleProductId = if CollectibleItemInfo then if IsItemPurchaseActionTypeMatch then CollectibleItemInfo.lowestAvailableResaleProductId else CollectibleItemInfo.collectibleProductId else nil
	local AssetType = if ItemCartData.itemType == Enum.AvatarItemType.Asset.Name then ItemData.assetType else ItemData.bundleType
	local Creator = ItemData.creator or {}
	local Name = Creator.name
	local HasVerifiedBadge = Creator.hasVerifiedBadge
	local Name1 = ItemData.name
	local SOLDOUT = if ItemPurchaseActionType == ItemPurchaseActionTypeEnum.SoldOut then PurchaseItemsErrorStatusMapModule.SOLD_OUT elseif ItemPurchaseActionType == ItemPurchaseActionTypeEnum.CustomizeLink then PurchaseItemsErrorStatusMapModule.ALREADY_OWNED elseif ItemPurchaseActionType == ItemPurchaseActionTypeEnum.ExperienceLink then PurchaseItemsErrorStatusMapModule.EXPERIENCE_LINK elseif ItemPurchaseActionType == ItemPurchaseActionTypeEnum.Disabled then PurchaseItemsErrorStatusMapModule.NOT_FOR_SALE elseif ItemPurchaseActionType == ItemPurchaseActionTypeEnum.QuantityLimitExceeded then PurchaseItemsErrorStatusMapModule.QUANTITY_LIMIT_EXCEEDED else nil
	local Days = nil
	
	if FFlagAXDurablesForMIS and ItemData.timedOptions then
		if ItemCartData.selectedTimedOptionIndex == nil then
			for _, timedOption in ItemData.timedOptions do
				if timedOption.selected then
					Days = timedOption.days
					LowestResalePrice = timedOption.price
					break
				end
			end
		else
			local TimedOption = ItemData.timedOptions[ItemCartData.selectedTimedOptionIndex]
			
			if TimedOption then
				Days = TimedOption.days
				LowestResalePrice = TimedOption.price
			end
		end
	end
	local TileRestrictionsMap = if ItemData then ItemData.tileRestrictionsMap else nil
	
	return {
		itemId = ItemCartData.itemId,
		itemType = ItemCartData.itemType,
		expirationTime = ItemData.expirationTime,
		isOwned = ItemData.isOwned,
		discountInformation = ItemData.discountInformation,
		itemSubType = AssetType,
		itemRestriction = if TileRestrictionsMap then if TileRestrictionsMap[ItemTileEnums.Restriction.Limited] then "Limited" elseif TileRestrictionsMap[ItemTileEnums.Restriction.LimitedUnique] or TileRestrictionsMap[ItemTileEnums.Restriction.Collectible] then "Collectible" else nil else nil,
		ordering = ItemCartData.ordering,
		creatorName = if FFlagAXMISSmallUIChanges then nil else Name,
		creatorVerified = if FFlagAXMISSmallUIChanges then nil else HasVerifiedBadge,
		collectibleProductId = LowestAvailableResaleProductId,
		collectibleItemId = if FFlagAXMISWithOffers or FFlagAXGifting then CollectibleItemId else nil,
		status = SOLDOUT,
		priceInRobux = LowestResalePrice,
		name = Name1,
		timedOptions = if FFlagAXDurablesForMIS then ItemData.timedOptions else nil,
		selectedTimedOptionDays = if FFlagAXDurablesForMIS then Days else nil,
		selectedTimedOptionIndexInReducer = if FFlagAXDurablesForMIS then ItemCartData.selectedTimedOptionIndex else nil
	}
end

local _ = function(p2, List): boolean --[[ Line: 223 | Named "areCartItemsDifferent" ]]
	-- upvalues: TutilsModule (copy)
	if TutilsModule.fieldCount(p2) ~= TutilsModule.fieldCount(List) then
		return true
	end
	for i, _ in List do
		if p2[i] == nil then
			return true
		end
	end
	return false
end

return function() --[[ Line: 238 | Named "createAXShoppingCartStore" ]]
	-- upvalues: CreateSignalFunction (copy), FFlagAXMISWithBlackbird (copy), CreateComputedFunction (copy), PurchaseItemsErrorStatusMapModule (copy), TutilsModule (copy), GetTryOnItemReducerKeyFunction (copy), getItemCartData (copy), CryoModule (copy), FFlagAXDurablesForMIS (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local Signal1, Signal2_1 = CreateSignalFunction(0)
	local Callback = nil
	local Callback1 = nil
	
	if FFlagAXMISWithBlackbird then
		Callback, Callback1 = CreateSignalFunction({})
	end
	local Computed = if FFlagAXMISWithBlackbird then CreateComputedFunction(function(p3) --[[ Line: 251 ]]
		-- upvalues: Callback (ref)
		return Callback(p3)
	end) else nil
	
	local function updateItemPrice(p3, p4, PriceInRobux, SelectedTimedOptionDays) --[[ Line: 454 ]]
		-- upvalues: FFlagAXDurablesForMIS (upval), Signal (copy), GetTryOnItemReducerKeyFunction (upval), Signal2 (copy), CryoModule (upval)
		if not FFlagAXDurablesForMIS then return end
		local SignalResult = Signal(false)
		local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(p3, p4)
		local SignalResultEntry = SignalResult[TryOnItemReducerKey]
		
		if SignalResultEntry and (SignalResultEntry.priceInRobux ~= PriceInRobux or SignalResultEntry.selectedTimedOptionDays ~= SelectedTimedOptionDays) then
			Signal2(CryoModule.Dictionary.join(SignalResult, {
				[TryOnItemReducerKey] = CryoModule.Dictionary.join(SignalResultEntry, {
					priceInRobux = PriceInRobux,
					selectedTimedOptionDays = if SelectedTimedOptionDays == nil then CryoModule.None else SelectedTimedOptionDays
				})
			}))
		end
	end
	
	return {
		getCanPurchase = CreateComputedFunction(function(p3): boolean --[[ Line: 283 ]]
			-- upvalues: Signal (copy), PurchaseItemsErrorStatusMapModule (upval), TutilsModule (upval)
			local SignalResult = Signal(p3)
			local Count = 0
			
			for _, value in SignalResult do
				if value.status == PurchaseItemsErrorStatusMapModule.ALREADY_OWNED then
					Count += 1
				end
				if value.status ~= nil and value.status ~= PurchaseItemsErrorStatusMapModule.ALREADY_OWNED and value.status ~= PurchaseItemsErrorStatusMapModule.PRICE_MISMATCH then
					return false
				end
			end
			return Count ~= TutilsModule.fieldCount(SignalResult)
		end),
		getErroredItemCount = CreateComputedFunction(function(p4) --[[ Line: 246 ]]
			-- upvalues: Signal1 (copy)
			return Signal1(p4)
		end),
		getItems = CreateComputedFunction(function(p4) --[[ Line: 256 ]]
			-- upvalues: Signal (copy), PurchaseItemsErrorStatusMapModule (upval)
			local List = {}
			
			for _, value in Signal(p4) do
				table.insert(List, value)
			end
			table.sort(List, function(A, B): boolean --[[ Line: 265 ]]
				-- upvalues: PurchaseItemsErrorStatusMapModule (upval)
				return (A.status ~= PurchaseItemsErrorStatusMapModule.ALREADY_OWNED or B.status == PurchaseItemsErrorStatusMapModule.ALREADY_OWNED) and (B.status == PurchaseItemsErrorStatusMapModule.ALREADY_OWNED and A.status ~= PurchaseItemsErrorStatusMapModule.ALREADY_OWNED or B.ordering < A.ordering)
			end)
			
			return List
		end, TutilsModule.deepEqual),
		getDiscounts = if FFlagAXMISWithBlackbird then Computed else nil,
		getPurchasableItemsTotalPriceInRobux = CreateComputedFunction(function(p5): number --[[ Line: 317 ]]
			-- upvalues: Signal (copy), PurchaseItemsErrorStatusMapModule (upval)
			local NewPriceInRobux = 0
			
			for _, ItemCartData in Signal(p5) do
				if ItemCartData.status ~= PurchaseItemsErrorStatusMapModule.ALREADY_OWNED then
					NewPriceInRobux += ItemCartData.priceInRobux
				end
			end
			return NewPriceInRobux
		end),
		getPurchasableItemsTotalOriginalPriceInRobux = CreateComputedFunction(function(p6): number --[[ Line: 329 ]]
			-- upvalues: Signal (copy), PurchaseItemsErrorStatusMapModule (upval)
			local NewOriginalPrice = 0
			local v1 = nil
			
			for _, ItemCartData in Signal(p6) do
				if ItemCartData.status ~= PurchaseItemsErrorStatusMapModule.ALREADY_OWNED then
					if ItemCartData.discountInformation then
						if ItemCartData.selectedTimedOptionDays == nil or not ItemCartData.timedOptions then
							NewOriginalPrice += ItemCartData.discountInformation.originalPrice
							continue
						end
						v1 = nil
						
						for _, timedOption in ItemCartData.timedOptions do
							if timedOption.days == ItemCartData.selectedTimedOptionDays then
								v1 = timedOption
								break
							end
						end
						if v1 and v1.discountInformation then
							NewOriginalPrice += v1.discountInformation.originalPrice
						elseif v1 and not v1.discountInformation and v1.days ~= 0 then
							NewOriginalPrice += v1.price
						else
							NewOriginalPrice += ItemCartData.discountInformation.originalPrice
						end
					else
						NewOriginalPrice += ItemCartData.priceInRobux
					end
				end
			end
			return NewOriginalPrice
		end),
		syncFromTryOns = function(List, p7) --[[ Line: 370 ]]
			-- upvalues: Signal (copy), GetTryOnItemReducerKeyFunction (upval), getItemCartData (upval), CryoModule (upval), FFlagAXMISWithBlackbird (upval), Callback1 (ref), TutilsModule (upval), Signal2 (copy), Signal2_1 (copy)
			local SignalResult = Signal(false)
			local JoinResults = {}
			local Discounts = nil
			
			for _, ItemCartData in List do
				local TryOnItemReducerKey = GetTryOnItemReducerKeyFunction(ItemCartData.itemId, ItemCartData.itemType)
				local SignalResultEntry = SignalResult[TryOnItemReducerKey]
				local ItemCartData1 = getItemCartData(ItemCartData, p7)
				JoinResults[TryOnItemReducerKey] = if SignalResultEntry then CryoModule.Dictionary.join(SignalResultEntry, ItemCartData1) else ItemCartData1
				
				if FFlagAXMISWithBlackbird and ItemCartData.itemData and ItemCartData.itemData.discountInformation and not Discounts then
					Discounts = ItemCartData.itemData.discountInformation.discounts
				end
			end
			if FFlagAXMISWithBlackbird and Discounts then
				Callback1(Discounts)
			end
			if not TutilsModule.deepEqual(SignalResult, JoinResults) then
				Signal2(JoinResults)
			end
			local Flag = nil
			if TutilsModule.fieldCount(SignalResult) == TutilsModule.fieldCount(JoinResults) then
				Flag = false
				
				for i, _ in JoinResults do
					if SignalResult[i] == nil then
						Flag = true
						break
					end
				end
			else
				Flag = true
			end
			if Flag then
				Signal2_1(0)
			end
		end,
		updateCartFromPurchaseResponse = function(p8) --[[ Line: 404 ]]
			-- upvalues: Signal (copy), PurchaseItemsErrorStatusMapModule (upval), CryoModule (upval), Signal2 (copy), Signal2_1 (copy)
			local JoinResults = {}
			local BoughtItems = {}
			local EquippableItems = {}
			local NeedDataRefeshItems = {}
			local Count = 0
			local LineItems = p8.lineItems
			
			for i, ItemCartData in Signal(false) do
				local LineItem = LineItems[i]
				local IsStatusMatch = ItemCartData.status == PurchaseItemsErrorStatusMapModule.ALREADY_OWNED
				
				if not LineItem or LineItem.status == "SUCCEEDED" or IsStatusMatch then
					table.insert(EquippableItems, ItemCartData)
					
					if not IsStatusMatch then
						table.insert(BoughtItems, ItemCartData)
						continue
					end
					continue
				end
				local PurchaseItemsErrorStatusMapModuleEntry = PurchaseItemsErrorStatusMapModule[LineItem.errorReason] or PurchaseItemsErrorStatusMapModule.UNKNOWN
				local PriceMismatchMetadata = nil
				
				if PurchaseItemsErrorStatusMapModuleEntry == PurchaseItemsErrorStatusMapModule.PRICE_MISMATCH then
					PriceMismatchMetadata = { oldPriceInRobux = ItemCartData.priceInRobux }
					table.insert(NeedDataRefeshItems, ItemCartData)
				end
				JoinResults[i] = CryoModule.Dictionary.join(ItemCartData, {
					status = PurchaseItemsErrorStatusMapModuleEntry,
					priceMismatchMetadata = PriceMismatchMetadata
				})
				Count += 1
			end
			Signal2(JoinResults)
			Signal2_1(Count)
			
			return {
				boughtItems = BoughtItems,
				equippableItems = EquippableItems,
				needDataRefeshItems = NeedDataRefeshItems
			}
		end,
		updateItemPrice = if FFlagAXDurablesForMIS then updateItemPrice else nil
	}
end