local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local navigateToChartsSortDetailPage = require(parent.Charts).navigateToChartsSortDetailPage
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

return function(p0, _, p1, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), navigateToChartsSortDetailPage (ref)
	local var1 = if p0 then p0.actionParams else nil
	
	if var1 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.OpenChartsSortDetail
		}, p1.appPage)
		
		return
	end
	local sortId = var1.sortId or var1.sort_id
	
	if sortId == nil or sortId == "" then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing sortId",
			name = sduiActionType.OpenChartsSortDetail
		}, p1.appPage)
		
		return
	end
	navigateToChartsSortDetailPage(p1.dependencies.getNavigation(), { sortId = sortId, pageContext = p1.appPage })
end