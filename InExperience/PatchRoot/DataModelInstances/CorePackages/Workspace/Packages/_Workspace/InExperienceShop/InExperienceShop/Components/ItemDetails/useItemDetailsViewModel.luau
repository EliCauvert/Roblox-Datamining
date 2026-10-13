local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local sharedFlagsModule = require(parent.SharedFlags)
local abuseVectorModule = require(parent.GenericAbuseReporting.AbuseVector)
local fFlagLuaAppEnableGamePassFreeTrialsModule = require(inExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local initiateShopItemPurchaseModule = require(inExperienceShop.initiateShopItemPurchase)
local fFlagCategoryLoggingInShopPurchaseModule = require(inExperienceShop.Flags.FFlagCategoryLoggingInShopPurchase)
local formatUpdatedDateModule = require(inExperienceShop.Utils.formatUpdatedDate)
local getInExperienceShopStoreModule = require(inExperienceShop.Stores.getInExperienceShopStore)
local constantsModule = require(inExperienceShop.Constants)
local var1 = if sharedFlagsModule.FFlagPassShopPurchaseSurfaceToBuyModal then require(inExperienceShop.Analytics.Constants).ShopPageType else nil
local useShopReportOverflowModule = require(inExperienceShop.Hooks.useShopReportOverflow)
local _ = require(inExperienceShop.Types)
local _ = require(script.Parent.ItemDetailsView)
local t = { product = "Feature.DeveloperProducts.Label.Product" }

local function findSectionForItem(p1, p2, p3)
	for i, v in p1 do
		for i_1, v_1 in v.items do
			if v_1.id == p2 and v_1.itemType == p3 then
				return v
			end
		end
	end
	return nil
end

local function _(p4, p5)
	return if p4 == "GamePass" then "Game pass" else p5
end

return function(p4)
	-- upvalues: useLocalization (ref), t (ref), signalsReactModule (ref), getInExperienceShopStoreModule (ref), fFlagCategoryLoggingInShopPurchaseModule (ref), fFlagLuaAppEnableGamePassFreeTrialsModule (ref), reactModule (ref), var1 (ref), findSectionForItem (ref), initiateShopItemPurchaseModule (ref), sharedFlagsModule (ref), abuseVectorModule (ref), useShopReportOverflowModule (ref), formatUpdatedDateModule (ref), constantsModule (ref)
	local item = p4.item
	local var2 = useLocalization(t)
	local var3 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	local var4 = if fFlagCategoryLoggingInShopPurchaseModule then signalsReactModule.useSignalState(var3.getSections) else nil
	local var5 = signalsReactModule.useSignalState(function(p5)
		-- upvalues: var3 (ref), item (ref)
		return var3.getOwnership(p5)[item.id]
	end)
	local var6 = signalsReactModule.useSignalState(function(p5)
		-- upvalues: fFlagLuaAppEnableGamePassFreeTrialsModule (copy), item (ref), var3 (ref)
		if fFlagLuaAppEnableGamePassFreeTrialsModule and item.itemType == "GamePass" then
			return var3.getTrialAvailabilities(p5).available[item.id] == true
		end
		var3.getOwnership(p5)
		
		return false
	end)
	reactModule.useEffect(function()
		-- upvalues: item (ref), var3 (ref)
		if item.itemType == "GamePass" then
			var3.fetchGamePassOwnership(item.id)
		end
	end, { item.id, item.itemType, var3.fetchGamePassOwnership })
	local var7 = if var5 ~= nil then item.isOwned else var5
	local var8 = reactModule.useCallback(function()
		-- upvalues: var1 (copy), fFlagCategoryLoggingInShopPurchaseModule (copy), var4 (write), findSectionForItem (copy), item (ref), initiateShopItemPurchaseModule (copy)
		local var9 = if var1 then var1.Category else nil
		local t = nil
		
		if fFlagCategoryLoggingInShopPurchaseModule and var4 ~= nil then
			local var10 = findSectionForItem(var4, item.id, item.itemType)
			
			if var10 ~= nil then
				t = {
					categoryGroup = var10.categoryGroup,
					categoryPosition = var10.id,
					categoryName = var10.name,
					stableCategoryId = var10.stableCategoryId
				}
			end
		end
		if t == nil then
			initiateShopItemPurchaseModule(item.id, item.itemType, var9)
			
			return
		end
		initiateShopItemPurchaseModule(item.id, item.itemType, var9, t)
	end, { item.id, item.itemType, var4 })
	local var9 = useShopReportOverflowModule.useShopReportOverflow({
		isReportingEnabled = sharedFlagsModule.FFlagEnableReportingFlowForExperienceShop,
		buildReportSession = reactModule.useCallback(function()
			-- upvalues: item (ref), abuseVectorModule (copy)
			return if item.itemType == "GamePass" then {
				abuseVector = abuseVectorModule.GamePass,
				targetId = item.id
			} else {
				abuseVector = abuseVectorModule.DeveloperProduct,
				targetId = item.id
			}
		end, { item.id, item.itemType })
	})
	local var10 = reactModule.useMemo(function()
		-- upvalues: formatUpdatedDateModule (copy), item (ref)
		return formatUpdatedDateModule(item.updated)
	end, { item.updated })
	local var11 = if item.itemType == "GamePass" then "Game pass" else var2.product
	local var12, var13 = reactModule.useState(false)
	
	return {
		itemId = item.id,
		name = item.name,
		thumbnail = item.thumbnail,
		price = item.price,
		isOwned = var7,
		showTry = var6,
		isBuyDisabled = p4.disableBuy == true,
		description = item.description,
		creator = item.creator,
		categoryLabel = var11,
		updated = var10,
		isCompact = var12,
		isOverflowMenuOpen = var9.isOverflowMenuOpen,
		isReportingEnabled = var9.isReportingEnabled,
		reportSession = var9.reportSession,
		onClose = p4.onClose,
		onBuyActivated = var8,
		onOverflowActivated = var9.onOverflowActivated,
		onOverflowMenuClosed = var9.onOverflowMenuClosed,
		onMenuItemActivated = var9.onMenuItemActivated,
		onReportClose = var9.onReportClose,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p5)
			-- upvalues: constantsModule (copy), var13 (ref)
			local x = p5.AbsoluteSize.X
			
			if x <= 0 then
				return
			end
			local var14 = x < constantsModule.COMPACT_BREAKPOINT_WIDTH
			var13(function(p6)
				-- upvalues: var14 (ref)
				return if p6 == var14 then p6 else var14
			end)
		end, {})
	}
end