local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local appPage = require(parent.RobloxAppEnums).AppPage
local dataHydrationModule = require(parent.DataHydration)
local fFlagSduiSubscriptionCellPostPurchaseSync = require(parent.SharedFlags).FFlagSduiSubscriptionCellPostPurchaseSync
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType

local function buildSubscriptionProductInfo(p1)
	return {
		isForSale = true,
		name = p1.name or "",
		description = p1.description or "",
		iconImageAssetId = tonumber(p1.imageAssetId) or 0,
		subscriptionPeriod = p1.periodType or "",
		displayPrice = p1.priceDisplay or "",
		priceInRobux = tonumber(p1.priceInRobux),
		priceTier = tonumber(p1.priceTier) or 0,
		subscriptionProviderName = p1.creatorName or "",
		subscriptionProviderId = p1.universeId,
		subscriptionTargetKey = p1.subscriptionId
	}
end

return function(p1, _, p2)
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
		local var1 = actionParams.isSubscribed == true
		p2.dependencies.getNavigation().push(appPage.SubscriptionPurchase, {
			extraProps = {
				subscriptionPurchaseProductInfo = buildSubscriptionProductInfo(actionParams),
				thumbnailString = actionParams.thumbnailString or "",
				isSubScribed = var1,
				isSubscribed = var1,
				creatorName = actionParams.creatorName,
				creatorVerified = actionParams.creatorVerified,
				onPurchaseSuccess = if fFlagSduiSubscriptionCellPostPurchaseSync then function()
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