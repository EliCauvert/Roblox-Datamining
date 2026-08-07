local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local dataHydrationModule = require(parent.DataHydration)
local fFlagSduiSubscriptionCellPostPurchaseSync = require(parent.SharedFlags).FFlagSduiSubscriptionCellPostPurchaseSync
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

local function buildSubscriptionProductInfo(p0) --[[ line: 20 ]]
	return {
		isForSale = true,
		name = p0.name or "",
		description = p0.description or "",
		iconImageAssetId = tonumber(p0.imageAssetId) or 0,
		subscriptionPeriod = p0.periodType or "",
		displayPrice = p0.priceDisplay or "",
		priceInRobux = tonumber(p0.priceInRobux),
		priceTier = tonumber(p0.priceTier) or 0,
		subscriptionProviderName = p0.creatorName or "",
		subscriptionProviderId = p0.universeId,
		subscriptionTargetKey = p0.subscriptionId
	}
end

return function(p1, _, p2) --[[ line: 36 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), buildSubscriptionProductInfo (ref), fFlagSduiSubscriptionCellPostPurchaseSync (ref), dataHydrationModule (ref), appPage (ref)
	local logger = p2.dependencies.logger
	local appPage_1 = p2.appPage
	local actionParams = p1 and p1.actionParams
	
	if actionParams == nil then
		logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenSubscriptionPurchasePage
		}, appPage_1)
		
		return
	end
	local subscriptionId = actionParams.subscriptionId
	local universeId = actionParams.universeId
	
	if typeof(subscriptionId) ~= "string" or subscriptionId == "" then
		logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing or invalid subscriptionId",
			propName = "subscriptionId",
			name = sduiActionType.OpenSubscriptionPurchasePage
		}, appPage_1)
		
		return
	elseif typeof(universeId) == "string" and universeId ~= "" then
		local var4 = actionParams.isSubscribed == true
		p2.dependencies.getNavigation().push(appPage.SubscriptionPurchase, {
			extraProps = {
				subscriptionPurchaseProductInfo = buildSubscriptionProductInfo(actionParams),
				thumbnailString = actionParams.thumbnailString or "",
				isSubScribed = var4,
				isSubscribed = var4,
				creatorName = actionParams.creatorName,
				creatorVerified = actionParams.creatorVerified,
				onPurchaseSuccess = if fFlagSduiSubscriptionCellPostPurchaseSync then function() --[[ line: 86 ]]
					-- upvalues: dataHydrationModule (copy), subscriptionId (ref)
					dataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfo(subscriptionId, { isSubscribed = true })
				end else nil
			}
		})
		
		return
	end
	logger.reportError(sduiErrorType.InvalidActionParams, {
		message = "Missing or invalid universeId",
		propName = "universeId",
		name = sduiActionType.OpenSubscriptionPurchasePage
	}, appPage_1)
end