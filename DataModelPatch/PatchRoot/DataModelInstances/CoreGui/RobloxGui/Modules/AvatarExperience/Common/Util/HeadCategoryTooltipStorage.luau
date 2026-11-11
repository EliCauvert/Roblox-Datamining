local AXHeadCategoryCombineTooltipExpirationDurationDays = game:DefineFastInt("AXHeadCategoryCombineTooltipExpirationDurationDays", 7)
local AppStorageService = game:GetService("AppStorageService")

local function getMockAppStorageService()
	return {
		storage = {},
		GetItem = function(p1, p2)
			return p1.storage[p2]
		end,
		SetItem = function(p1, p2, p3)
			p1.storage[p2] = p3
		end,
		Flush = function(_) end
	}
end

if not game:GetEngineFeature("AXMarketplaceHeadTooltipKeys") then
	AppStorageService = getMockAppStorageService()
end
local function _()
	-- upvalues: AppStorageService (ref)
	local AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestampItem = nil
	pcall(function()
		-- upvalues: AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestampItem (ref), AppStorageService (upval)
		AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestampItem = AppStorageService:GetItem("AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestamp") or nil
	end)
	
	return AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestampItem
end

local HeadCategoryTooltipStorageModule = {
	__mockAppStorageService = function(p1)
		-- upvalues: AppStorageService (ref), getMockAppStorageService (copy)
		AppStorageService = if p1 then p1 else getMockAppStorageService()
	end,
	getSeenTimestamp = function()
		-- upvalues: AppStorageService (ref)
		local AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestampItem = nil
		pcall(function()
			-- upvalues: AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestampItem (ref), AppStorageService (upval)
			AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestampItem = AppStorageService:GetItem("AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestamp") or nil
		end)
		local AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestampItem1 = AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestampItem
		
		return if AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestampItem1 then tonumber(AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestampItem1) else nil
	end,
	setSeenTimestamp = function()
		-- upvalues: AppStorageService (ref)
		pcall(function()
			-- upvalues: AppStorageService (upval)
			AppStorageService:SetItem("AXMarketplaceCombinedHeadCategoriesTooltipSeenTimestamp", (tostring(os.time())))
			AppStorageService:Flush()
		end)
	end
}

function HeadCategoryTooltipStorageModule.shouldShowTooltip(): boolean
	-- upvalues: HeadCategoryTooltipStorageModule (copy), AXHeadCategoryCombineTooltipExpirationDurationDays (copy)
	local SeenTimestamp = HeadCategoryTooltipStorageModule.getSeenTimestamp()
	
	return not SeenTimestamp or AXHeadCategoryCombineTooltipExpirationDurationDays * 86400 <= os.difftime(os.time(), SeenTimestamp)
end

return HeadCategoryTooltipStorageModule