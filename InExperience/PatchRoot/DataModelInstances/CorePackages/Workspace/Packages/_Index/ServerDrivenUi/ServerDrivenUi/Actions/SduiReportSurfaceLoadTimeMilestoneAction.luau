local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local sduiCoreSystemModule = require(parent.SduiCoreSystem)
local sduiErrorType = sduiCoreSystemModule.SduiErrors.SduiErrorType
local sduiActionType = sduiCoreSystemModule.SduiActionType
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local getSduiClientPageScope = sduiSharedUtilitiesModule.getSduiClientPageScope
local sduiSurfaceLoadTimeTracker = sduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local milestone = require(parent.TimeToInteractiveTracker).TimeToInteractiveTracker.Milestone

return function(p0, _, p1, _)
	-- upvalues: sduiErrorType (ref), sduiActionType (ref), getSduiClientPageScope (ref), sduiSurfaceLoadTimeTracker (ref), milestone (ref)
	local logger = p1.dependencies and p1.dependencies.logger
	local configKey = p1.configKey
	local actionParams = p0 and p0.actionParams
	
	if actionParams and configKey then
		local var4 = getSduiClientPageScope(configKey).get(sduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY)
		
		if var4 then
			local milestone_1 = actionParams.milestone
			
			if typeof(milestone_1) == "string" then
				local var5 = if typeof(actionParams.metadata) == "table" then actionParams.metadata else nil
				
				if milestone_1 == milestone.SurfaceReady then
					var4.trackSurfaceReady(var5)
					
					return
				end
				var4.trackOnce(milestone_1)
				
				return
			elseif logger then
				logger.reportError(sduiErrorType.InvalidActionParams, {
					name = sduiActionType.ReportSurfaceLoadTimeMilestone,
					message = `Missing or invalid milestone param, got {typeof(milestone_1)}`
				}, p1.appPage)
			end
			return
		elseif logger then
			logger.reportError(sduiErrorType.InvalidActionParams, {
				name = sduiActionType.ReportSurfaceLoadTimeMilestone,
				message = `No surface load timer in page scope for configKey={configKey}`
			}, p1.appPage)
		end
		return
	elseif logger then
		logger.reportError(sduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = sduiActionType.ReportSurfaceLoadTimeMilestone
		}, p1.appPage)
	end
end