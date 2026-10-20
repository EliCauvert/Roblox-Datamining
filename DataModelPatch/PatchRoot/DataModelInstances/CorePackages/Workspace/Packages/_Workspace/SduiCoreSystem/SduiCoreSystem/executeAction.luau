local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local LogActionTelemetryModule = require(SduiCoreSystem.Analytics.logActionTelemetry)
local ReportUnifiedLoggingActionModule = require(SduiCoreSystem.Analytics.reportUnifiedLoggingAction)
local _ = require(SduiCoreSystem.SduiActionType)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local GetSduiActionHandlerRegistryModule = require(SduiCoreSystem.getSduiActionHandlerRegistry)
local FFlagSduiChartsSupport = require(Parent.SharedFlags).FFlagSduiChartsSupport
local FFlagSduiActionTelemetryHandler = require(Parent.SharedFlags).FFlagSduiActionTelemetryHandler

return function(p1, p2, p3, p4)
	-- upvalues: GetSduiActionHandlerRegistryModule (copy), FFlagSduiActionTelemetryHandler (copy), LogActionTelemetryModule (copy), ReportUnifiedLoggingActionModule (copy), FFlagSduiChartsSupport (copy)
	if not p1 then return end
	assert(p1, "actionConfig must exist")
	local ActionHandlerConfig = GetSduiActionHandlerRegistryModule().getActionHandlerConfig(p1.actionType)
	
	if not ActionHandlerConfig then return end
	assert(ActionHandlerConfig, "actionHandlerConfig must exist")
	
	if FFlagSduiActionTelemetryHandler then
		LogActionTelemetryModule(p1.telemetryHandler, ActionHandlerConfig, p1, p2, p3)
	elseif not ActionHandlerConfig.skipUnifiedLogging then
		ReportUnifiedLoggingActionModule(p3, p1, p2)
	end
	if ActionHandlerConfig.handler then
		if FFlagSduiChartsSupport then
			return ActionHandlerConfig.handler(p1, p2, p3, p4)
		end
		ActionHandlerConfig.handler(p1, p2, p3, p4)
	end
end