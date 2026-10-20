local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local NavigateToChartsSortDetailPageFunction = require(Parent.Charts).navigateToChartsSortDetailPage
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), NavigateToChartsSortDetailPageFunction (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.OpenChartsSortDetail
		}, p2.appPage)
		
		return
	end
	local SortId = ActionParams.sortId or ActionParams.sort_id
	
	if SortId == nil or SortId == "" then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing sortId",
			name = SduiActionType.OpenChartsSortDetail
		}, p2.appPage)
		
		return
	else
		NavigateToChartsSortDetailPageFunction(p2.dependencies.getNavigation(), { sortId = SortId, pageContext = p2.appPage })
	end
end