local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local navigateToChartsSortDetailPage = require(parent.Charts).navigateToChartsSortDetailPage
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), navigateToChartsSortDetailPage (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenChartsSortDetail
		}, p2.appPage)
		
		return
	end
	local sortId = var1.sortId or var1.sort_id
	
	if sortId == nil or sortId == "" then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing sortId",
			name = sduiActionType.OpenChartsSortDetail
		}, p2.appPage)
		
		return
	end
	navigateToChartsSortDetailPage(p2.dependencies.getNavigation(), { sortId = sortId, pageContext = p2.appPage })
end