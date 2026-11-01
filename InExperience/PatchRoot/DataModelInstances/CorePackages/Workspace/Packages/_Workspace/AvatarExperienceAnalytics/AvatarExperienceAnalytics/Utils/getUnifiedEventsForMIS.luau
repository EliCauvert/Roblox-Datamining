local AvatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local Parent = AvatarExperienceAnalytics.Parent
local _ = require(Parent.AvatarExperienceCommon)
local CryoModule = require(Parent.Cryo)
local CartIdServiceModule = require(AvatarExperienceAnalytics.Lib.CartIdService)
local UnifiedEventLogEnumsModule = require(AvatarExperienceAnalytics.UnifiedEventLogEnums)
local GetMarketplaceUnifiedAssetTypeModule = require(AvatarExperienceAnalytics.Utils.getMarketplaceUnifiedAssetType)
local GetMarketplaceUnifiedBundleTypeModule = require(AvatarExperienceAnalytics.Utils.getMarketplaceUnifiedBundleType)
local GetWidgetAttributionFieldsModule = require(AvatarExperienceAnalytics.Utils.getWidgetAttributionFields)
local FFlagAXUnifiedEventStrictPayloads = require(Parent.AvatarExperienceFlags).FFlagAXUnifiedEventStrictPayloads

local function _(Text): string
	return "MIS_" .. Text
end

return function(List, List1, p1, p2, Action, p3, p4, p5)
	-- upvalues: CartIdServiceModule (copy), UnifiedEventLogEnumsModule (copy), FFlagAXUnifiedEventStrictPayloads (copy), GetMarketplaceUnifiedAssetTypeModule (copy), GetMarketplaceUnifiedBundleTypeModule (copy), GetWidgetAttributionFieldsModule (copy), CryoModule (copy)
	local NewPriceInRobux = 0
	local List2 = {}
	local List3 = {}
	local NewPriceInRobux1 = 0
	local List4 = {}
	local List5 = {}
	local List6 = {}
	local JoinResults = {}
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
					cartId = "MIS_" .. CartIdServiceModule.getCartId(),
					action = Action,
					itemId = value.itemId,
					itemType = if value.itemType == "Asset" then UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.ASSET else UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.BUNDLE,
					surface = if FFlagAXUnifiedEventStrictPayloads then p3 else nil,
					assetType = if value.itemType == "Asset" then if FFlagAXUnifiedEventStrictPayloads then GetMarketplaceUnifiedAssetTypeModule(value.itemSubType) else value.itemSubType else nil,
					bundleType = if value.itemType == "Bundle" then if FFlagAXUnifiedEventStrictPayloads then GetMarketplaceUnifiedBundleTypeModule(value.itemSubType) else value.itemSubType else nil,
					widgetId = if v1.widgetInfo then v1.widgetInfo.widgetId else nil,
					widgetType = if v1.widgetInfo then v1.widgetInfo.widgetType else nil,
					widgetItemPrice = if v1.widgetInfo then value.priceInRobux else nil,
					organicItemPrice = if v1.widgetInfo then nil else value.priceInRobux,
					status = value.status
				})
				local WidgetAttributionFieldsModule = if FFlagAXUnifiedEventStrictPayloads then GetWidgetAttributionFieldsModule(v1.widgetInfo) else nil
				
				if WidgetAttributionFieldsModule then
					JoinResults[#List6] = CryoModule.Dictionary.join(WidgetAttributionFieldsModule, {
						widgetAssetType = if value.itemType == "Asset" then GetMarketplaceUnifiedAssetTypeModule(value.itemSubType) else nil,
						widgetBundleType = if value.itemType == "Bundle" then GetMarketplaceUnifiedBundleTypeModule(value.itemSubType) else nil
					})
				end
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
		local Joined: string = if #List2 > 0 then table.concat(List2, ",") else ""
		local Joined1: string = if #List3 > 0 then table.concat(List3, ",") else ""
		local config = {
			cartId = "MIS_" .. CartIdServiceModule.getCartId(),
			action = Action,
			itemId = p1.itemId,
			itemType = UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.LOOK,
			surface = if FFlagAXUnifiedEventStrictPayloads then p3 else nil
		}
		
		if p1.isOrganicLook then
			config.organicAssetIds = Joined
			config.organicBundleIds = Joined1
			config.organicItemPrice = NewPriceInRobux
		else
			config.assetIds = Joined
			config.bundleIds = Joined1
			config.widgetItemPrice = NewPriceInRobux
		end
		table.insert(List6, config)
		local WidgetAttributionFieldsModule = if FFlagAXUnifiedEventStrictPayloads and not p1.isOrganicLook then GetWidgetAttributionFieldsModule(p4) else nil
		
		if WidgetAttributionFieldsModule then
			JoinResults[#List6] = WidgetAttributionFieldsModule
		end
	end
	if #List4 > 0 or #List5 > 0 then
		local Joined: string = if #List4 > 0 then table.concat(List4, ",") else ""
		local Joined2: string = if #List5 > 0 then table.concat(List5, ",") else ""
		local config = {
			cartId = "MIS_" .. CartIdServiceModule.getCartId(),
			action = Action,
			itemId = p2.itemId,
			itemType = UnifiedEventLogEnumsModule.MarketplaceUnifiedItemType.LOOK,
			surface = if FFlagAXUnifiedEventStrictPayloads then p3 else nil
		}
		
		if p2.isOrganicLook then
			config.organicAssetIds = Joined
			config.organicBundleIds = Joined2
			config.organicItemPrice = NewPriceInRobux1
		else
			config.assetIds = Joined
			config.bundleIds = Joined2
			config.widgetItemPrice = NewPriceInRobux1
		end
		table.insert(List6, config)
		local WidgetAttributionFieldsModule = if FFlagAXUnifiedEventStrictPayloads and not p2.isOrganicLook then GetWidgetAttributionFieldsModule(p5) else nil
		
		if WidgetAttributionFieldsModule then
			JoinResults[#List6] = WidgetAttributionFieldsModule
		end
	end
	return List6, JoinResults
end