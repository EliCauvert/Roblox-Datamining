local parent = script:FindFirstAncestor("AvatarExperienceAnalytics").Parent
local unifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local unifiedLoggingSurface = require(parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local mutedError = require(parent.Loggers).mutedError
local sendAXCounterV2Module = require(script.Parent.sendAXCounterV2)

return function(p1)
	-- upvalues: unifiedLoggingSurface (ref), mutedError (ref), sendAXCounterV2Module (ref), unifiedEventLogEnumsModule (ref)
	local surface = p1.surface
	
	if not (if surface ~= unifiedLoggingSurface.DISCOVERY_HOMEPAGE then surface == unifiedLoggingSurface.DISCOVERY_SEARCH_RESULTS else true) or p1.hasWidgetAttribution then
		return nil
	elseif p1.itemId == nil then
		local t = {
			reason = "missingItemId",
			surface = tostring(surface),
			itemType = tostring(p1.itemType),
			assetType = tostring(p1.assetType),
			bundleType = tostring(p1.bundleType),
			hasItemPrice = tostring(p1.itemPrice ~= nil)
		}
		mutedError("buildDiscoveryPurchaseAttempt: dropped discovery PURCHASE_ATTEMPT with no itemId", t)
		sendAXCounterV2Module("DiscoveryPurchaseAttemptDropped", t)
		
		return nil
	end
	return {
		action = unifiedEventLogEnumsModule.MarketplaceUnifiedAction.PURCHASE_ATTEMPT,
		itemId = p1.itemId,
		itemType = p1.itemType,
		surface = surface,
		organicItemPrice = p1.itemPrice,
		assetType = p1.assetType,
		bundleType = p1.bundleType,
		cartId = p1.cartId
	}
end