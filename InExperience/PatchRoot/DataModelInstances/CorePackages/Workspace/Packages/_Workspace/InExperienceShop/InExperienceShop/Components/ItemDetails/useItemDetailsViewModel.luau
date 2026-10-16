local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SharedFlagsModule = require(Parent.SharedFlags)
local AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
local FFlagLuaAppEnableGamePassFreeTrialsModule = require(InExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local InitiateShopItemPurchaseModule = require(InExperienceShop.initiateShopItemPurchase)
local FFlagCategoryLoggingInShopPurchaseModule = require(InExperienceShop.Flags.FFlagCategoryLoggingInShopPurchase)
local FormatUpdatedDateModule = require(InExperienceShop.Utils.formatUpdatedDate)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local ConstantsModule = require(InExperienceShop.Constants)
local ShopPageType = if SharedFlagsModule.FFlagPassShopPurchaseSurfaceToBuyModal then require(InExperienceShop.Analytics.Constants).ShopPageType else nil
local UseShopReportOverflowModule = require(InExperienceShop.Hooks.useShopReportOverflow)
local _ = require(InExperienceShop.Types)
local _ = require(script.Parent.ItemDetailsView)
local config = { product = "Feature.DeveloperProducts.Label.Product" }

local function findSectionForItem(UseSignalStateResult, Id, ItemType) --[[ Line: 44 ]]
	for _, value in UseSignalStateResult do
		for _, item in value.items do
			if item.id == Id and item.itemType == ItemType then
				return value
			end
		end
	end
	return nil
end

local function _(p1, p2) --[[ Line: 59 | Named "categoryLabelForType" ]]
	return if p1 == "GamePass" then "Game pass" else p2
end

return function(p1) --[[ Line: 66 | Named "useItemDetailsViewModel" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), SignalsReactModule (copy), GetInExperienceShopStoreModule (copy), FFlagCategoryLoggingInShopPurchaseModule (copy), FFlagLuaAppEnableGamePassFreeTrialsModule (copy), ReactModule (copy), ShopPageType (copy), findSectionForItem (copy), InitiateShopItemPurchaseModule (copy), SharedFlagsModule (copy), AbuseVectorModule (copy), UseShopReportOverflowModule (copy), FormatUpdatedDateModule (copy), ConstantsModule (copy)
	local Item = p1.item
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetInExperienceShopStoreModule)
	local UseSignalStateResult1 = if FFlagCategoryLoggingInShopPurchaseModule then SignalsReactModule.useSignalState(UseSignalStateResult.getSections) else nil
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(function(p2) --[[ Line: 82 ]]
		-- upvalues: UseSignalStateResult (copy), Item (copy)
		return UseSignalStateResult.getOwnership(p2)[Item.id]
	end)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(function(p2): boolean --[[ Line: 86 ]]
		-- upvalues: FFlagLuaAppEnableGamePassFreeTrialsModule (upval), Item (copy), UseSignalStateResult (copy)
		if FFlagLuaAppEnableGamePassFreeTrialsModule and Item.itemType == "GamePass" then
			return UseSignalStateResult.getTrialAvailabilities(p2).available[Item.id] == true
		else
			UseSignalStateResult.getOwnership(p2)
			
			return false
		end
	end)
	ReactModule.useEffect(function() --[[ Line: 99 ]]
		-- upvalues: Item (copy), UseSignalStateResult (copy)
		if Item.itemType == "GamePass" then
			UseSignalStateResult.fetchGamePassOwnership(Item.id)
		end
	end, {
		Item.id,
		Item.itemType,
		UseSignalStateResult.fetchGamePassOwnership
	})
	local IsOwned = if UseSignalStateResult2 == nil then Item.isOwned else UseSignalStateResult2
	local UseResult = ReactModule.useCallback(function() --[[ Line: 110 ]]
		-- upvalues: ShopPageType (upval), FFlagCategoryLoggingInShopPurchaseModule (upval), UseSignalStateResult1 (ref), findSectionForItem (upval), Item (copy), InitiateShopItemPurchaseModule (upval)
		local Category = if ShopPageType then ShopPageType.Category else nil
		local v1 = nil
		
		if FFlagCategoryLoggingInShopPurchaseModule and UseSignalStateResult1 ~= nil then
			local SectionForItem = findSectionForItem(UseSignalStateResult1, Item.id, Item.itemType)
			
			if SectionForItem ~= nil then
				v1 = {
					categoryGroup = SectionForItem.categoryGroup,
					categoryPosition = SectionForItem.id,
					categoryName = SectionForItem.name,
					stableCategoryId = SectionForItem.stableCategoryId
				}
			end
		end
		if v1 == nil then
			InitiateShopItemPurchaseModule(Item.id, Item.itemType, Category)
			
			return
		else
			InitiateShopItemPurchaseModule(Item.id, Item.itemType, Category, v1)
		end
	end, { Item.id, Item.itemType, UseSignalStateResult1 })
	local UseShopReportOverflowResult = UseShopReportOverflowModule.useShopReportOverflow({
		isReportingEnabled = SharedFlagsModule.FFlagEnableReportingFlowForExperienceShop,
		buildReportSession = ReactModule.useCallback(function() --[[ Line: 133 ]]
			-- upvalues: Item (copy), AbuseVectorModule (upval)
			return if Item.itemType == "GamePass" then {
				abuseVector = AbuseVectorModule.GamePass,
				targetId = Item.id
			} else {
				abuseVector = AbuseVectorModule.DeveloperProduct,
				targetId = Item.id
			}
		end, { Item.id, Item.itemType })
	})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 151 ]]
		-- upvalues: FormatUpdatedDateModule (upval), Item (copy)
		return FormatUpdatedDateModule(Item.updated)
	end, { Item.updated })
	local Product = UseLocalizationResult.product
	local GamePass = if Item.itemType == "GamePass" then "Game pass" else Product
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	
	return {
		itemId = Item.id,
		name = Item.name,
		thumbnail = Item.thumbnail,
		price = Item.price,
		isOwned = IsOwned,
		showTry = UseSignalStateResult3,
		isBuyDisabled = p1.disableBuy == true,
		description = Item.description,
		creator = Item.creator,
		categoryLabel = GamePass,
		updated = UseMemoResult,
		isCompact = UseStateResult,
		isOverflowMenuOpen = UseShopReportOverflowResult.isOverflowMenuOpen,
		isReportingEnabled = UseShopReportOverflowResult.isReportingEnabled,
		reportSession = UseShopReportOverflowResult.reportSession,
		onClose = p1.onClose,
		onBuyActivated = UseResult,
		onOverflowActivated = UseShopReportOverflowResult.onOverflowActivated,
		onOverflowMenuClosed = UseShopReportOverflowResult.onOverflowMenuClosed,
		onMenuItemActivated = UseShopReportOverflowResult.onMenuItemActivated,
		onReportClose = UseShopReportOverflowResult.onReportClose,
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame) --[[ Line: 159 ]]
			-- upvalues: ConstantsModule (upval), UseStateResult2 (copy)
			local X: number = Frame.AbsoluteSize.X
			
			if X > 0 then
				local IsXBelow = X < ConstantsModule.COMPACT_BREAKPOINT_WIDTH
				UseStateResult2(function(IsCOMPACTBREAKPOINTWIDTHAbove) --[[ Line: 165 ]]
					-- upvalues: IsXBelow (copy)
					return if IsCOMPACTBREAKPOINTWIDTHAbove == IsXBelow then IsCOMPACTBREAKPOINTWIDTHAbove else IsXBelow
				end)
				
				return
			end
		end, {})
	}
end