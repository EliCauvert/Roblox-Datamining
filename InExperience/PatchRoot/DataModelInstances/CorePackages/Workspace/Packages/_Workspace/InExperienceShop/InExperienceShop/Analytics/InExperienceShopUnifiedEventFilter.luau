local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local UnifiedEventLogEnums = require(Parent.AvatarExperienceAnalytics).UnifiedEventLogEnums
local MarketplaceUnifiedAction = UnifiedEventLogEnums.MarketplaceUnifiedAction
local MarketplaceUnifiedItemType = UnifiedEventLogEnums.MarketplaceUnifiedItemType
local UnifiedLoggingSurface = require(Parent.AvatarExperienceNavigation).Enums.UnifiedLoggingSurface
local config = {
	[UnifiedLoggingSurface.IN_EXPERIENCE_SHOP_HOME] = true,
	[UnifiedLoggingSurface.IN_EXPERIENCE_SHOP_DETAILS] = true,
	[UnifiedLoggingSurface.IN_EXPERIENCE_SHOP_SEARCH] = true
}
local config1 = {
	[MarketplaceUnifiedItemType.GAME_PASS] = true,
	[MarketplaceUnifiedItemType.DEVELOPER_PRODUCT] = true,
	[MarketplaceUnifiedItemType.ROBUX] = true,
	[MarketplaceUnifiedItemType.ROBUX_WITH_BONUS] = true
}
local InExperienceShopUnifiedEventFilterModule = {
	hasItemId = function(p1): boolean
		local ItemId = p1.itemId
		
		return ItemId ~= nil and ItemId ~= ""
	end,
	hasValidItemType = function(p1): boolean
		-- upvalues: config1 (copy)
		return config1[p1.itemType] == true
	end,
	hasValidAction = function(p1): boolean
		-- upvalues: MarketplaceUnifiedAction (copy)
		local Action = p1.action
		
		return Action ~= nil and Action ~= MarketplaceUnifiedAction.UNDEFINED_ACTION
	end,
	hasValidSurface = function(p1): boolean
		-- upvalues: config (copy)
		return config[p1.surface] == true
	end,
	hasValidSizeAndPosition = function(p1): boolean
		-- upvalues: MarketplaceUnifiedAction (copy)
		local Action = p1.action
		
		if Action == MarketplaceUnifiedAction.ITEM_IMPRESSION or Action == MarketplaceUnifiedAction.ITEM_SELECTED or Action == MarketplaceUnifiedAction.ITEM_DESELECTED or Action == MarketplaceUnifiedAction.PURCHASE_SUCCESS then
			local ScreenSizeHeight = p1.screenSizeHeight or 0
			local ElementSizeWidth = p1.elementSizeWidth or 0
			local ElementSizeHeight = p1.elementSizeHeight or 0
			local GridPositionRow = p1.gridPositionRow or 0
			local GridPositionColumn = p1.gridPositionColumn or 0
			
			return (p1.screenSizeWidth or 0) > 0 and (ScreenSizeHeight > 0 and (ElementSizeWidth > 0 and (ElementSizeHeight > 0 and GridPositionRow > 0))) and GridPositionColumn > 0
		else
			return true
		end
	end,
	hasUniverseId = function(p1): boolean
		local UniverseId: number = p1.universeId
		
		return if typeof(UniverseId) == "number" then UniverseId > 0 else typeof(UniverseId) == "string" and UniverseId ~= ""
	end
}

function InExperienceShopUnifiedEventFilterModule.filter(p1)
	-- upvalues: InExperienceShopUnifiedEventFilterModule (copy)
	local HasItemId = InExperienceShopUnifiedEventFilterModule.hasItemId(p1)
	local HasValidItemType = InExperienceShopUnifiedEventFilterModule.hasValidItemType(p1)
	local HasValidAction = InExperienceShopUnifiedEventFilterModule.hasValidAction(p1)
	local HasValidSurface = InExperienceShopUnifiedEventFilterModule.hasValidSurface(p1)
	local HasValidSizeAndPosition = InExperienceShopUnifiedEventFilterModule.hasValidSizeAndPosition(p1)
	local HasUniverseId = InExperienceShopUnifiedEventFilterModule.hasUniverseId(p1)
	local HasUniverseId1 = HasItemId and (HasValidItemType and (HasValidAction and (HasValidSurface and (HasValidSizeAndPosition and HasUniverseId))))
	
	if not HasUniverseId1 then
		local Text = ""
		
		if not HasItemId then
			Text ..= "hasItemId "
		end
		if not HasValidItemType then
			Text ..= "hasValidItemType "
		end
		if not HasValidAction then
			Text ..= "hasValidAction "
		end
		if not HasValidSurface then
			Text ..= "hasValidSurface "
		end
		if not HasValidSizeAndPosition then
			Text ..= "hasValidSizeAndPosition "
		end
		if not HasUniverseId then
			Text ..= "hasUniverseId "
		end
		warn("Failed to send in-experience shop unified event. Failing Check(s): " .. Text)
	end
	return HasUniverseId1
end

return InExperienceShopUnifiedEventFilterModule