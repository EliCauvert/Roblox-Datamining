local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiLoadTimer = require(Parent.SduiSharedUtilities).SduiLoadTimer
local GetSduiClientPageScopeFunction = SduiCoreSystemModule.getSduiClientPageScope
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType

return function(p1, _, p2)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), Parent (copy), GetSduiClientPageScopeFunction (copy), SduiLoadTimer (copy)
	local ActionParams = p1 and p1.actionParams or nil
	
	if ActionParams == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.ApplyChartsFilter
		}, p2.appPage)
		
		return
	end
	if p2.configKey == nil then
		p2.dependencies.logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing sduiContext.configKey; filter selections cannot be persisted in client page scope",
			name = SduiActionType.ApplyChartsFilter
		}, p2.appPage)
		
		return
	end
	local ChartsModule = require(Parent.Charts)
	GetSduiClientPageScopeFunction(p2.configKey).set(ChartsModule.ChartsPageScopeFields.FilterSelections, ActionParams.filterSelections)
	local ChartsPage = SduiLoadTimer.createLoadTimer("ChartsPage")
	ChartsPage.start("filter_refetch")
	local ChartsPage1 = ChartsModule.fetchChartsPage(ChartsPage, true)
	
	if ChartsPage1 then
		ChartsPage1:finally(function()
			-- upvalues: ChartsPage (copy)
			ChartsPage.logRefreshComplete()
		end)
	end
	return ChartsPage1
end