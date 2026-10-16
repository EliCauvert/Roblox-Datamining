local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local FilterImpressionsEventFunction = require(Parent.GameFilters).filterImpressionsEvent
local SduiErrors = require(Parent.SduiCoreSystem).SduiErrors

return function(p1, List, p2, p3, _) --[[ Line: 13 | Named "SduiFilterImpressionsHandler" ]]
	-- upvalues: SduiErrors (copy), FilterImpressionsEventFunction (copy)
	if not p3 then
		p1.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogFilterImpressions, {
			name = "SduiFilterImpressionsHandler",
			message = "Missing collectionAnalyticsData"
		}, p1.appPage)
		
		return
	end
	if #List == 0 or #p2 == 0 then return end
	local List1 = {}
	local List2 = {}
	local List3 = {}
	local List4 = {}
	
	for _, value in List do
		local v1 = p2[value]
		
		if v1 then
			table.insert(List1, value)
			table.insert(List2, v1.filterId or v1.id)
			table.insert(List3, v1.selectedOptionId or "")
			table.insert(List4, v1.selectedOptionContextTag or "0")
		else
			p1.dependencies.logger.reportError(SduiErrors.SduiErrorType.FailedToLogFilterImpressions, {
				name = "SduiFilterImpressionsHandler",
				message = `Missing itemData at index {value}`
			}, p1.appPage)
		end
	end
	if #List2 ~= 0 then
		FilterImpressionsEventFunction(p1.dependencies.eventIngest, p1.appPage, {
			absPositions = table.concat(List1, ","),
			filterIds = table.concat(List2, ","),
			selectedOptionIds = table.concat(List3, ","),
			selectedOptionContextTags = table.concat(List4, ","),
			gameSetTypeId = tostring(p3.collectionId),
			gameSetTargetId = p3.gameSetTargetId,
			sortPos = p3.collectionPosition
		})
		
		return
	end
end