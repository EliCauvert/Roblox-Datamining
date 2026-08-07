local unifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local sendUnifiedEventLogModule = require(script.Parent.sendUnifiedEventLog)

return function(p0, p1) --[[ line: 4 | named "logWidgetLoaded" ]]
	-- upvalues: sendUnifiedEventLogModule (ref), unifiedEventLogEnumsModule (ref)
	for i, v in p0 do
		local t = {}
		local t_1 = {}
		local t_2 = {}
		
		if v.content then
			for i_1, v_1 in v.content do
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
			requestId = p1,
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