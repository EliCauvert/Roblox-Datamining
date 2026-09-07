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

return function(p1, p2, p3, p4)
	-- upvalues: getSduiActionHandlerRegistryModule (ref), fFlagSduiActionTelemetryHandler (ref), logActionTelemetryModule (ref), reportUnifiedLoggingActionModule (ref), fFlagSduiChartsSupport (ref)
	if not p1 then return end
	assert(p1, "actionConfig must exist")
	local actionHandlerConfig = getSduiActionHandlerRegistryModule().getActionHandlerConfig(p1.actionType)
	
	if not actionHandlerConfig then return end
	assert(actionHandlerConfig, "actionHandlerConfig must exist")
	
	if fFlagSduiActionTelemetryHandler then
		logActionTelemetryModule(p1.telemetryHandler, actionHandlerConfig, p1, p2, p3)
	elseif not actionHandlerConfig.skipUnifiedLogging then
		reportUnifiedLoggingActionModule(p3, p1, p2)
	end
	if actionHandlerConfig.handler then
		if fFlagSduiChartsSupport then
			return actionHandlerConfig.handler(p1, p2, p3, p4)
		end
		actionHandlerConfig.handler(p1, p2, p3, p4)
	end
end