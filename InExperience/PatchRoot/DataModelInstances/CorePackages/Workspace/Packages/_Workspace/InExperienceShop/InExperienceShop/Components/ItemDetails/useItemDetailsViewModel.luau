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
local var8 = if sharedFlagsModule.FFlagPassShopPurchaseSurfaceToBuyModal then require(inExperienceShop.Analytics.Constants).ShopPageType else nil
local useShopReportOverflowModule = require(inExperienceShop.Hooks.useShopReportOverflow)
local _ = require(inExperienceShop.Types)
local _ = require(script.Parent.ItemDetailsView)
local t = { product = "Feature.DeveloperProducts.Label.Product" }

local function _(p0, p1) --[[ line: 47 | named "categoryLabelForType" ]]
	return if p0 == "GamePass" then "Game pass" else p1
end

return function(p2) --[[ line: 54 | named "useItemDetailsViewModel" ]]
	-- upvalues: useLocalization (ref), t (ref), signalsReactModule (ref), getInExperienceShopStoreModule (ref), reactModule (ref), initiateShopItemPurchaseModule (ref), var8 (ref), sharedFlagsModule (ref), abuseVectorModule (ref), useShopReportOverflowModule (ref), formatUpdatedDateModule (ref)
	local item = p2.item
	local var11 = useLocalization(t)
	local var12 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	local var13 = signalsReactModule.useSignalState(function(p3) --[[ line: 64 ]]
		-- upvalues: var12 (ref), item (ref)
		return var12.getOwnership(p3)[item.id]
	end)
	reactModule.useEffect(function() --[[ line: 72 ]]
		-- upvalues: item (ref), var12 (ref)
		if item.itemType == "GamePass" then
			var12.fetchGamePassOwnership(item.id)
		end
	end, { item.id, item.itemType, var12.fetchGamePassOwnership })
	local var14 = if var13 ~= nil then item.isOwned else var13
	local var15 = reactModule.useCallback(function() --[[ line: 83 ]]
		-- upvalues: initiateShopItemPurchaseModule (copy), item (ref), var8 (copy)
		initiateShopItemPurchaseModule(item.id, item.itemType, if var8 then var8.Category else nil)
	end, { item.id, item.itemType })
	local var16 = useShopReportOverflowModule.useShopReportOverflow({
		isReportingEnabled = sharedFlagsModule.FFlagEnableReportingFlowForExperienceShop,
		buildReportSession = reactModule.useCallback(function() --[[ line: 89 ]]
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
	local var17 = reactModule.useMemo(function() --[[ line: 107 ]]
		-- upvalues: formatUpdatedDateModule (copy), item (ref)
		return formatUpdatedDateModule(item.updated)
	end, { item.updated })
	local var18 = if item.itemType == "GamePass" then "Game pass" else var11.product
	local var19, var20 = reactModule.useState(false)
	
	return {
		itemId = item.id,
		name = item.name,
		thumbnail = item.thumbnail,
		price = item.price,
		isOwned = var14,
		isBuyDisabled = p2.disableBuy == true,
		description = item.description,
		creator = item.creator,
		categoryLabel = var18,
		updated = var17,
		isCompact = var19,
		isOverflowMenuOpen = var16.isOverflowMenuOpen,
		isReportingEnabled = var16.isReportingEnabled,
		reportSession = var16.reportSession,
		onClose = p2.onClose,
		onBuyActivated = var15,
		onOverflowActivated = var16.onOverflowActivated,
		onOverflowMenuClosed = var16.onOverflowMenuClosed,
		onMenuItemActivated = var16.onMenuItemActivated,
		onReportClose = var16.onReportClose,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p4) --[[ line: 115 ]]
			-- upvalues: var20 (ref)
			local x = p4.AbsoluteSize.X
			
			if x <= 0 then
				return
			end
			local var21 = x < 480
			var20(function(p5) --[[ line: 121 ]]
				-- upvalues: var21 (ref)
				return if p5 == var21 then p5 else var21
			end)
		end, {})
	}
end