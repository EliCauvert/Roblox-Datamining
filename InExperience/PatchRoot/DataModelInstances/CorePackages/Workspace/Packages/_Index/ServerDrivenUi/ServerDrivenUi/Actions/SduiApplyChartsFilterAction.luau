local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiLoadTimer = require(parent.SduiSharedUtilities).SduiLoadTimer
local getSduiClientPageScope = sduiCoreSystemModule.getSduiClientPageScope
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType

return function(p0, _, p1) --[[ line: 15 ]]
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), parent (ref), getSduiClientPageScope (ref), sduiLoadTimer (ref)
	local var1 = if p0 then p0.actionParams else nil
	
	if var1 == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.ApplyChartsFilter
		}, p1.appPage)
		
		return
	elseif p1.configKey == nil then
		p1.dependencies.logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing sduiContext.configKey; filter selections cannot be persisted in client page scope",
			name = sduiActionType.ApplyChartsFilter
		}, p1.appPage)
		
		return
	end
	local chartsModule = require(parent.Charts)
	getSduiClientPageScope(p1.configKey).set(chartsModule.ChartsPageScopeFields.FilterSelections, var1.filterSelections)
	local chartsPage = sduiLoadTimer.createLoadTimer("ChartsPage")
	chartsPage.start("filter_refetch")
	local var4 = chartsModule.fetchChartsPage(chartsPage, true)
	
	if var4 then
		var4:finally(function() --[[ line: 46 ]]
			-- upvalues: chartsPage (ref)
			chartsPage.logRefreshComplete()
		end)
	end
	return var4
end