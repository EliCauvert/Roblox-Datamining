local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local sharedFlagsModule = require(parent.SharedFlags)
local abuseVectorModule = require(parent.GenericAbuseReporting.AbuseVector)
local fFlagLuaAppEnableGamePassFreeTrialsModule = require(inExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local initiateShopItemPurchaseModule = require(inExperienceShop.initiateShopItemPurchase)
local formatUpdatedDateModule = require(inExperienceShop.Utils.formatUpdatedDate)
local getInExperienceShopStoreModule = require(inExperienceShop.Stores.getInExperienceShopStore)
local constantsModule = require(inExperienceShop.Constants)
local var1 = if sharedFlagsModule.FFlagPassShopPurchaseSurfaceToBuyModal then require(inExperienceShop.Analytics.Constants).ShopPageType else nil
local useShopReportOverflowModule = require(inExperienceShop.Hooks.useShopReportOverflow)
local _ = require(inExperienceShop.Types)
local _ = require(script.Parent.ItemDetailsView)
local t = { product = "Feature.DeveloperProducts.Label.Product" }

local function _(p1, p2)
	return if p1 == "GamePass" then "Game pass" else p2
end

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), signalsReactModule (ref), getInExperienceShopStoreModule (ref), fFlagLuaAppEnableGamePassFreeTrialsModule (ref), reactModule (ref), initiateShopItemPurchaseModule (ref), var1 (ref), sharedFlagsModule (ref), abuseVectorModule (ref), useShopReportOverflowModule (ref), formatUpdatedDateModule (ref), constantsModule (ref)
	local item = p1.item
	local var2 = useLocalization(t)
	local var3 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	local var4 = signalsReactModule.useSignalState(function(p2)
		-- upvalues: var3 (ref), item (ref)
		return var3.getOwnership(p2)[item.id]
	end)
	local var5 = signalsReactModule.useSignalState(function(p2)
		-- upvalues: fFlagLuaAppEnableGamePassFreeTrialsModule (copy), item (ref), var3 (ref)
		if fFlagLuaAppEnableGamePassFreeTrialsModule and item.itemType == "GamePass" then
			return var3.getTrialAvailabilities(p2).available[item.id] == true
		end
		var3.getOwnership(p2)
		
		return false
	end)
	reactModule.useEffect(function()
		-- upvalues: item (ref), var3 (ref)
		if item.itemType == "GamePass" then
			var3.fetchGamePassOwnership(item.id)
		end
	end, { item.id, item.itemType, var3.fetchGamePassOwnership })
	local var6 = if var4 ~= nil then item.isOwned else var4
	local var7 = reactModule.useCallback(function()
		-- upvalues: initiateShopItemPurchaseModule (copy), item (ref), var1 (copy)
		initiateShopItemPurchaseModule(item.id, item.itemType, if var1 then var1.Category else nil)
	end, { item.id, item.itemType })
	local var8 = useShopReportOverflowModule.useShopReportOverflow({
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
	local var9 = reactModule.useMemo(function()
		-- upvalues: formatUpdatedDateModule (copy), item (ref)
		return formatUpdatedDateModule(item.updated)
	end, { item.updated })
	local var10 = if item.itemType == "GamePass" then "Game pass" else var2.product
	local var11, var12 = reactModule.useState(false)
	
	return {
		itemId = item.id,
		name = item.name,
		thumbnail = item.thumbnail,
		price = item.price,
		isOwned = var6,
		showTry = var5,
		isBuyDisabled = p1.disableBuy == true,
		description = item.description,
		creator = item.creator,
		categoryLabel = var10,
		updated = var9,
		isCompact = var11,
		isOverflowMenuOpen = var8.isOverflowMenuOpen,
		isReportingEnabled = var8.isReportingEnabled,
		reportSession = var8.reportSession,
		onClose = p1.onClose,
		onBuyActivated = var7,
		onOverflowActivated = var8.onOverflowActivated,
		onOverflowMenuClosed = var8.onOverflowMenuClosed,
		onMenuItemActivated = var8.onMenuItemActivated,
		onReportClose = var8.onReportClose,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
			-- upvalues: constantsModule (copy), var12 (ref)
			local x = p2.AbsoluteSize.X
			
			if x <= 0 then
				return
			end
			local var13 = x < constantsModule.COMPACT_BREAKPOINT_WIDTH
			var12(function(p3)
				-- upvalues: var13 (ref)
				return if p3 == var13 then p3 else var13
			end)
		end, {})
	}
end