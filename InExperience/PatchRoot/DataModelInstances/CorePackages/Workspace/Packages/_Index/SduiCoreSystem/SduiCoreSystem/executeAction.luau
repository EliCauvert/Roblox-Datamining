local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local logActionTelemetryModule = require(sduiCoreSystem.Analytics.logActionTelemetry)
local _ = require(sduiCoreSystem.SduiActionType)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local getSduiActionHandlerRegistryModule = require(sduiCoreSystem.getSduiActionHandlerRegistry)

return function(p1, p2, p3, p4)
	-- upvalues: getSduiActionHandlerRegistryModule (ref), logActionTelemetryModule (ref)
	if not p1 then return end
	assert(p1, "actionConfig must exist")
	local actionHandlerConfig = getSduiActionHandlerRegistryModule().getActionHandlerConfig(p1.actionType)
	
	if not actionHandlerConfig then return end
	assert(actionHandlerConfig, "actionHandlerConfig must exist")
	logActionTelemetryModule(p1.telemetryHandler, actionHandlerConfig, p1, p2, p3)
	
	if actionHandlerConfig.handler then
		return actionHandlerConfig.handler(p1, p2, p3, p4)
	end
end