local Parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local SduiCoreSystemModule = require(Parent.SduiCoreSystem)
local SduiErrorType = SduiCoreSystemModule.SduiErrors.SduiErrorType
local SduiActionType = SduiCoreSystemModule.SduiActionType
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local GetSduiClientPageScopeFunction = SduiSharedUtilitiesModule.getSduiClientPageScope
local SduiSurfaceLoadTimeTracker = SduiSharedUtilitiesModule.SduiSurfaceLoadTimeTracker
local Milestone = require(Parent.TimeToInteractiveTracker).TimeToInteractiveTracker.Milestone

return function(p1, _, p2, _)
	-- upvalues: SduiErrorType (copy), SduiActionType (copy), GetSduiClientPageScopeFunction (copy), SduiSurfaceLoadTimeTracker (copy), Milestone (copy)
	local Logger = p2.dependencies and p2.dependencies.logger
	local ConfigKey = p2.configKey
	local ActionParams = p1 and p1.actionParams
	
	if ActionParams and ConfigKey then
		local GetResult = GetSduiClientPageScopeFunction(ConfigKey).get(SduiSurfaceLoadTimeTracker.SURFACE_LOAD_TIME_PAGE_SCOPE_KEY)
		
		if GetResult then
			local Milestone1 = ActionParams.milestone
			
			if typeof(Milestone1) == "string" then
				local Metadata = if typeof(ActionParams.metadata) == "table" then ActionParams.metadata else nil
				
				if Milestone1 == Milestone.SurfaceReady then
					GetResult.trackSurfaceReady(Metadata)
					
					return
				else
					GetResult.trackOnce(Milestone1)
					
					return
				end
			elseif Logger then
				Logger.reportError(SduiErrorType.InvalidActionParams, {
					name = SduiActionType.ReportSurfaceLoadTimeMilestone,
					message = `Missing or invalid milestone param, got {typeof(Milestone1)}`
				}, p2.appPage)
			end
			return
		elseif Logger then
			Logger.reportError(SduiErrorType.InvalidActionParams, {
				name = SduiActionType.ReportSurfaceLoadTimeMilestone,
				message = `No surface load timer in page scope for configKey={ConfigKey}`
			}, p2.appPage)
		end
		return
	elseif Logger then
		Logger.reportError(SduiErrorType.InvalidActionParams, {
			message = "Missing actionParams",
			name = SduiActionType.ReportSurfaceLoadTimeMilestone
		}, p2.appPage)
	end
end