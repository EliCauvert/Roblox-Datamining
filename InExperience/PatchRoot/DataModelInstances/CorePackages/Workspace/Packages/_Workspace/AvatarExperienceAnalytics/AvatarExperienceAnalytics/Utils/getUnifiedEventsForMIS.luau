local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local CartIdServiceModule = require(AvatarExperienceAnalytics.Lib.CartIdService)
local UnifiedEventLogEnumsModule = require(AvatarExperienceAnalytics.UnifiedEventLogEnums)
local AXAddAttributionToCheckoutCartPurchases = game:DefineFastFlag("AXAddAttributionToCheckoutCartPurchases", false)

local function _(Text): string
	return "MIS_" .. Text
end

return function(List, List1, p1, p2, Action)
	-- upvalues: AXAddAttributionToCheckoutCartPurchases (copy), CartIdServiceModule (copy), UnifiedEventLogEnumsModule (copy)
	local NewPriceInRobux = 0
	local List2 = {}
	local List3 = {}
	local NewPriceInRobux1 = 0
	local List4 = {}
	local List5 = {}
	local List6 = {}
	local v1 = nil
	
	for _, value in List do
		if not p1 or not p1.lookAssetInfos[value.itemId] and not p1.lookBundleInfos[value.itemId] then
			if not p2 or not p2.lookAssetInfos[value.itemId] and not p2.lookBundleInfos[value.itemId] then
				v1 = nil
				
				for _, value1 in List1 do
					if value1.itemId == value.itemId and value1.itemType == value.itemType then
						v1 = value1
						break
					end
				end
				table.insert(List6, {
					cartId = if AXAddAttributionToCheckoutCartPurchases then "MIS_" .. CartIdServiceModule.getCartId() else CartIdServiceModule.getCartId(),
					action = Action,
					itemId = value.itemId,
					itemType = if value.itemType == "Asset" then UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.ASSET else UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.BUNDLE,
					assetType = if value.itemType == "Asset" then value.itemSubType else nil,
					bundleType = if value.itemType == "Bundle" then value.itemSubType else nil,
					widgetId = if v1.widgetInfo then v1.widgetInfo.widgetId else nil,
					widgetType = if v1.widgetInfo then v1.widgetInfo.widgetType else nil,
					widgetItemPrice = if v1.widgetInfo then value.priceInRobux else nil,
					organicItemPrice = if v1.widgetInfo then nil else value.priceInRobux,
					status = value.status
				})
				continue
			elseif p2.lookAssetInfos[value.itemId] then
				table.insert(List4, value.itemId)
				NewPriceInRobux1 += value.priceInRobux
			elseif p2.lookBundleInfos[value.itemId] then
				table.insert(List5, value.itemId)
				NewPriceInRobux1 += value.priceInRobux
			end
		elseif p1.lookAssetInfos[value.itemId] then
			table.insert(List2, value.itemId)
			NewPriceInRobux += value.priceInRobux
		elseif p1.lookBundleInfos[value.itemId] then
			table.insert(List3, value.itemId)
			NewPriceInRobux += value.priceInRobux
		end
	end
	if #List2 > 0 or #List3 > 0 then
		local Joined2: string = if #List2 > 0 then table.concat(List2, ",") else ""
		local Joined3: string = if #List3 > 0 then table.concat(List3, ",") else ""
		local config1 = {
			cartId = if AXAddAttributionToCheckoutCartPurchases then "MIS_" .. CartIdServiceModule.getCartId() else CartIdServiceModule.getCartId(),
			action = Action,
			itemId = p1.itemId,
			itemType = UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.LOOK
		}
		
		if p1.isOrganicLook then
			config1.organicAssetIds = Joined2
			config1.organicBundleIds = Joined3
			config1.organicItemPrice = NewPriceInRobux
		else
			config1.assetIds = Joined2
			config1.bundleIds = Joined3
			config1.widgetItemPrice = NewPriceInRobux
		end
		table.insert(List6, config1)
	end
	if #List4 > 0 or #List5 > 0 then
		local Joined: string = if #List4 > 0 then table.concat(List4, ",") else ""
		local Joined1: string = if #List5 > 0 then table.concat(List5, ",") else ""
		local config = {
			cartId = if AXAddAttributionToCheckoutCartPurchases then "MIS_" .. CartIdServiceModule.getCartId() else CartIdServiceModule.getCartId(),
			action = Action,
			itemId = p2.itemId,
			itemType = UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.LOOK
		}
		
		if p2.isOrganicLook then
			config.organicAssetIds = Joined
			config.organicBundleIds = Joined1
			config.organicItemPrice = NewPriceInRobux1
		else
			config.assetIds = Joined
			config.bundleIds = Joined1
			config.widgetItemPrice = NewPriceInRobux1
		end
		table.insert(List6, config)
	end
	return List6
end