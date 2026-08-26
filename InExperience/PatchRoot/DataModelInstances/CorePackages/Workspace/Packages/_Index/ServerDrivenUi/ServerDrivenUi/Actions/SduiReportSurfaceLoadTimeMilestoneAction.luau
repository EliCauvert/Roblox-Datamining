local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local getSduiClientPageScope = sduiSharedUtilitiesModule.getSduiClientPageScope
local sduiSurfaceLoadTimeTracker = sduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local milestone = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker.Milestone

return function(p1, _, p2, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), getSduiClientPageScope (ref), sduiSurfaceLoadTimeTracker (ref), milestone (ref)
	local logger = p2.dependencies and p2.dependencies.logger
	local configKey = p2.configKey
	local actionParams = p1 and p1.actionParams
	
	if actionParams and configKey then
		local var1 = getSduiClientPageScope(configKey).get(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY)
		
		if var1 then
			local milestone_1 = actionParams.milestone
			
			if typeof(milestone_1) == "string" then
				local var2 = if typeof(actionParams.metadata) == "table" then actionParams.metadata else nil
				
				if milestone_1 == milestone.SurfaceReady then
					var1.trackSurfaceReady(var2)
					
					return
				end
				var1.trackOnce(milestone_1)
				
				return
			elseif logger then
				logger.reportError(sduiErrorType.InvalidActionParams, {
					name = sduiActionType.ReportSurfaceLoadTimeMilestone,
					message = `Missing or invalid milestone param, got {typeof(milestone_1)}`
				}, p2.appPage)
			end
			return
		elseif logger then
			logger.reportError(sduiErrorType.InvalidActionParams, {
				name = sduiActionType.ReportSurfaceLoadTimeMilestone,
				message = `No surface load timer in page scope for configKey={configKey}`
			}, p2.appPage)
		end
		return
	elseif logger then
		logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.ReportSurfaceLoadTimeMilestone
		}, p2.appPage)
	end
end