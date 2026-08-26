local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local cartIdServiceModule = require(avatarExperienceAnalytics.Lib.CartIdService)
local unifiedEventLogEnumsModule = require(avatarExperienceAnalytics.UnifiedEventLogEnums)

return function(p1, p2, p3, p4, p5)
	-- upvalues: cartIdServiceModule (ref), unifiedEventLogEnumsModule (ref)
	local var1
	local var2 = 0
	local t = {}
	local t_1 = {}
	local var3 = 0
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	
	for i, v in p1 do
		if p3 and (p3.lookAssetInfos[v.itemId] or p3.lookBundleInfos[v.itemId]) then
			if p3.lookAssetInfos[v.itemId] then
				table.insert(t, v.itemId)
				var2 += v.priceInRobux
			elseif p3.lookBundleInfos[v.itemId] then
				table.insert(t_1, v.itemId)
				var2 += v.priceInRobux
			end
		end
		if not p4 or not p4.lookAssetInfos[v.itemId] and not p4.lookBundleInfos[v.itemId] then
			var1 = nil
			
			for i_1, v_1 in p2 do
				if v_1.itemId == v.itemId and v_1.itemType == v.itemType then
					var1 = v_1
					break
				end
			end
			table.insert(t_4, {
				cartId = cartIdServiceModule.getCartId(),
				action = p5,
				itemId = v.itemId,
				itemType = if v.itemType == "Asset" then unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.ASSET else unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.BUNDLE,
				assetType = if v.itemType == "Asset" then v.itemSubType else nil,
				bundleType = if v.itemType == "Bundle" then v.itemSubType else nil,
				widgetId = if var1.widgetInfo then var1.widgetInfo.widgetId else nil,
				widgetType = if var1.widgetInfo then var1.widgetInfo.widgetType else nil,
				widgetItemPrice = if var1.widgetInfo then v.priceInRobux else nil,
				organicItemPrice = if var1.widgetInfo then nil else v.priceInRobux,
				status = v.status
			})
		elseif p4.lookAssetInfos[v.itemId] then
			table.insert(t_2, v.itemId)
			var3 += v.priceInRobux
		elseif p4.lookBundleInfos[v.itemId] then
			table.insert(t_3, v.itemId)
			var3 += v.priceInRobux
		end
	end
	if #t > 0 or #t_1 > 0 then
		local var4 = if #t > 0 then table.concat(t, ",") else ""
		local var5 = if #t_1 > 0 then table.concat(t_1, ",") else ""
		local t_5 = {
			cartId = cartIdServiceModule.getCartId(),
			action = p5,
			itemId = p3.itemId,
			itemType = unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.LOOK
		}
		
		if p3.isOrganicLook then
			t_5.organicAssetIds = var4
			t_5.organicBundleIds = var5
			t_5.organicItemPrice = var2
		else
			t_5.assetIds = var4
			t_5.bundleIds = var5
			t_5.widgetItemPrice = var2
		end
		table.insert(t_4, t_5)
	end
	if #t_2 > 0 or #t_3 > 0 then
		local var6 = if #t_2 > 0 then table.concat(t_2, ",") else ""
		local var7 = if #t_3 > 0 then table.concat(t_3, ",") else ""
		local t_5 = {
			cartId = cartIdServiceModule.getCartId(),
			action = p5,
			itemId = p4.itemId,
			itemType = unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.LOOK
		}
		
		if p4.isOrganicLook then
			t_5.organicAssetIds = var6
			t_5.organicBundleIds = var7
			t_5.organicItemPrice = var3
		else
			t_5.assetIds = var6
			t_5.bundleIds = var7
			t_5.widgetItemPrice = var3
		end
		table.insert(t_4, t_5)
	end
	return t_4
end