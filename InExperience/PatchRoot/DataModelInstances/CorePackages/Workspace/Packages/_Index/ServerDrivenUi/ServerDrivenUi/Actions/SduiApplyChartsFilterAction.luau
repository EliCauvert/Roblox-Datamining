local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiLoadTimer = require(parent.SduiSharedUtilities).SduiLoadTimer
local getSduiClientPageScope = sduiCoreSystemModule.getSduiClientPageScope
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

return function(p1, _, p2)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), parent (ref), getSduiClientPageScope (ref), sduiLoadTimer (ref)
	local var1 = if p1 then p1.actionParams else nil
	
	if var1 == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.ApplyChartsFilter
		}, p2.appPage)
		
		return
	elseif p2.configKey == nil then
		p2.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing sduiContext.configKey; filter selections cannot be persisted in client page scope",
			name = sduiActionType.ApplyChartsFilter
		}, p2.appPage)
		
		return
	end
	local chartsModule = require(parent.Charts)
	getSduiClientPageScope(p2.configKey).set(chartsModule.ChartsPageScopeFields.FilterSelections, var1.filterSelections)
	local chartsPage = sduiLoadTimer.createLoadTimer("ChartsPage")
	chartsPage.start("filter_refetch")
	local var2 = chartsModule.fetchChartsPage(chartsPage, true)
	
	if var2 then
		var2:finally(function()
			-- upvalues: chartsPage (ref)
			chartsPage.logRefreshComplete()
		end)
	end
	return var2
end