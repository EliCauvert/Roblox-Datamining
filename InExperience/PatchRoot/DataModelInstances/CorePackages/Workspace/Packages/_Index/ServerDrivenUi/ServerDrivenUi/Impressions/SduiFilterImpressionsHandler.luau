local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local filterImpressionsEvent = require(parent.GameFilters).filterImpressionsEvent
local sduiErrors = require(parent.SduiCoreSystem).SduiErrors

return function(p1, p2, p3, p4, _)
	-- upvalues: sduiErrors (ref), filterImpressionsEvent (ref)
	if not p4 then
		p1.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogFilterImpressions, {
			name = "SduiFilterImpressionsHandler",
			message = "Missing collectionAnalyticsData"
		}, p1.appPage)
		
		return
	elseif #p2 == 0 or #p3 == 0 then return end
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	for i, v in p2 do
		local var1 = p3[v]
		
		if var1 then
			table.insert(t, v)
			table.insert(t_1, var1.filterId or var1.id)
			table.insert(t_2, var1.selectedOptionId or "")
			table.insert(t_3, var1.selectedOptionContextTag or "0")
		else
			p1.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogFilterImpressions, {
				name = "SduiFilterImpressionsHandler",
				message = `Missing itemData at index {v}`
			}, p1.appPage)
		end
	end
	if #t_1 == 0 then
		return
	end
	filterImpressionsEvent(p1.dependencies.eventIngest, p1.appPage, {
		absPositions = table.concat(t, ","),
		filterIds = table.concat(t_1, ","),
		selectedOptionIds = table.concat(t_2, ","),
		selectedOptionContextTags = table.concat(t_3, ","),
		gameSetTypeId = tostring(p4.collectionId),
		gameSetTargetId = p4.gameSetTargetId,
		sortPos = p4.collectionPosition
	})
end