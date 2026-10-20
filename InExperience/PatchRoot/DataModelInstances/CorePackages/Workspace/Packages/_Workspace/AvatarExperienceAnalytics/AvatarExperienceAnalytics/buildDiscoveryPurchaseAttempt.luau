local Parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local UnifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local MutedErrorFunction = require(Parent.Loggers).mutedError
local SendAXCounterV2Module = require(script.Parent.sendAXCounterV2)

return function(p1)
	-- upvalues: UnifiedLoggingSurface (copy), MutedErrorFunction (copy), SendAXCounterV2Module (copy), UnifiedEventLogEnumsModule (copy)
	local Surface = p1.surface
	
	if Surface ~= UnifiedLoggingSurface.DISCOVERY_HOMEPAGE and Surface ~= UnifiedLoggingSurface.DISCOVERY_SEARCH_RESULTS or p1.hasWidgetAttribution then
		return nil
	elseif p1.itemId == nil then
		local config = {
			reason = "missingItemId",
			surface = tostring(Surface),
			itemType = tostring(p1.itemType),
			assetType = tostring(p1.assetType),
			bundleType = tostring(p1.bundleType),
			hasItemPrice = tostring(p1.itemPrice ~= nil)
		}
		MutedErrorFunction("buildDiscoveryPurchaseAttempt: dropped discovery PURCHASE_ATTEMPT with no itemId", config)
		SendAXCounterV2Module("DiscoveryPurchaseAttemptDropped", config)
		
		return nil
	else
		return {
			action = UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
			itemId = p1.itemId,
			itemType = p1.itemType,
			surface = Surface,
			organicItemPrice = p1.itemPrice,
			assetType = p1.assetType,
			bundleType = p1.bundleType,
			cartId = p1.cartId
		}
	end
end