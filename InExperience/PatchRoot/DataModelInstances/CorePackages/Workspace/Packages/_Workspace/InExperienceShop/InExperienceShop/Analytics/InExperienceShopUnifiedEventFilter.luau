local parent = script:FindFirstAncestor("InExperienceShop").Parent
local unifiedEventLogEnums = require(parent.AvatarExperienceAnalytics).UnifiedEventLogEnums
local marketplaceUnifiedAction = unifiedEventLogEnums.MarketplaceUnifiedAction
local marketplaceUnifiedItemType = unifiedEventLogEnums.MarketplaceUnifiedItemType
local unifiedLoggingSurface = require(parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local t = {
	hasItemId = function(p1)
		local itemId = p1.itemId
		
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

function t.hasValidItemType(p1)
	-- upvalues: t_2 (ref)
	return t_2[p1.itemType] == true
end

function t.hasValidAction(p1)
	-- upvalues: marketplaceUnifiedAction (ref)
	local action = p1.action
	
	return action ~= nil and action ~= marketplaceUnifiedAction.UNDEFINED_ACTION
end

function t.hasValidSurface(p1)
	-- upvalues: t_1 (ref)
	return t_1[p1.surface] == true
end

function t.hasValidSizeAndPosition(p1)
	-- upvalues: marketplaceUnifiedAction (ref)
	local action = p1.action
	
	return if action == marketplaceUnifiedAction.ITEM_IMPRESSION or action == marketplaceUnifiedAction.ITEM_SELECTED or (action == marketplaceUnifiedAction.ITEM_DESELECTED or action == marketplaceUnifiedAction.PURCHASE_SUCCESS) then (p1.screenSizeWidth or 0) > 0 and ((p1.screenSizeHeight or 0) > 0 and ((p1.elementSizeWidth or 0) > 0 and ((p1.elementSizeHeight or 0) > 0 and ((p1.gridPositionRow or 0) > 0 and (p1.gridPositionColumn or 0) > 0)))) else true
end

function t.hasUniverseId(p1)
	local universeId = p1.universeId
	
	return if typeof(universeId) == "number" then universeId > 0 else typeof(universeId) == "string" and universeId ~= ""
end

function t.filter(p1)
	-- upvalues: t (ref)
	local var1 = t.hasItemId(p1)
	local var2 = t.hasValidItemType(p1)
	local var3 = t.hasValidAction(p1)
	local var4 = t.hasValidSurface(p1)
	local var5 = t.hasValidSizeAndPosition(p1)
	local var6 = t.hasUniverseId(p1)
	local var7 = var1 and (var2 and (var3 and (var4 and (var5 and var6))))
	
	if not var7 then
		local var8 = ""
		
		if not var1 then
			var8 ..= "hasItemId "
		end
		if not var2 then
			var8 ..= "hasValidItemType "
		end
		if not var3 then
			var8 ..= "hasValidAction "
		end
		if not var4 then
			var8 ..= "hasValidSurface "
		end
		if not var5 then
			var8 ..= "hasValidSizeAndPosition "
		end
		if not var6 then
			var8 ..= "hasUniverseId "
		end
		warn("Failed to send in-experience shop unified event. Failing Check(s): " .. var10)
	end
	return var7
end

return t