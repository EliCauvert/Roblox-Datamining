local AvatarExperienceFlagsModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceFlags)
local FFlagAXDeferWidgetLoadedUntilMarketplaceEntered = AvatarExperienceFlagsModule.FFlagAXDeferWidgetLoadedUntilMarketplaceEntered
local FFlagAXLimitWidgetLoadedItemCount = AvatarExperienceFlagsModule.FFlagAXLimitWidgetLoadedItemCount
local FIntAXWidgetLoadedItemCountLimit = AvatarExperienceFlagsModule.FIntAXWidgetLoadedItemCountLimit
local FFlagAXUnifiedEventCounters = AvatarExperienceFlagsModule.FFlagAXUnifiedEventCounters
local UnifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local SendUnifiedEventLogModule = require(script.Parent.sendUnifiedEventLog)
local GetUnifiedDeferredEventStoreModule = require(script.Parent.Store.getUnifiedDeferredEventStore)
local WIDGETLOADED = UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.WIDGET_LOADED

local function logWidgetLoaded(List, RequestId, Callback) --[[ Line: 22 ]]
	-- upvalues: FFlagAXDeferWidgetLoadedUntilMarketplaceEntered (copy), GetUnifiedDeferredEventStoreModule (copy), WIDGETLOADED (copy), logWidgetLoaded (copy), FFlagAXUnifiedEventCounters (copy), FFlagAXLimitWidgetLoadedItemCount (copy), FIntAXWidgetLoadedItemCountLimit (copy), SendUnifiedEventLogModule (copy), UnifiedEventLogEnumsModule (copy)
	if FFlagAXDeferWidgetLoadedUntilMarketplaceEntered then
		local UnifiedDeferredEventStoreModule = GetUnifiedDeferredEventStoreModule(false)
		
		if not UnifiedDeferredEventStoreModule.isEntered(false) then
			UnifiedDeferredEventStoreModule.enqueue(WIDGETLOADED, function() --[[ Line: 26 ]]
				-- upvalues: logWidgetLoaded (upval), List (copy), RequestId (copy), FFlagAXUnifiedEventCounters (upval), Callback (copy)
				logWidgetLoaded(List, RequestId, if FFlagAXUnifiedEventCounters then Callback else nil)
			end)
			
			return
		end
	end
	local CallbackResult = if FFlagAXUnifiedEventCounters and Callback ~= nil then Callback() else nil
	for GridPositionRow, value in List do
		local List1 = {}
		local List2 = {}
		local List3 = {}
		
		if value.content then
			for _, value1 in value.content do
				if FFlagAXLimitWidgetLoadedItemCount and FIntAXWidgetLoadedItemCountLimit <= #List3 then break end
				if value1.type == "Asset" then
					table.insert(List1, value1.id)
				elseif value1.type == "Bundle" then
					table.insert(List2, value1.id)
				end
				table.insert(List3, value1.id)
			end
		end
		SendUnifiedEventLogModule({
			gridPositionColumn = 1,
			action = UnifiedEventLogEnumsModule.MarketplaceUnifiedAction.WIDGET_LOADED,
			surface = if FFlagAXUnifiedEventCounters then CallbackResult else nil,
			requestId = RequestId,
			widgetId = value.id,
			widgetType = value.type,
			themeId = value.tagId,
			gridPositionRow = GridPositionRow,
			assetIds = table.concat(List1, ","),
			bundleIds = table.concat(List2, ","),
			widgetItemIds = table.concat(List3, ",")
		})
	end
end

return logWidgetLoaded