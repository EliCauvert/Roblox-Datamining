local avatarExperienceFlagsModule = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AvatarExperienceFlags)
local fFlagAXDeferWidgetLoadedUntilMarketplaceEntered = avatarExperienceFlagsModule.FFlagAXDeferWidgetLoadedUntilMarketplaceEntered
local fFlagAXLimitWidgetLoadedItemCount = avatarExperienceFlagsModule.FFlagAXLimitWidgetLoadedItemCount
local fIntAXWidgetLoadedItemCountLimit = avatarExperienceFlagsModule.FIntAXWidgetLoadedItemCountLimit
local unifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local sendUnifiedEventLogModule = require(script.Parent.sendUnifiedEventLog)
local getUnifiedDeferredEventStoreModule = require(script.Parent.Store.getUnifiedDeferredEventStore)
local WIDGET_LOADED = unifiedEventLogEnumsModule.MarketplaceUnifiedAction.WIDGET_LOADED

local function logWidgetLoaded(p1, p2)
	-- upvalues: fFlagAXDeferWidgetLoadedUntilMarketplaceEntered (ref), getUnifiedDeferredEventStoreModule (ref), WIDGET_LOADED (ref), logWidgetLoaded (ref), fFlagAXLimitWidgetLoadedItemCount (ref), fIntAXWidgetLoadedItemCountLimit (ref), sendUnifiedEventLogModule (ref), unifiedEventLogEnumsModule (ref)
	if fFlagAXDeferWidgetLoadedUntilMarketplaceEntered then
		local var1 = getUnifiedDeferredEventStoreModule(false)
		
		if not var1.isEntered(false) then
			var1.enqueue(WIDGET_LOADED, function()
				-- upvalues: logWidgetLoaded (copy), p1 (ref), p2 (ref)
				logWidgetLoaded(p1, p2)
			end)
			
			return
		end
	end
	for i, v in p1 do
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		if v.content then
			for i_1, v_1 in v.content do
				if fFlagAXLimitWidgetLoadedItemCount and fIntAXWidgetLoadedItemCountLimit <= #t_2 then break end
				if v_1.type == "Asset" then
					table.insert(t, v_1.id)
				elseif v_1.type == "Bundle" then
					table.insert(t_1, v_1.id)
				end
				table.insert(t_2, v_1.id)
			end
		end
		sendUnifiedEventLogModule({
			gridPositionColumn = 1,
			action = unifiedEventLogEnumsModule.MarketplaceUnifiedAction.WIDGET_LOADED,
			requestId = p2,
			widgetId = v.id,
			widgetType = v.type,
			themeId = v.tagId,
			gridPositionRow = i,
			assetIds = table.concat(t, ","),
			bundleIds = table.concat(t_1, ","),
			widgetItemIds = table.concat(t_2, ",")
		})
	end
end

return logWidgetLoaded