local UnifiedEventLogEnumsModule = require(script.Parent.UnifiedEventLogEnums)
local SendUnifiedEventLogModule = require(script.Parent.sendUnifiedEventLog)

return function(List, RequestId)
	-- upvalues: SendUnifiedEventLogModule (copy), UnifiedEventLogEnumsModule (copy)
	for GridPositionRow, value in List do
		local List1 = {}
		local List2 = {}
		local List3 = {}
		
		if value.content then
			for _, value1 in value.content do
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