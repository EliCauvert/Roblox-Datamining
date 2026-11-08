local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SharedFlagsModule = require(Parent.SharedFlags)
local AbuseVectorModule = require(Parent.GenericAbuseReporting.AbuseVector)
local FFlagLuaAppEnableGamePassFreeTrialsModule = require(InExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local FFlagEnableGamePassTrialUnifiedLoggingModule = require(InExperienceShop.Flags.FFlagEnableGamePassTrialUnifiedLogging)
local InitiateShopItemPurchaseModule = require(InExperienceShop.initiateShopItemPurchase)
local FFlagCategoryLoggingInShopPurchaseModule = require(InExperienceShop.Flags.FFlagCategoryLoggingInShopPurchase)
local FormatUpdatedDateModule = require(InExperienceShop.Utils.formatUpdatedDate)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local ConstantsModule = require(InExperienceShop.Constants)
local ShopPageType = if SharedFlagsModule.FFlagPassShopPurchaseSurfaceToBuyModal then require(InExperienceShop.Analytics.Constants).ShopPageType else nil
local UseGamePassTrialRedemptionModule = require(InExperienceShop.Hooks.useGamePassTrialRedemption)
local UseShopReportOverflowModule = require(InExperienceShop.Hooks.useShopReportOverflow)
local _ = require(InExperienceShop.Types)
local _ = require(script.Parent.ItemDetailsView)
local config = { product = "Feature.DeveloperProducts.Label.Product" }

local function findSectionForItem(UseSignalStateResult, Id, ItemType)
	for _, value in UseSignalStateResult do
		for _, item in value.items do
			if item.id == Id and item.itemType == ItemType then
				return value
			end
		end
	end
	return nil
end

local function _(p1, p2)
	return if p1 == "GamePass" then "Game pass" else p2
end

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), SignalsReactModule (copy), GetInExperienceShopStoreModule (copy), FFlagCategoryLoggingInShopPurchaseModule (copy), FFlagLuaAppEnableGamePassFreeTrialsModule (copy), ReactModule (copy), findSectionForItem (copy), ShopPageType (copy), FFlagEnableGamePassTrialUnifiedLoggingModule (copy), InitiateShopItemPurchaseModule (copy), UseGamePassTrialRedemptionModule (copy), InExperienceShop (copy), SharedFlagsModule (copy), AbuseVectorModule (copy), UseShopReportOverflowModule (copy), FormatUpdatedDateModule (copy), ConstantsModule (copy)
	local Item = p1.item
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetInExperienceShopStoreModule)
	local UseSignalStateResult1 = if FFlagCategoryLoggingInShopPurchaseModule then SignalsReactModule.useSignalState(UseSignalStateResult.getSections) else nil
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(function(p2)
		-- upvalues: UseSignalStateResult (copy), Item (copy)
		return UseSignalStateResult.getOwnership(p2)[Item.id]
	end)
	local UseSignalStateResult3 = SignalsReactModule.useSignalState(function(p2): boolean
		-- upvalues: FFlagLuaAppEnableGamePassFreeTrialsModule (upval), Item (copy), UseSignalStateResult (copy)
		if FFlagLuaAppEnableGamePassFreeTrialsModule and Item.itemType == "GamePass" then
			return UseSignalStateResult.getTrialAvailabilities(p2).available[Item.id] == true
		else
			UseSignalStateResult.getOwnership(p2)
			
			return false
		end
	end)
	ReactModule.useEffect(function()
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
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagCategoryLoggingInShopPurchaseModule (upval), UseSignalStateResult1 (ref), findSectionForItem (upval), Item (copy), ShopPageType (upval), FFlagEnableGamePassTrialUnifiedLoggingModule (upval), UseSignalStateResult3 (copy), IsOwned (copy)
		local CategoryLocation = nil
		
		if FFlagCategoryLoggingInShopPurchaseModule and UseSignalStateResult1 ~= nil then
			local SectionForItem = findSectionForItem(UseSignalStateResult1, Item.id, Item.itemType)
			
			if SectionForItem ~= nil then
				CategoryLocation = {
					categoryGroup = SectionForItem.categoryGroup,
					categoryPosition = SectionForItem.id,
					categoryName = SectionForItem.name,
					stableCategoryId = SectionForItem.stableCategoryId
				}
			end
		end
		return {
			shopPageType = if ShopPageType then ShopPageType.Category else nil,
			categoryLocation = CategoryLocation,
			trialStatus = if FFlagEnableGamePassTrialUnifiedLoggingModule and Item.itemType == "GamePass" then if UseSignalStateResult3 and IsOwned ~= true then "available" else "unavailable" else nil
		}
	end, {
		Item.id,
		Item.itemType,
		UseSignalStateResult1,
		if FFlagEnableGamePassTrialUnifiedLoggingModule then UseSignalStateResult3 else nil,
		if FFlagEnableGamePassTrialUnifiedLoggingModule then IsOwned else nil
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), InitiateShopItemPurchaseModule (upval), Item (copy)
		local CategoryLocation = UseMemoResult.categoryLocation
		
		if CategoryLocation == nil then
			InitiateShopItemPurchaseModule(Item.id, Item.itemType, UseMemoResult.shopPageType)
			
			return
		else
			InitiateShopItemPurchaseModule(Item.id, Item.itemType, UseMemoResult.shopPageType, CategoryLocation)
		end
	end, { Item.id, Item.itemType, UseMemoResult })
	local UseGamePassTrialRedemptionModuleResult = UseGamePassTrialRedemptionModule(Item.id, UseMemoResult)
	
	if FFlagEnableGamePassTrialUnifiedLoggingModule then
		local UseRefResult = ReactModule.useRef(nil)
		ReactModule.useEffect(function()
			-- upvalues: Item (copy), UseSignalStateResult3 (copy), UseSignalStateResult2 (copy), UseRefResult (copy), InExperienceShop (upval), UseMemoResult (copy)
			if Item.itemType ~= "GamePass" or not UseSignalStateResult3 or UseSignalStateResult2 ~= false then return end
			if UseRefResult.current ~= Item.id then
				UseRefResult.current = Item.id
				local SendGamePassTrialUnifiedEventModule = require(InExperienceShop.Analytics.sendGamePassTrialUnifiedEvent)
				SendGamePassTrialUnifiedEventModule.send({
					action = SendGamePassTrialUnifiedEventModule.impressionAction,
					elementName = SendGamePassTrialUnifiedEventModule.trialElement,
					itemId = Item.id,
					shopPageType = UseMemoResult.shopPageType,
					trialStatus = UseMemoResult.trialStatus
				})
				
				return
			end
		end, {
			Item.id,
			Item.itemType,
			UseSignalStateResult3,
			UseSignalStateResult2,
			UseMemoResult
		})
	end
	local UseShopReportOverflowResult = UseShopReportOverflowModule.useShopReportOverflow({
		isReportingEnabled = SharedFlagsModule.FFlagEnableReportingFlowForExperienceShop,
		buildReportSession = ReactModule.useCallback(function()
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
	local UseMemoResult1 = ReactModule.useMemo(function()
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
		isActionLoading = UseGamePassTrialRedemptionModuleResult.isActionLoading,
		isActionDisabled = UseGamePassTrialRedemptionModuleResult.isActionDisabled,
		isBuyDisabled = p1.disableBuy == true,
		description = Item.description,
		creator = Item.creator,
		categoryLabel = GamePass,
		updated = UseMemoResult1,
		isCompact = UseStateResult,
		isOverflowMenuOpen = UseShopReportOverflowResult.isOverflowMenuOpen,
		isReportingEnabled = UseShopReportOverflowResult.isReportingEnabled,
		reportSession = UseShopReportOverflowResult.reportSession,
		onClose = p1.onClose,
		onBuyActivated = UseResult,
		onTryActivated = UseGamePassTrialRedemptionModuleResult.onTryActivated,
		onOverflowActivated = UseShopReportOverflowResult.onOverflowActivated,
		onOverflowMenuClosed = UseShopReportOverflowResult.onOverflowMenuClosed,
		onMenuItemActivated = UseShopReportOverflowResult.onMenuItemActivated,
		onReportClose = UseShopReportOverflowResult.onReportClose,
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
			-- upvalues: ConstantsModule (upval), UseStateResult2 (copy)
			local X: number = Frame.AbsoluteSize.X
			
			if X > 0 then
				local IsXBelow = X < ConstantsModule.COMPACT_BREAKPOINT_WIDTH
				UseStateResult2(function(IsCOMPACTBREAKPOINTWIDTHAbove)
					-- upvalues: IsXBelow (copy)
					return if IsCOMPACTBREAKPOINTWIDTHAbove == IsXBelow then IsCOMPACTBREAKPOINTWIDTHAbove else IsXBelow
				end)
				
				return
			end
		end, {})
	}
end