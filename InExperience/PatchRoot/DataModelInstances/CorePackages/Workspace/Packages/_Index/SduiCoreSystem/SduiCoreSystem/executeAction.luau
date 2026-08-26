local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local logActionTelemetryModule = require(sduiCoreSystem.Analytics.logActionTelemetry)
local _ = require(sduiCoreSystem.SduiActionType)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local getSduiActionHandlerRegistryModule = require(sduiCoreSystem.getSduiActionHandlerRegistry)
local fFlagSduiChartsSupport = require(parent.SharedFlags).FFlagSduiChartsSupport

return function(p1, p2, p3, p4)
	-- upvalues: getSduiActionHandlerRegistryModule (ref), logActionTelemetryModule (ref), fFlagSduiChartsSupport (ref)
	if not p1 then return end
	assert(p1, "actionConfig must exist")
	local actionHandlerConfig = getSduiActionHandlerRegistryModule().getActionHandlerConfig(p1.actionType)
	
	if not actionHandlerConfig then return end
	assert(actionHandlerConfig, "actionHandlerConfig must exist")
	logActionTelemetryModule(p1.telemetryHandler, actionHandlerConfig, p1, p2, p3)
	
	if actionHandlerConfig.handler then
		if fFlagSduiChartsSupport then
			return actionHandlerConfig.handler(p1, p2, p3, p4)
		end
		actionHandlerConfig.handler(p1, p2, p3, p4)
	end
end