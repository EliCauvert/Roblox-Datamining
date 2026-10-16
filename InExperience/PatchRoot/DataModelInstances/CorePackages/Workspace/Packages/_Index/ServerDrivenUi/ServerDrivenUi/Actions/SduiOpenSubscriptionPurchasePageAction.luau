local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local DataHydrationModule = require(Parent.DataHydration)
local FFlagSduiSubscriptionCellPostPurchaseSync = require(Parent.SharedFlags).FFlagSduiSubscriptionCellPostPurchaseSync
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType

local function buildSubscriptionProductInfo(ActionParams) --[[ Line: 20 ]]
	return {
		isForSale = true,
		name = ActionParams.name or "",
		description = ActionParams.description or "",
		iconImageAssetId = tonumber(ActionParams.imageAssetId) or 0,
		subscriptionPeriod = ActionParams.periodType or "",
		displayPrice = ActionParams.priceDisplay or "",
		priceInRobux = tonumber(ActionParams.priceInRobux),
		priceTier = tonumber(ActionParams.priceTier) or 0,
		subscriptionProviderName = ActionParams.creatorName or "",
		subscriptionProviderId = ActionParams.universeId,
		subscriptionTargetKey = ActionParams.subscriptionId
	}
end

return function(p1, _, p2) --[[ Line: 36 ]]
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), buildSubscriptionProductInfo (copy), FFlagSduiSubscriptionCellPostPurchaseSync (copy), DataHydrationModule (copy), AppPage (copy)
	local Logger = p2.dependencies.logger
	local AppPage1 = p2.appPage
	local ActionParams = p1 and p1.actionParams
	
	if ActionParams == nil then
		Logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenSubscriptionPurchasePage
		}, AppPage1)
		
		return
	end
	local SubscriptionId = ActionParams.subscriptionId
	local UniverseId = ActionParams.universeId
	
	if typeof(SubscriptionId) ~= "string" or SubscriptionId == "" then
		Logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing or invalid subscriptionId",
			propName = "subscriptionId",
			name = SduiActionType.OpenSubscriptionPurchasePage
		}, AppPage1)
		
		return
	end
	if typeof(UniverseId) == "string" and UniverseId ~= "" then
		local IsIsSubscribed = ActionParams.isSubscribed == true
		p2.dependencies.getNavigation().push(AppPage.SubscriptionPurchase, {
			extraProps = {
				subscriptionPurchaseProductInfo = buildSubscriptionProductInfo(ActionParams),
				thumbnailString = ActionParams.thumbnailString or "",
				isSubScribed = IsIsSubscribed,
				isSubscribed = IsIsSubscribed,
				creatorName = ActionParams.creatorName,
				creatorVerified = ActionParams.creatorVerified,
				onPurchaseSuccess = if FFlagSduiSubscriptionCellPostPurchaseSync then function() --[[ Line: 86 ]]
					-- upvalues: DataHydrationModule (upval), SubscriptionId (copy)
					DataHydrationModule.Game.getGameSubscriptionStore(false).updateGameSubscriptionInfo(SubscriptionId, { isSubscribed = true })
				end else nil
			}
		})
		
		return
	else
		Logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing or invalid universeId",
			propName = "universeId",
			name = SduiActionType.OpenSubscriptionPurchasePage
		}, AppPage1)
	end
end