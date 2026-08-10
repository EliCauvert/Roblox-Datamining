local parent = script:FindFirstAncestor("InExperienceShop").Parent
local unifiedEventLogEnums = require(parent.AvatarExperienceAnalytics).UnifiedEventLogEnums
local marketplaceUnifiedAction = unifiedEventLogEnums.MarketplaceUnifiedAction
local marketplaceUnifiedItemType = unifiedEventLogEnums.MarketplaceUnifiedItemType
local unifiedLoggingSurface = require(parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local t = {
	hasItemId = function(p0) --[[ line: 27 ]]
		local itemId = p0.itemId
		
		return itemId ~= nil and itemId ~= ""
	end
}
local t_1 = {
	[unifiedLoggingSurface.IN_EXPERIENCE_SHOP_HOME] = true,
	[unifiedLoggingSurface.IN_EXPERIENCE_SHOP_DETAILS] = true,
	[unifiedLoggingSurface.IN_EXPERIENCE_SHOP_SEARCH] = true
}
local t_2 = {
	[marketplaceUnifiedItemType.GAME_PASS] = true,
	[marketplaceUnifiedItemType.DEVELOPER_PRODUCT] = true,
	[marketplaceUnifiedItemType.ROBUX] = true,
	[marketplaceUnifiedItemType.ROBUX_WITH_BONUS] = true
}

function t.hasValidItemType(p1) --[[ line: 32 ]]
	-- upvalues: t_2 (ref)
	return t_2[p1.itemType] == true
end

function t.hasValidAction(p2) --[[ line: 36 ]]
	-- upvalues: marketplaceUnifiedAction (ref)
	local action = p2.action
	
	return action ~= nil and action ~= marketplaceUnifiedAction.UNDEFINED_ACTION
end

function t.hasValidSurface(p3) --[[ line: 41 ]]
	-- upvalues: t_1 (ref)
	return t_1[p3.surface] == true
end

function t.hasValidSizeAndPosition(p4) --[[ line: 45 ]]
	-- upvalues: marketplaceUnifiedAction (ref)
	local action = p4.action
	
	return if action == marketplaceUnifiedAction.ITEM_IMPRESSION or action == marketplaceUnifiedAction.ITEM_SELECTED or (action == marketplaceUnifiedAction.ITEM_DESELECTED or action == marketplaceUnifiedAction.PURCHASE_SUCCESS) then (p4.screenSizeWidth or 0) > 0 and ((p4.screenSizeHeight or 0) > 0 and ((p4.elementSizeWidth or 0) > 0 and ((p4.elementSizeHeight or 0) > 0 and ((p4.gridPositionRow or 0) > 0 and (p4.gridPositionColumn or 0) > 0)))) else true
end

function t.hasUniverseId(p5) --[[ line: 71 ]]
	local universeId = p5.universeId
	
	return if typeof(universeId) == "number" then universeId > 0 else typeof(universeId) == "string" and universeId ~= ""
end

function t.filter(p6) --[[ line: 82 ]]
	-- upvalues: t (ref)
	local var3 = t.hasItemId(p6)
	local var4 = t.hasValidItemType(p6)
	local var5 = t.hasValidAction(p6)
	local var6 = t.hasValidSurface(p6)
	local var7 = t.hasValidSizeAndPosition(p6)
	local var8 = t.hasUniverseId(p6)
	local var8_1 = var3 and (var4 and (var5 and (var6 and (var7 and var8))))
	
	if not var8_1 then
		local var10 = ""
		
		if not var3 then
			var10 ..= "hasItemId "
		end
		if not var4 then
			var10 ..= "hasValidItemType "
		end
		if not var5 then
			var10 ..= "hasValidAction "
		end
		if not var6 then
			var10 ..= "hasValidSurface "
		end
		if not var7 then
			var10 ..= "hasValidSizeAndPosition "
		end
		if not var8 then
			var10 ..= "hasUniverseId "
		end
		warn("Failed to send in-experience shop unified event. Failing Check(s): " .. var10)
	end
	return var8_1
end

return t