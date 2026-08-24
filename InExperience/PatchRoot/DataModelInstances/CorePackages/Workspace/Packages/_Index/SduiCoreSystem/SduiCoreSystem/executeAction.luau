local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local logActionTelemetryModule = require(sduiCoreSystem.Analytics.logActionTelemetry)
local reportUnifiedLoggingActionModule = require(sduiCoreSystem.Analytics.reportUnifiedLoggingAction)
local _ = require(sduiCoreSystem.SduiActionType)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local getSduiActionHandlerRegistryModule = require(sduiCoreSystem.getSduiActionHandlerRegistry)
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport
local fFlagSduiActionTelemetryHandler = require(parent.SharedFlags).FFlagSduiActionTelemetryHandler

return function(p0, p1, p2, p3)
	-- upvalues: getSduiActionHandlerRegistryModule (ref), fFlagSduiActionTelemetryHandler (ref), logActionTelemetryModule (ref), reportUnifiedLoggingActionModule (ref), fFlagSduiChartsSupport (ref)
	if not p0 then return end
	assert(p0, "actionConfig must exist")
	local actionHandlerConfig = getSduiActionHandlerRegistryModule().getActionHandlerConfig(p0.actionType)
	
	if not actionHandlerConfig then return end
	assert(actionHandlerConfig, "actionHandlerConfig must exist")
	
	if fFlagSduiActionTelemetryHandler then
		logActionTelemetryModule(p0.telemetryHandler, actionHandlerConfig, p0, p1, p2)
	elseif not actionHandlerConfig.skipUnifiedLogging then
		reportUnifiedLoggingActionModule(p2, p0, p1)
	end
	if actionHandlerConfig.handler then
		if fFlagSduiChartsSupport then
			return actionHandlerConfig.handler(p0, p1, p2, p3)
		end
		actionHandlerConfig.handler(p0, p1, p2, p3)
	end
end