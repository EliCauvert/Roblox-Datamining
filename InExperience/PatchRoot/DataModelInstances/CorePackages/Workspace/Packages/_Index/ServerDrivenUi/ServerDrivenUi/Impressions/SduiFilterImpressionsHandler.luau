local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local filterImpressionsEvent = require(parent.GameFilters).filterImpressionsEvent
local sduiErrors = require(parent.SduiCoreSystem).SduiErrors

return function(p0, p1, p2, p3, _)
	-- upvalues: sduiErrors (ref), filterImpressionsEvent (ref)
	if not p3 then
		p0.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogFilterImpressions, {
			name = "SduiFilterImpressionsHandler",
			message = "Missing collectionAnalyticsData"
		}, p0.appPage)
		
		return
	elseif #p1 == 0 or #p2 == 0 then return end
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	
	for i, v in p1 do
		local var4 = p2[v]
		
		if var4 then
			table.insert(t, v)
			table.insert(t_1, var4.filterId or var4.id)
			table.insert(t_2, var4.selectedOptionId or "")
			table.insert(t_3, var4.selectedOptionContextTag or "0")
		else
			p0.dependencies.logger.reportError(sduiErrors.SduiErrorType.FailedToLogFilterImpressions, {
				name = "SduiFilterImpressionsHandler",
				message = `Missing itemData at index {v}`
			}, p0.appPage)
		end
	end
	if #t_1 == 0 then
		return
	end
	filterImpressionsEvent(p0.dependencies.eventIngest, p0.appPage, {
		absPositions = table.concat(t, ","),
		filterIds = table.concat(t_1, ","),
		selectedOptionIds = table.concat(t_2, ","),
		selectedOptionContextTags = table.concat(t_3, ","),
		gameSetTypeId = tostring(p3.collectionId),
		gameSetTargetId = p3.gameSetTargetId,
		sortPos = p3.collectionPosition
	})
end