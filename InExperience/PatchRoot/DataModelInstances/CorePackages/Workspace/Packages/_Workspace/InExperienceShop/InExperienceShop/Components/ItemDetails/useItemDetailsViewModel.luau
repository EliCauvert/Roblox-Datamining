local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local sharedFlagsModule = require(parent.SharedFlags)
local abuseVectorModule = require(parent.GenericAbuseReporting.AbuseVector)
local initiateShopItemPurchaseModule = require(inExperienceShop.initiateShopItemPurchase)
local formatUpdatedDateModule = require(inExperienceShop.Utils.formatUpdatedDate)
local getInExperienceShopStoreModule = require(inExperienceShop.Stores.getInExperienceShopStore)
local var1 = if sharedFlagsModule.FFlagPassShopPurchaseSurfaceToBuyModal then require(inExperienceShop.Analytics.Constants).ShopPageType else nil
local useShopReportOverflowModule = require(inExperienceShop.Hooks.useShopReportOverflow)
local _ = require(inExperienceShop.Types)
local _ = require(script.Parent.ItemDetailsView)
local t = { product = "Feature.DeveloperProducts.Label.Product" }

local function _(p1, p2)
	return if p1 == "GamePass" then "Game pass" else p2
end

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), signalsReactModule (ref), getInExperienceShopStoreModule (ref), reactModule (ref), initiateShopItemPurchaseModule (ref), var1 (ref), sharedFlagsModule (ref), abuseVectorModule (ref), useShopReportOverflowModule (ref), formatUpdatedDateModule (ref)
	local item = p1.item
	local var2 = useLocalization(t)
	local var3 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	local var4 = signalsReactModule.useSignalState(function(p2)
		-- upvalues: var3 (ref), item (ref)
		return var3.getOwnership(p2)[item.id]
	end)
	reactModule.useEffect(function()
		-- upvalues: item (ref), var3 (ref)
		if item.itemType == "GamePass" then
			var3.fetchGamePassOwnership(item.id)
		end
	end, { item.id, item.itemType, var3.fetchGamePassOwnership })
	local var5 = if var4 ~= nil then item.isOwned else var4
	local var6 = reactModule.useCallback(function()
		-- upvalues: initiateShopItemPurchaseModule (copy), item (ref), var1 (copy)
		initiateShopItemPurchaseModule(item.id, item.itemType, if var1 then var1.Category else nil)
	end, { item.id, item.itemType })
	local var7 = useShopReportOverflowModule.useShopReportOverflow({
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
	local var8 = reactModule.useMemo(function()
		-- upvalues: formatUpdatedDateModule (copy), item (ref)
		return formatUpdatedDateModule(item.updated)
	end, { item.updated })
	local var9 = if item.itemType == "GamePass" then "Game pass" else var2.product
	local var10, var11 = reactModule.useState(false)
	
	return {
		itemId = item.id,
		name = item.name,
		thumbnail = item.thumbnail,
		price = item.price,
		isOwned = var5,
		isBuyDisabled = p1.disableBuy == true,
		description = item.description,
		creator = item.creator,
		categoryLabel = var9,
		updated = var8,
		isCompact = var10,
		isOverflowMenuOpen = var7.isOverflowMenuOpen,
		isReportingEnabled = var7.isReportingEnabled,
		reportSession = var7.reportSession,
		onClose = p1.onClose,
		onBuyActivated = var6,
		onOverflowActivated = var7.onOverflowActivated,
		onOverflowMenuClosed = var7.onOverflowMenuClosed,
		onMenuItemActivated = var7.onMenuItemActivated,
		onReportClose = var7.onReportClose,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
			-- upvalues: var11 (ref)
			local x = p2.AbsoluteSize.X
			
			if x <= 0 then
				return
			end
			local var12 = x < 480
			var11(function(p3)
				-- upvalues: var12 (ref)
				return if p3 == var12 then p3 else var12
			end)
		end, {})
	}
end