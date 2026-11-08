local HttpService = game:GetService("HttpService")
local AvatarExperienceAnalyticsModule = require(script:FindFirstAncestor("InExperienceShop").Parent.AvatarExperienceAnalytics)
local UnifiedEventLogEnums = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums
local MarketplaceUnifiedActionNumbers = UnifiedEventLogEnums.MarketplaceUnifiedActionNumbers
local MarketplaceUnifiedItemType = UnifiedEventLogEnums.MarketplaceUnifiedItemType
local SendPassthroughUnifiedEventLogFunction = AvatarExperienceAnalyticsModule.sendPassthroughUnifiedEventLog
local SendUnifiedEventLogFunction = AvatarExperienceAnalyticsModule.sendUnifiedEventLog
local GetShopUnifiedLoggingSurfaceModule = require(script.Parent.getShopUnifiedLoggingSurface)

return {
	successAction = 12,
	failureAction = 13,
	trialElement = "GAME_PASS_TRIAL",
	send = function(p1)
		-- upvalues: GetShopUnifiedLoggingSurfaceModule (copy), MarketplaceUnifiedItemType (copy), HttpService (copy), AvatarExperienceAnalyticsModule (copy), SendPassthroughUnifiedEventLogFunction (copy), SendUnifiedEventLogFunction (copy)
		local config = {
			action = p1.action,
			surface = GetShopUnifiedLoggingSurfaceModule(p1.shopPageType),
			itemId = p1.itemId,
			itemType = MarketplaceUnifiedItemType.GAME_PASS,
			elementName = p1.elementName,
			universeId = if p1.universeId == nil then game.GameId else p1.universeId
		}
		
		if p1.trialStatus ~= nil then
			config.trialStatus = p1.trialStatus
		end
		if p1.metadata ~= nil then
			config.elementMetadata = HttpService:JSONEncode(p1.metadata)
		end
		if AvatarExperienceAnalyticsModule.Flags.FFlagAXUnifiedEventStrictPayloads then
			SendPassthroughUnifiedEventLogFunction(config)
			
			return
		else
			SendUnifiedEventLogFunction(config)
		end
	end,
	clickAction = MarketplaceUnifiedActionNumbers.UI_ELEMENT_CLICK,
	impressionAction = MarketplaceUnifiedActionNumbers.UI_ELEMENT_IMPRESSION
}