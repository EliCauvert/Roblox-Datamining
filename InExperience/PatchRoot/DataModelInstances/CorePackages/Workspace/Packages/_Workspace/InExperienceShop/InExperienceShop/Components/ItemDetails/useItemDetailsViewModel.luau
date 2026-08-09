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
local useShopReportOverflowModule = require(inExperienceShop.Hooks.useShopReportOverflow)
local _ = require(inExperienceShop.Types)
local _ = require(script.Parent.ItemDetailsView)
local t = { product = "Feature.DeveloperProducts.Label.Product" }

local function _(p0, p1) --[[ line: 44 | named "categoryLabelForType" ]]
	return if p0 == "GamePass" then "Game pass" else p1
end

return function(p2) --[[ line: 51 | named "useItemDetailsViewModel" ]]
	-- upvalues: useLocalization (ref), t (ref), signalsReactModule (ref), getInExperienceShopStoreModule (ref), reactModule (ref), initiateShopItemPurchaseModule (ref), sharedFlagsModule (ref), abuseVectorModule (ref), useShopReportOverflowModule (ref), formatUpdatedDateModule (ref)
	local item = p2.item
	local var10 = useLocalization(t)
	local var11 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	local var12 = signalsReactModule.useSignalState(function(p3) --[[ line: 61 ]]
		-- upvalues: var11 (ref), item (ref)
		return var11.getOwnership(p3)[item.id]
	end)
	reactModule.useEffect(function() --[[ line: 69 ]]
		-- upvalues: item (ref), var11 (ref)
		if item.itemType == "GamePass" then
			var11.fetchGamePassOwnership(item.id)
		end
	end, { item.id, item.itemType, var11.fetchGamePassOwnership })
	local var13 = if var12 ~= nil then item.isOwned else var12
	local var14 = reactModule.useCallback(function() --[[ line: 80 ]]
		-- upvalues: initiateShopItemPurchaseModule (copy), item (ref)
		initiateShopItemPurchaseModule(item.id, item.itemType)
	end, { item.id, item.itemType })
	local var15 = useShopReportOverflowModule.useShopReportOverflow({
		isReportingEnabled = sharedFlagsModule.FFlagEnableReportingFlowForExperienceShop,
		buildReportSession = reactModule.useCallback(function() --[[ line: 86 ]]
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
	local var16 = reactModule.useMemo(function() --[[ line: 104 ]]
		-- upvalues: formatUpdatedDateModule (copy), item (ref)
		return formatUpdatedDateModule(item.updated)
	end, { item.updated })
	local var17 = if item.itemType == "GamePass" then "Game pass" else var10.product
	local var18, var19 = reactModule.useState(false)
	
	return {
		itemId = item.id,
		name = item.name,
		thumbnail = item.thumbnail,
		price = item.price,
		isOwned = var13,
		isBuyDisabled = p2.disableBuy == true,
		description = item.description,
		creator = item.creator,
		categoryLabel = var17,
		updated = var16,
		isCompact = var18,
		isOverflowMenuOpen = var15.isOverflowMenuOpen,
		isReportingEnabled = var15.isReportingEnabled,
		reportSession = var15.reportSession,
		onClose = p2.onClose,
		onBuyActivated = var14,
		onOverflowActivated = var15.onOverflowActivated,
		onOverflowMenuClosed = var15.onOverflowMenuClosed,
		onMenuItemActivated = var15.onMenuItemActivated,
		onReportClose = var15.onReportClose,
		onAbsoluteSizeChanged = reactModule.useCallback(function(p4) --[[ line: 112 ]]
			-- upvalues: var19 (ref)
			local x = p4.AbsoluteSize.X
			
			if x <= 0 then
				return
			end
			local var20 = x < 480
			var19(function(p5) --[[ line: 118 ]]
				-- upvalues: var20 (ref)
				return if p5 == var20 then p5 else var20
			end)
		end, {})
	}
end