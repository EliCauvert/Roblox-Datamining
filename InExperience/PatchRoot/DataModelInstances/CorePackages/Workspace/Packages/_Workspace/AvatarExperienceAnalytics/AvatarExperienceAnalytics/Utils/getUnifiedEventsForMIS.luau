local avatarExperienceAnalytics = script:FindFirstAncestor("AvatarExperienceAnalytics")
local cartIdServiceModule = require(avatarExperienceAnalytics.Lib.CartIdService)
local unifiedEventLogEnumsModule = require(avatarExperienceAnalytics.UnifiedEventLogEnums)

return function(p0, p1, p2, p3, p4) --[[ line: 13 ]]
	-- upvalues: cartIdServiceModule (ref), unifiedEventLogEnumsModule (ref)
	local var16
	local var3 = 0
	local t = {}
	local t_1 = {}
	local var6 = 0
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	
	for i, v in p0 do
		if p2 and (p2.lookAssetInfos[v.itemId] or p2.lookBundleInfos[v.itemId]) then
			if p2.lookAssetInfos[v.itemId] then
				table.insert(t, v.itemId)
				var3 += v.priceInRobux
			elseif p2.lookBundleInfos[v.itemId] then
				table.insert(t_1, v.itemId)
				var3 += v.priceInRobux
			end
		end
		if not p3 or not p3.lookAssetInfos[v.itemId] and not p3.lookBundleInfos[v.itemId] then
			var16 = nil
			
			for i_1, v_1 in p1 do
				if v_1.itemId == v.itemId and v_1.itemType == v.itemType then
					var16 = v_1
					break
				end
			end
			table.insert(t_4, {
				cartId = cartIdServiceModule.getCartId(),
				action = p4,
				itemId = v.itemId,
				itemType = if v.itemType == "Asset" then unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.ASSET else unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.BUNDLE,
				assetType = if v.itemType == "Asset" then v.itemSubType else nil,
				bundleType = if v.itemType == "Bundle" then v.itemSubType else nil,
				widgetId = if var16.widgetInfo then var16.widgetInfo.widgetId else nil,
				widgetType = if var16.widgetInfo then var16.widgetInfo.widgetType else nil,
				widgetItemPrice = if var16.widgetInfo then v.priceInRobux else nil,
				organicItemPrice = if var16.widgetInfo then nil else v.priceInRobux,
				status = v.status
			})
		elseif p3.lookAssetInfos[v.itemId] then
			table.insert(t_2, v.itemId)
			var6 += v.priceInRobux
		elseif p3.lookBundleInfos[v.itemId] then
			table.insert(t_3, v.itemId)
			var6 += v.priceInRobux
		end
	end
	if #t > 0 or #t_1 > 0 then
		local var10 = if #t > 0 then table.concat(t, ",") else ""
		local var11 = if #t_1 > 0 then table.concat(t_1, ",") else ""
		local t_5 = {
			cartId = cartIdServiceModule.getCartId(),
			action = p4,
			itemId = p2.itemId,
			itemType = unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.LOOK
		}
		
		if p2.isOrganicLook then
			t_5.organicAssetIds = var10
			t_5.organicBundleIds = var11
			t_5.organicItemPrice = var3
		else
			t_5.assetIds = var10
			t_5.bundleIds = var11
			t_5.widgetItemPrice = var3
		end
		table.insert(t_4, t_5)
	end
	if #t_2 > 0 or #t_3 > 0 then
		local var13 = if #t_2 > 0 then table.concat(t_2, ",") else ""
		local var14 = if #t_3 > 0 then table.concat(t_3, ",") else ""
		local t_5 = {
			cartId = cartIdServiceModule.getCartId(),
			action = p4,
			itemId = p3.itemId,
			itemType = unifiedEventLogEnumsModule.MarketplaceUnifiedItemType.LOOK
		}
		
		if p3.isOrganicLook then
			t_5.organicAssetIds = var13
			t_5.organicBundleIds = var14
			t_5.organicItemPrice = var6
		else
			t_5.assetIds = var13
			t_5.bundleIds = var14
			t_5.widgetItemPrice = var6
		end
		table.insert(t_4, t_5)
	end
	return t_4
end